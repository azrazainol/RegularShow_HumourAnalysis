# training sarcasm detection model

library(tm)
#library(caret)

training_df <- read.csv("data/train.csv")
testing_df <- read.csv("data/test.csv")
str(testing_df); str(training_df)

# cleaning
clean_text <- function(text) {
  text <- tolower(text)
  text <- gsub("[[:punct:]]", "", text)
  return(text)
}

training_df$text <- sapply(training_df$text, clean_text)
testing_df$text <- sapply(testing_df$text, clean_text)

##
training_corpus <- Corpus(VectorSource(training_df$text))
training_corpus <- tm_map(training_corpus, content_transformer(tolower))
training_corpus <- tm_map(training_corpus, removePunctuation)
training_corpus <- tm_map(training_corpus, removeNumbers)
training_corpus <- tm_map(training_corpus, stripWhitespace)

dtm <- DocumentTermMatrix(training_corpus)


##
testing_corpus <- Corpus(VectorSource(training_df$text))
testing_corpus <- tm_map(testing_corpus, content_transformer(tolower))
testing_corpus <- tm_map(training_corpus, removePunctuation)
testing_corpus <- tm_map(training_corpus, removeNumbers)
testing_corpus <- tm_map(training_corpus, stripWhitespace)

dtm <- DocumentTermMatrix(training_corpus)



# training model

library(e1071)

svm_model <- svm(labels ~ ., data = as.data.frame(as.matrix(dtm)))


# evaluating model

# Assuming you have labels for testing data
predictions <- predict(svm_model, newdata = as.data.frame(as.matrix(dtm_test)))
confusionMatrix(predictions, testing_df$labels)







