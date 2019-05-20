#library(dplyr)
setwd("C:/Capstone/Coursera-SwiftKey/final/en_US/test")

#ug <- readRDS("data_1gram.RDS")
bg <- readRDS("data_2gram.RDS")
tg <- readRDS("data_3gram.RDS")
qg <- readRDS("data_4gram.RDS")
pg <- readRDS("data_5gram.RDS")

predict5gram <- function(x)
{
  swords <- unlist(strsplit(x," "))
  poutput <- pg[pg$word1==swords[1]&pg$word2==swords[2]&pg$word3==swords[3]&pg$word4==swords[4],]$word5
  if (length(poutput) == 0)
  {
    qoutput <- qg[qg$word1==swords[2]&qg$word2==swords[3]&qg$word3==swords[4],]$word4
    
    if (length(qoutput) == 0)
    {
      toutput <- tg[tg$word1==swords[3]&tg$word2==swords[4],]$word3
      if (length(toutput) == 0)
      {
        boutput <- bg[bg$word1==swords[4],]$word2
        if(length(boutput) == 0)
        {
          return("No probable word found")
        }
        return(as.character(boutput))
        
      }
      return(as.character(toutput))
    }
    return(as.character(qoutput))
  }
  
  
return(as.character(poutput))
  
}

predict4gram <- function(x)
{
  swords <- unlist(strsplit(x," "))
  qoutput <- head(qg[qg$word1==swords[1]&qg$word2==swords[2]&qg$word3==swords[3],]$word4,1)
  if(length(qoutput) == 0)
  {
    toutput <- head(tg[tg$word1==swords[2]&tg$word2==swords[3],]$word3,1)
    if(length(toutput)==0)
    {
      boutput <- head(bg[bg$word1==swords[2],]$word2,1)
      if(length(boutput) == 0)
      {
        return("No probable word found")
      }
      return(as.character(boutput))
    } 
    else
    {
      return(as.character(toutput))
    }
  }
  return(as.character(qoutput))
  
}
predict3gram <- function(x)
{
  swords <- unlist(strsplit(x," "))
  toutput <- head(tg[tg$word1==swords[1]&tg$word2==swords[2],]$word3,1)
  if(length(toutput)==0)
  {
    boutput <- head(bg[bg$word1==swords[2],]$word2,1)
    if(length(boutput) == 0)
    {
      return("No probable word found")
    }
    return(as.character(boutput))
  }
  return(as.character(toutput))
}

predict2gram <- function(x)
{
  boutput <- head(bg[bg$word1==x,]$word2,1)
  if(length(boutput)== 0)
  {
    return("No probable word found")
  }
  return(as.character(boutput))
}
