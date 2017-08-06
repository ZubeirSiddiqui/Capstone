# Capstone_Scripts_To_Predict_Data.R ####
# Coursera Data Science Capstone Project (https://www.coursera.org/course/dsscapstone)
# Script for predicting a NextWord given an input of any length using stupid backoff algorithm
# Developer: Zubeir Siddiqui
# Date: 6th August 2017

fun.predict = function(str1, n = 10) {
input_word1 = ""
input_word2 = ""
input_word3 = ""
input_word4 = ""

if (length(strsplit(str1,' ')[[1]]) > 0)
{
  input_word4 = word(str1 ,-1)
}

if (length(strsplit(str1,' ')[[1]]) > 1)
{
  input_word3 = word(str1 ,-2)
}

if (length(strsplit(str1,' ')[[1]]) > 2)
{
  input_word2 = word(str1 ,-3)
}

if (length(strsplit(str1,' ')[[1]]) > 3)
{
  input_word1 = word(str1 ,-4)
}

# Predict using stupid backoff algorithm ####

prediction = ""

if(input_word1 == "" & input_word2 == "" & input_word3 == "" & input_word4 == "") 
{
  prediction = head(freq1_data  %>% select(word, freq), n)
  names(prediction)[names(prediction) == 'word'] <- 'word_predict'
  
} else { if(input_word1 == "" & input_word2 == "" & input_word3 == "") 
       {
          prediction = head(freq2_data  %>% filter(word1 %in% input_word4) %>% select(word, word2, freq), n)
          names(prediction)[names(prediction) == 'word2'] <- 'word_predict'
  
       } else { if(input_word1 == "" & input_word2 == "")
                {
                  prediction = head(freq3_data  %>% filter(word2 %in% input_word4 & word1 %in% input_word3) %>% select(word, word3, freq), n)
                  names(prediction)[names(prediction) == 'word3'] <- 'word_predict'
                  
                } else { if(input_word1 == "")
                         {
                           prediction = head(freq4_data  %>% filter(word3 %in% input_word4 & word2 %in% input_word3 & word1 %in% input_word2) %>% select(word, word4, freq), n)
                           names(prediction)[names(prediction) == 'word4'] <- 'word_predict'
                           
                         } else {
                                prediction = head(freq5_data  %>% filter(word4 %in% input_word4 & word3 %in% input_word3 & word2 %in% input_word2 & word1 %in% input_word1) %>% select(word, word5, freq), n)
                                names(prediction)[names(prediction) == 'word5'] <- 'word_predict'
                                }
                       }
         
              }
}

if(length(prediction$word_predict) == 0 & length(strsplit(str1,' ')[[1]]) > 3) 
{
  prediction = head(freq2_data  %>% filter(word1 %in% input_word4) %>% select(word, word2, freq), n)
  names(prediction)[names(prediction) == 'word2'] <- 'word_predict'
  
  prediction = head(freq3_data  %>% filter(word2 %in% input_word4 & word1 %in% input_word3) %>% select(word, word3, freq), n)
  names(prediction)[names(prediction) == 'word3'] <- 'word_predict'
  
  prediction = head(freq4_data  %>% filter(word3 %in% input_word4 & word2 %in% input_word3 & word1 %in% input_word2) %>% select(word, word4, freq), n)
  names(prediction)[names(prediction) == 'word4'] <- 'word_predict'
  
  prediction = head(freq5_data  %>% filter(word4 %in% input_word4 & word3 %in% input_word3 & word2 %in% input_word2 & word1 %in% input_word1) %>% select(word, word5, freq), n)
  names(prediction)[names(prediction) == 'word5'] <- 'word_predict'
} 

if(length(prediction$word_predict) == 0 & length(strsplit(str1,' ')[[1]]) > 2) 
{
  prediction = head(freq2_data  %>% filter(word1 %in% input_word4) %>% select(word, word2, freq), n)
  names(prediction)[names(prediction) == 'word2'] <- 'word_predict'
  
  prediction = head(freq3_data  %>% filter(word2 %in% input_word4 & word1 %in% input_word3) %>% select(word, word3, freq), n)
  names(prediction)[names(prediction) == 'word3'] <- 'word_predict'
  
  prediction = head(freq4_data  %>% filter(word3 %in% input_word4 & word2 %in% input_word3 & word1 %in% input_word2) %>% select(word, word4, freq), n)
  names(prediction)[names(prediction) == 'word4'] <- 'word_predict'
} 

if(length(prediction$word_predict) == 0 & length(strsplit(str1,' ')[[1]]) > 1) 
{
  prediction = head(freq2_data  %>% filter(word1 %in% input_word4) %>% select(word, word2, freq), n)
  names(prediction)[names(prediction) == 'word2'] <- 'word_predict'
  
  prediction = head(freq3_data  %>% filter(word2 %in% input_word4 & word1 %in% input_word3) %>% select(word, word3, freq), n)
  names(prediction)[names(prediction) == 'word3'] <- 'word_predict'
}

if(length(prediction$word_predict) == 0 & length(strsplit(str1,' ')[[1]]) > 0) 
{
  prediction = head(freq2_data  %>% filter(word1 %in% input_word4) %>% select(word, word2, freq), n)
  names(prediction)[names(prediction) == 'word2'] <- 'word_predict'
}

if(length(prediction$word_predict) == 0) 
{
  prediction = head(freq1_data  %>% select(word, freq), n)
  names(prediction)[names(prediction) == 'word'] <- 'word_predict'
}
return(prediction)
}
