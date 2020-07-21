# VETORES

# Criando
v1 = c(10, 20, 30, 40) # concatena (junta) os elementos em um vetor
v2 = 1:4               # atalho para criar vetor com sequencias

# Lendo
v1[1]
v1[3]
v1[c(2,4)] #é obrigatório passar um vetor para solicitar mais de uma posição do vetor
v1[c(TRUE, FALSE, TRUE, TRUE)] # filtrando por um vetor lógico
v1[v1 > 25] #a parte interna retorna um valor lógico. Colocando isso dentro das chaves,
#ele passa um vetor lógico no vetor v1 e retorna os valores true

# Modificando
v1[3] = 35
v1
v1[v1 < 30] = 0
v1

# Vetorizacao
v1 = c(10, 20, 30, 40)
v2  = 1:4
length(v1)
length(v2)

#as operações são feitas item a item
v1 + v2
v1 * v2

# Operacoes com escalares
v1-2
v1^2
v1/10
