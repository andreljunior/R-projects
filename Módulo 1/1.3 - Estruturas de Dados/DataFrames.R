
# DATA FRAMES

N = 3*4
df = data.frame(
  id = 1:N,
  data = rep(as.Date("2018-01-05") + (1:(N/3)), each = 3), # rep: repete as datas 3x cada
  nome = c("Acoes", "Juros", "Cambio"),                    # esse vetor sera reciclado
  saldo = 1000 + 10*runif(N),                              # runif: aleatorio uniforme de 0 a 1
  mtm = 1000 + 20*runif(N),
  stringsAsFactors = FALSE
)

str(df)

# le pedacos do df
df[1,] #primeira linha
df[-2] #todas as linhas, menos essa
df[,2] #traz essa coluna
df[,"saldo"] #coluna nomeada
df$saldo #usando esse operador, não precisa passar com " "
df[1:5,]
df[1:3, 1:4]
df[df$saldo > 1001,]

# modificar um df
df[1,"nome"] = "Acoes2"
df[df$saldo > 1001,"saldo"] = 1001 #substitui os valores nessa coluna
df$classificacao = "DPV" #cria coluna classificação
df$id = NULL #remove coluna id

df2 = data.frame(
  data = as.Date("2018-01-10"),
  nome = "Acoes",
  saldo = 1010,
  mtm = 1020,
  classificacao = "MAV",
  stringsAsFactors = FALSE
)

df = rbind(df, df2) #junta dois dataframes (precisa ter as mesmas colunas do original)
#a ordem dos dfs dentro do () define quem fica em cima e quem fica embaixo

df = df[df$nome == "Juros",] #filtra apenas as linhas com nome juros
