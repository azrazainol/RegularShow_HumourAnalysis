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




## 3. analysis - explain analysis in README.md file and save analysis components in a folder




## 4. results - explain output of analysis






