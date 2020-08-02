install.packages("bizdays")
library(bizdays)

#criando calendário com feriados ANBIMA
create.calendar(name = "ANBIMA",holidays = holidaysANBIMA, weekdays = c("saturday","sunday"))

#verificando se uma data é dia util
d1 = as.Date("2017-06-14")
is.bizday(d1,"ANBIMA")
d2 = as.Date("2020-06-14")

#gerando uma sequência de datas através de vetorização
datas = seq(d1,d2, by = "day")

#conferindo quais datas do vetor gerado anteriormente são úteis
is.bizday(datas, "ANBIMA")

#gerando vetor de datas úteis
cal = bizseq(from = d1, to = d2, cal = "ANBIMA")
str(cal)

#retorna o numero de dias uteis entre datas
bizdays(from = d1, to = d2, cal = "ANBIMA")

#avancando (ou recuando) n dias uteis
add.bizdays(as.Date("2018-01-13"), n=-2,"ANBIMA")

#ajustando para data util mais proxima
adjust.next(as.Date("2018-07-13"), "ANBIMA")
adjust.previous(as.Date("2018-01-13"), "ANBIMA")
