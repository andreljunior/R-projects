
cdi.hoje = function(dt){
  dt <- as.Date(Sys.Date()-1, "%Y-%m-%d")
  url = format(dt, "ftp://ftp.cetip.com.br/MediaCDI/%Y%m%d.txt")
  txt = readLines(url)
  txt = gsub(" ","",txt) #substitui os espa�os por nada
  cdi = as.numeric(txt)/100
  print(dt)
  return(cdi)
}

cdi.data = function(dt){
  dt <- as.Date(dt,"%Y-%m-%d")
  url = format(dt, "ftp://ftp.cetip.com.br/MediaCDI/%Y%m%d.txt")
  txt = readLines(url)
  txt = gsub(" ","",txt)
  cdi = as.numeric(txt)/100
  returnValue(cdi)
  
  #caso eu quisesse fazer download do arquivo:
  #download.file(url, destfile=filename")
  #files = unzip(filename, exdir="Downloads")
  #file.remove(files)
}

cdi.entre.datas = function(dt,dl){
  suppressWarnings(library(bizdays)) #criando calendário com feriados ANBIMA
  create.calendar(name = "ANBIMA",holidays = holidaysANBIMA, weekdays = c("saturday","sunday"))
  
  dt <- adjust.previous(as.Date(dt,"%Y-%m-%d"),"ANBIMA")
  dl <- adjust.previous(as.Date(dl,"%Y-%m-%d"),"ANBIMA")
  vetor.datas = bizseq(from = dt, to = dl, cal = "ANBIMA")
  
  df <- vector()
  for (i in 1:length(vetor.datas)) {
    
    dt <- as.Date(vetor.datas[i],"%Y-%m-%d")
    url = format(dt, "ftp://ftp.cetip.com.br/MediaCDI/%Y%m%d.txt")
    txt = readLines(url)
    txt = gsub(" ","",txt)
    cdi = as.numeric(txt)/100
    returnValue(cdi)
    df= rbind(df,cdi)
  }
  
  plot(vetor.datas,df)
}

cdi.ate.hj= function(dt){
  suppressWarnings(library(bizdays))
  #criando calendário com feriados ANBIMA
  create.calendar(name = "ANBIMA",holidays = holidaysANBIMA, weekdays = c("saturday","sunday"))
  
  dt <- adjust.previous(as.Date(dt,"%Y-%m-%d"),"ANBIMA")
  ult.DI = adjust.previous(add.bizdays(Sys.Date(), n=-1,"ANBIMA"),"ANBIMA")
  vetor.datas = bizseq(from = dt, to = ult.DI, cal = "ANBIMA")
  
  df <- vector()
  for (i in 1:length(vetor.datas)) {
    
    dt <- as.Date(vetor.datas[i],"%Y-%m-%d")
    url = format(dt, "ftp://ftp.cetip.com.br/MediaCDI/%Y%m%d.txt")
    txt = readLines(url)
    txt = gsub(" ","",txt)
    cdi = as.numeric(txt)/100
    returnValue(cdi)
    df= rbind(df,cdi)
  }
  
  plot(vetor.datas,df)
}