library(RSQLite)

#conectar ao BD
conn = dbConnect(dbDriver("SQLite"),"carteira.sqlite")
conn

df = dbGetQuery(conn, "SELECT * FROM Estoque WHERE data = '2018-06-15'")
df
str(df)

rows = dbExecute(conn,"INSERT INTO Estoque (preco,quantidade,vencimento,papel,data)VALUES (3150.208525,540,'2040-08-15','NTN-C','2018-06-15')")
rows

rows = dbExecute(conn,"DELETE FROM Estoque WHERE id = 6")
rows
