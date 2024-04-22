humour_csv <- read.csv("data/humour_data.csv")
# humour_dataset.csv : https://www.kaggle.com/datasets/eswarreddy12/family-guy-dialogues-with-various-lexicon-ratings/data?select=GPT_lex11.csv
humor_csv2 <- read.csv("data/humor_dataset.csv")
# humor_dataset.csv : https://github.com/tomasengelthaler/HumorNorms

humor_csv2 <- humor_csv2[,1:2]
humor_csv2[,2] <- humor_csv2[,2] * 2 #to match the levels in this dataframe with the levels in the 1st dataframe

# find common words between the two data frames
common_words <- intersect(humour_csv$Word, humor_csv2$word)
common_words

# justify why we are using the rating from the second dataframe.
# because the first dataframe was based on the family guy show
# meanwhile the second dataframe was based on a study where people rated the level of humour they think a word has

# integrate the dataframes
humour_csv <- humour_csv[!humour_csv$Word %in% common_words, ]
colnames(humor_csv2) <- c("Word", "Rating")
humour <- rbind(humour_csv, humor_csv2)

# creating humour lexicon and 
library(tm)

# Step 1: Create humor lexicon from dataset
humour_lexicon <- setNames(humour$Rating, humour$Word)

# Step 2: Tokenize text in corpus object
corpus_tokens <- lapply(regshow1$content, function(text) {
  tolower(unlist(strsplit(text, "\\W+")))
})

# Step 3: Assign humor ratings to tokens
corpus_humour_ratings <- lapply(corpus_tokens, function(tokens) {
  ratings <- sapply(tokens, function(token) {
    if (token %in% names(humour_lexicon)) {
      return(humour_lexicon[token])
    } else {
      return(NA)
    }
  })
  return(ratings)
})

# Step 4: Calculate overall humor level for each line
line_humour_levels <- sapply(corpus_humour_ratings, function(ratings) {
  if (all(is.na(ratings))) {
    return(NA)
  } else {
    return(mean(ratings, na.rm = TRUE))
  }
})

line_humour_levels

# Calculate mean humor level
mean_humour_level <- mean(line_humour_levels, na.rm = TRUE)
cat("Mean Humour Level:", mean_humour_level, "\n")

# Create histogram for humour levels
hist(line_humour_levels, main = "Humour Levels in Corpus", xlab = "Humor Level", ylab = "Frequency")






