
path = ("C:/Users/andre/Desktop/Diversos/Linguagem R/Curso BDM/Layout")
file = paste0(path,"/tweets.csv")
tweets = read.csv(file, stringsAsFactors = F)
str(tweets)
#GREPL: retorna vetor logical indicando se determinada string casou
#com o padrao
v = c("cama","carro","porta","casa")
grepl(pattern = "ca.a", x=v)

colnames(tweets) = c("date", "user","text")
View(tweets)

View(tweets[grepl("^Sun",tweets$date),])
View(tweets[grepl("^[Jj]ohn",tweets$user),])
View(tweets[grepl("^#\\w",tweets$text),])
View(tweets[grepl("@\\w+",tweets$text),])
View(tweets[grepl("@\\w+",tweets$text) & grepl("#\\w+", tweets$text),]) #tweets com @ E #
View(tweets[grepl("@\\w+",tweets$text) | grepl("#\\w+", tweets$text),]) #tweets com @ OU #
View(tweets[grepl("http://[^ \"]+",tweets$text),"text"]) #url http:

v
gsub(pattern = "a", replacement = "o", v)
gsub("a$","o",v)

