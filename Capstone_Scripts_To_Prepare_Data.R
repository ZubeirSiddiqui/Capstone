## Load CRAN modules 
library(tm)
library(stringi)
library(RWeka)
library(ggplot2)
library(slam)
library(stringr)

options(mc.cores=1)

setwd("C:/Users/zubeir/Desktop/DataScience/capstone")

# Load the twitter data set
con <- file("en_US.twitter.txt", "r") 
lineTwitter<-readLines(con, skipNul = TRUE)
close(con)
data_Twitter.sample <- sample(lineTwitter, length(lineTwitter) * 0.01)

# Load the Blogs data set
con <- file("en_US.Blogs.txt", "r") 
lineBlogs<-readLines(con, skipNul = TRUE)
close(con)
data_Blogs.sample <- sample(lineBlogs, length(lineBlogs) * 0.01)

# Load the News data set
con <- file("en_US.News.txt", "r") 
lineNews<-readLines(con, skipNul = TRUE)
close(con)
data_News.sample <- sample(lineNews, length(lineNews) * 0.01)

# Sample the data
data.sample <- c(data_Twitter.sample, data_Blogs.sample, data_News.sample)

# Create corpus and clean the data
corpus <- VCorpus(VectorSource(data.sample))
toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x))
corpus <- tm_map(corpus, toSpace, "(f|ht)tp(s?)://(.*)[.][a-z]+")
corpus <- tm_map(corpus, toSpace, "@[^\\s]+")
corpus <- tm_map(corpus, tolower)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, PlainTextDocument)
unicorpus <- tm_map(corpus, removeWords, stopwords("en"))

##Exploratory Analysis
# we'll get the frequencies of the word
getFreq <- function(tdm) {
  freq <- sort(rowSums(as.matrix(tdm)), decreasing = TRUE)
  return(data.frame(word = names(freq), freq = freq))
}

# Prepare n-gram frequencies
getFreq <- function(tdm) {
  freq <- sort(rowSums(as.matrix(rollup(tdm, 2, FUN = sum)), na.rm = T), decreasing = TRUE)
  return(data.frame(word = names(freq), freq = freq))
}
bigram <- function(x) NGramTokenizer(x, Weka_control(min = 2, max = 2))
trigram <- function(x) NGramTokenizer(x, Weka_control(min = 3, max = 3))
quadgram <- function(x) NGramTokenizer(x, Weka_control(min = 4, max = 4))
pentagram <- function(x) NGramTokenizer(x, Weka_control(min = 5, max = 5))

# Get frequencies of most common n-grams in data sample
freq1 <- getFreq(removeSparseTerms(TermDocumentMatrix(unicorpus), 0.999))
saveRDS(freq1, file="freq1.rds")
rm(freq1)
freq2 <- getFreq(TermDocumentMatrix(unicorpus, control = list(tokenize = bigram, bounds = list(global = c(5, Inf)))))
saveRDS(freq2, file="freq2.rds")
rm(freq2)
freq3 <- getFreq(TermDocumentMatrix(corpus, control = list(tokenize = trigram, bounds = list(global = c(3, Inf)))))
saveRDS(freq3, file="freq3.rds")
rm(freq3)
freq4 <- getFreq(TermDocumentMatrix(corpus, control = list(tokenize = quadgram, bounds = list(global = c(2, Inf)))))
saveRDS(freq4, file="freq4.rds")
rm(freq4)
freq5 <- getFreq(TermDocumentMatrix(corpus, control = list(tokenize = pentagram, bounds = list(global = c(2, Inf)))))
saveRDS(freq5, file="freq5.rds")
rm(freq5)

