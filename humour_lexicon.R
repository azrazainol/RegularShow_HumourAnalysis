## 1. load & integrate datasets

# load datasets
humour1 <- read.csv("data/humour1.csv")
# humour1.csv : https://www.kaggle.com/datasets/eswarreddy12/family-guy-dialogues-with-various-lexicon-ratings/data?select=GPT_lex11.csv
humour2 <- read.csv("data/humour2.csv")
# humor2.csv : https://github.com/tomasengelthaler/HumorNorms

humour2 <- humour2[,1:2]
humour2[,2] <- humour2[,2] * 2 #to match the levels in this dataframe with the levels in the 1st dataframe

# find common words
common_words <- intersect(humour1$Word, humour2$word)
common_words

# integrate the datasets
humour1 <- humour1[!humour1$Word %in% common_words, ]
colnames(humour2) <- c("Word", "Rating")
humour <- rbind(humour1, humour2)
write.csv(humour, "data/humour_combined_20240426.csv")

## 2. creating humour lexicon and 
library(tm)

# create humour lexicon from humour1 & humour2
humour_lexicon <- setNames(humour$Rating, humour$Word)

# tokenize text in corpus object
corpus_tokens <- lapply(regshow1$content, function(text) {
  tolower(unlist(strsplit(text, "\\W+")))
})

# assign humour ratings to tokens
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

# calculate humour level for each line
line_humour_levels <- sapply(corpus_humour_ratings, function(ratings) {
  if (all(is.na(ratings))) {
    return(NA)
  } else {
    return(mean(ratings, na.rm = TRUE))
  }
})

line_humour_levels

## 3. results
# calculate mean humour level
mean_humour_level <- mean(line_humour_levels, na.rm = TRUE)
cat("Mean Humour Level:", mean_humour_level, "\n")

# create histogram for humour levels
hist(line_humour_levels, main = "Humour Levels in Corpus", xlab = "Humour Level", ylab = "Frequency")






