#NESSE ARQUIVO NÃO ME IMPORTEI EM USAR STRINGSASFACTORS=FALSE EM TODOS OS DF
#NEM EM CONVERTER OS TIPOS LIDOS ERRONEAMENTE PARA OS CORRETOS


dados = read.csv("carteira.csv")
dados

dados2 = read.csv2("carteira2.csv")
dados2

dados3 = read.csv("carteira2.csv",sep=";")
dados3

#LER ARQUIVOS SEPARADOS POR ESPAÕ DEFINIDO
dados4 = read.table("carteira3.csv", 
                    header=TRUE, 
                    dec=",", 
                    skip=3,
                    stringsAsFactors = FALSE)
dados4
str(dados4)


#LER ARQUIVOS EXCEL
install.packages("readxl")
library(readxl)

dados = read_excel("Dados/carteira.xlsx", sheet = "carteira2")

dados = as.data.frame(dados)
dados$data = as.Date(dados$data)
dados$vencimento = as.Date(dados$vencimento)


#LER XML
install.packages("XML")
library("XML")

doc = xmlParse("carteira3.xml")
doc

root = xmlRoot(doc)

lista.dados = xmlElementsByTagName(root, "dado")

valores = getChildrenStrings(lista.dados[[1]])
valores

dados = data.frame()
for(i in 1:length(lista.dados)){
  
  dado = lista.dados[[i]]
  valores = getChildrenStrings(dado)
  d = as.data.frame(t(valores), stringsAsFactors = FALSE)
  dados = rbind(dados, d)
  
}

dados$id = as.numeric(dados$id)
dados$data = as.Date(dados$data, "%Y-%m-%d")
dados$vencimento = as.Date(dados$vencimento, "%Y-%m-%d")
dados$quantidade = as.numeric(dados$quantidade)
dados$preco = as.numeric(dados$preco)


filhos = xmlChildren(dado)

xmlValue(filhos[[2]])
