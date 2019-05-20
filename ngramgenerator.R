library(stringr)
library(tm)
library(quanteda)

setwd("C:/Capstone/Coursera-SwiftKey/final/en_US")

blogs <- readLines("en_US.blogs.txt",encoding = "UTF-8")

news <- readLines("en_US.news.txt",encoding = "UTF-8")

twitter <- readLines("en_US.twitter.txt",encoding = "UTF-8")

blogs_sample <- sample(blogs,length(blogs)*0.01)

news_sample <- sample(blogs,length(news)*0.01)

twitter_sample <- sample(blogs,length(twitter)*0.01)

sampledata <- c(blogs_sample,news_sample,twitter_sample)

rm(blogs,news,twitter,blogs_sample,news_sample,twitter_sample)

sample_corpus <- VCorpus(VectorSource(sampledata))



sample_corpus <-tm_map(sample_corpus,content_transformer(tolower))
sample_corpus <- tm_map(sample_corpus,removeNumbers)
sample_corpus <- tm_map(sample_corpus,removeWords,stopwords("english"))
sample_corpus <- tm_map(sample_corpus,stripWhitespace)

sample_corpus <- unlist(sample_corpus)

si_dfm <- dfm(sample_corpus,stem=TRUE,verbose=TRUE,remove_punct=TRUE,ngrams=1)

data_si <- sort(colSums(si_dfm),decreasing=TRUE)

si_d <- data.frame(words=names(data_si),frequency=data_si)

saveRDS(si_d,"data_1gram.RDS")


bi_dfm <- dfm(sample_corpus,stem=TRUE,verbose=TRUE,remove_punct=TRUE,ngrams=2)

data_bi <- sort(colSums(bi_dfm),decreasing=TRUE)

bi_d <- data.frame(words=names(data_bi),word1=word(names(data_bi),1,sep='_'), word2=word(names(data_bi),2,sep='_'),frequency=data_bi)


saveRDS(bi_d,"data_2gram.RDS")


tri_dfm <- dfm(sample_corpus,stem=TRUE,verbose=TRUE,remove_punct=TRUE,ngrams=3)

data_tri <- sort(colSums(tri_dfm),decreasing=TRUE)

tri_d <- data.frame(words=names(data_tri),word1=word(names(data_tri),1,sep='_'), word2=word(names(data_tri),2,sep='_'),word3=word(names(data_tri),3,sep='_'),frequency=data_tri)

saveRDS(tri_d,"data_3gram.RDS")


quad_dfm <- dfm(sample_corpus,stem=TRUE,verbose=TRUE,remove_punct=TRUE,ngrams=4)

data_quad <- sort(colSums(quad_dfm),decreasing=TRUE)

quad_d <- data.frame(words=names(data_quad),word1=word(names(data_quad),1,sep='_'), word2=word(names(data_quad),2,sep='_'),word3=word(names(data_quad),3,sep='_'),word4=word(names(data_quad),4,sep='_'),frequency=data_quad)


saveRDS(quad_d,"data_4gram.RDS")

penta_dfm <- dfm(sample_corpus,stem=TRUE,verbose=TRUE,remove_punct=TRUE,ngrams=5)

data_penta <- sort(colSums(penta_dfm),decreasing=TRUE)

penta_d <- data.frame(words=names(data_penta),word1=word(names(data_penta),1,sep='_'), word2=word(names(data_penta),2,sep='_'),word3=word(names(data_penta),3,sep='_'),word4=word(names(data_penta),4,sep='_'),word5=word(names(data_penta),5,sep='_'),frequency=data_penta)


saveRDS(penta_d,"data_5gram.RDS")

