# global.R ####
# Coursera Data Science Capstone Project (https://www.coursera.org/course/dsscapstone)
# Shiny script for loading data into global environment
# Developer: Zubeir Siddiqui
# Date: 6th August 2017

# Libraries and options ####
library(shiny)
library(dplyr)
library(wordcloud)
library(RColorBrewer)
library(stringr)
library(stringi)
# setwd("C:/Users/zubeir/Desktop/DataScience/capstone/Word_Prediction")
# Load and create frame of freq1 data
freq1 = readRDS("freq1.rds")
freq1_data = freq1
rm(freq1)

# Load and create frame of freq2 data
freq2 = readRDS("freq2.rds")
freq2_data <- data.frame(freq = freq2$freq, word = freq2$word, word1 = str_split_fixed(freq2$word, " ", 2)[,1], word2 = str_split_fixed(freq2$word, " ", 2)[,2])
rm(freq2)

# Load and create frame of freq3 data
freq3 = readRDS("freq3.rds")
freq3_data <- data.frame(freq = freq3$freq, word = freq3$word, word1 = str_split_fixed(freq3$word, " ", 3)[,1], word2 = str_split_fixed(freq3$word, " ", 3)[,2], word3 = str_split_fixed(freq3$word, " ", 3)[,3])
rm(freq3)

# Load and create frame of freq4 data
freq4 = readRDS("freq4.rds")
freq4_data <- data.frame(freq = freq4$freq, word = freq4$word, word1 = str_split_fixed(freq4$word, " ", 4)[,1], word2 = str_split_fixed(freq4$word, " ", 4)[,2], word3 = str_split_fixed(freq4$word, " ", 4)[,3], word4 = str_split_fixed(freq4$word, " ", 4)[,4])
rm(freq4)

# Load and create frame of freq5 data
freq5 = readRDS("freq5.rds")
freq5_data <- data.frame(freq = freq5$freq, word = freq5$word, word1 = str_split_fixed(freq5$word, " ", 5)[,1], word2 = str_split_fixed(freq5$word, " ", 5)[,2], word3 = str_split_fixed(freq5$word, " ", 5)[,3], word4 = str_split_fixed(freq5$word, " ", 5)[,4], word5 = str_split_fixed(freq5$word, " ", 5)[,5])
rm(freq5)

