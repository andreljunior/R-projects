library(stringr)

#str_extract_all: retorna lista com todos os casamentos de uma
#expressao regular sobre um vetor

strings = c("10 e 20","30", "40 ou 50","60")
pattern = "\\d+"

str_extract_all(strings, pattern)[[1]]

str_flatten(strings,"\n") #junta todos em um objeto
m = str_extract_all(str_flatten(strings,"\n"),pattern)[[1]]
m

#str_match_all()
strings = c("20.03","30/03 ou 31/03", "25 04","29.04 e 30.04")
pattern = "(\\d{2})[. /](\\d{2})"

m = str_match_all(str_flatten(strings, "\n"), pattern)[[1]]
m

paste(m[,2],m[,3],sep='/')

tweets = read.csv("tweets.csv", stringsAsFactors = F)

#contar hashtag
textos = paste(tweets$text, collapse = "\n")
m = str_extract_all(textos,"#\\w+")[[1]]
str(m)
length(m)
m = str_to_lower(m) #mudar tudo para minusculas
count = table(m) #contar repetidos
sort(count) #ver em ordem
View(sort(count))
