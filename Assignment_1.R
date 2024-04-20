## 1. data collection - web scraping (regular show season 1 scripts)
library(rvest)
pages<-paste0('https://transcripts.thedealr.net/script.php/regular-show-2010-7Avc/s1/e',1:12)

scrape_transcript <- function(page_url) {
  url <- read_html(page_url)
  nodes <- html_nodes(url, 'span')
  transcript <- html_text(nodes)
  transcript <- transcript[-c(1:3)]  # Remove the first three lines
  return(transcript)
}

season1_l <- do.call("c",lapply(pages, scrape_transcript))
season1 <- season1_l[-1]

writeLines(season1, "season1.txt")



## 2. data cleaning - save cleaned file separate from raw file, explain the raw & cleaned file for future use

library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)
library(syuzhet)
library(ggplot2)
library(stringr)

#import txt file
script1 <- readLines("season1.txt")
str(script1)

#combining separated sentences due to subtitle format
script <- character()
current_sentence <- ""

for (line in script1) {
  if (grepl("[.!?]$", line)) {
    current_sentence <- paste(current_sentence, line, sep = " ")
    script <- c(script, current_sentence)
    current_sentence <- ""
  } else {
    current_sentence <- paste(current_sentence, line, sep = " ")
  }
}

#splitting words/sentences
sentences <- str_extract_all(script, "\\b\\w+\\b.*?[.!?](?=\\s|$)")
sentences <- unlist(sentences)
words <- unlist(str_split(sentences, "\\s+"))

#convert script (chr) to Corpus
regshow <- Corpus(VectorSource(sentences))
class(regshow)
inspect(regshow)

#clean
#toSpace <- content_transformer(function(x, pattern)
#  gsub(pattern,"", x))

regshow1 <- regshow
regshow1 <- tm_map(regshow1, content_transformer(tolower))
regshow1 <- tm_map(regshow1, stripWhitespace)

regshow2 <- regshow1
regshow2 <- tm_map(regshow1, removeNumbers)
regshow2 <- tm_map(regshow1, removeWords, stopwords("english"))
regshow2 <- tm_map(regshow1, removePunctuation)

regshow1_ch <- sapply(regshow1, as.character)
regshow2_ch <- sapply(regshow2, as.character)


## 3. analysis - explain analysis in README.md file and save analysis components in a folder

# Vocabulary Richness: Calculate type-token ratio (TTR)
unique_words <- unique(words)
ttr <- length(unique_words) / length(words)


num_unique_words <- length(unique(tolower(words(corpus))))


# Sentence Length: Calculate average sentence length
sentence_lengths <- sapply(sentences, function(x) length(unlist(str_split(x, "\\s+"))))
avg_sentence_length <- mean(sentence_lengths)

# Readability Metrics: Compute Flesch-Kincaid Grade Level
# refer: https://github.com/trinker/syllable
if (!require("pacman")) install.packages("pacman")
pacman::p_load_gh(
  'trinker/lexicon',
  'trinker/textclean',
  'trinker/textshape',
  'trinker/syllable'
)

words_per_sentence <- sum(sentence_lengths) / length(sentences)
syllables_per_word <- sum(sum_vector(sentences)) / sum(sentence_lengths)
flesch_kincaid_grade_level <- 0.39 * words_per_sentence + 11.8 * syllables_per_word - 15.59


## 4. results - explain output of analysis

# Sentiment Analysis #




# Wordcloud #



# Language Complexity #
# Vocabulary Richness:


# Sentence Length:



# Readability Metrics:







