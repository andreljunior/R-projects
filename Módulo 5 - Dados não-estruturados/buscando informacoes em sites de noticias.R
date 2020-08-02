

ler.uol.noticias = function(){
    library(stringr)
    pattern = paste0(
    "<a href=\"([^\"]*)\" [^>]*>", #url
    ".*?<span [^>]*\\s*([^<]*)\\s*</span>", #fonte de dados
    "\\s*<h3 [^>]*>([^<]*)\\s*</h3>", #texto
    ".*?<time [^>]*>([\\d/]+) ([\\dh]+)" #data e hora
    ) 
  
  url = "https://economia.uol.com.br/ultimas"
  
  txt = readLines(url, warn=F, encoding="UTF-8") #sem UTF-8 os caracteres especiais
  #serão lidos com erro
  
  s = str_flatten(txt,"\n")
  
  m = str_match_all(s, pattern)[[1]]
  
  dados = as.data.frame(m[,-1], stringsAsFactors = F)
  colnames(dados) = c("URL","Fonte","Texto","Data","Hora")
  
  dados$Data = as.Date(dados$Data,"%d/%m/%Y")
  
  return(dados)
}

#se eu usar while=T e sleep o programa vai ficar atualizando periodicamente até eu fechar
#resta aprender a gerar uma UI melhorzinha em R e transformar o scrip em executável
#aí eu posso fazer input de várias urls diferentes e colocar ifs para selecionar
#qual, ou quais, sites que ver as atualizações e terei meu próprio gerenciador de notícias