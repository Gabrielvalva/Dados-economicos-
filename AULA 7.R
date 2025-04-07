# AULA LABORATORIO DADOS ECONOMICOS, AULA ATUAL=7
# (ctrl+shift+enter) EXECUTA TODO O ARQUIVO
# (ctrl+enter) EXECUTA A LINHA 

a <- 1 + 1
# PACOTE TIDYVERSE
#install.packages("tidyverse")
library(tidyverse) #carregarbiblioteca 

# WDI - WORLD DEVELOPMENT INDICATORS 
# BASE DE DADOS DO BANCO MUNDIAL 

#install.packages("WDI")
library(WDI) 

# SEMPRE PROCUREM AS VIGNETTES 
# PÁGINAS COM ORIENTAÇÕES DOS PACOTES 

# BAIXAR OS DADOS DO PIB(PRODUTO INTERNO BRUTO) 
# TUDO QUE É PRODUZIDO EM UM PAÍS/ESTADO/MUN.
# EM UM DETERMINADO PERÍODO 

# GDP (US$ corrente)(NY.GDP.MKTP.CD)
# GROSS DOMESTIC PRODUCT (GDP) EM DÓLARES NORTE-AMERICANO 
# CÓDIGO NY.GDP.MKTP.CD

COD_GDP <- WDIsearch('gdp')
# É IMPORTANTE PROCURAR PELO PRÓPRIO
# SITE DO BANCO MUNDIAL( wdi banco mundial), É MAIS 
# EFICIENTE 

#COM O CÓDIGO, VAMOS BAIXAR OS DADOS 

options(scipen = 999) # AJUSTAR NÚMEROS (NOT.CIENT.)
basepib <- WDI(country = 'all',
               indicator = 'NY.GDP.MKTP.CD')
basepib2023 <- WDI(country = 'all',
                   indicator = 'NY.GDP.MKTP.CD',
                   start = 2023, end = 2023)

# API (FORMA DE ACESSO)
# DADOS DO BANCO MUNDIAL (WORLD BANK)
# WORLD DEVELOPMENT INDICATORS (BASE DE DADOS)

# NA AULA PASSADA, ACESSAMOS OS DADOS DO PIB
# PRODUTO INTERNO BRUTO 

library(WDI) # CARREGAR A BIBLIOTECA/PACOTE 

options(scipen = 999) # AJUSTAR NÚMEROS (NOT.CIENT.)

# DADOS E, PAINEL 
dadospib <- WDI(country = 'all',
               indicator = 'NY.GDP.MKTP.CD')

# CORTE TRANSVERSAL
dadospib2023 <- WDI(country = 'all',
                indicator = 'NY.GDP.MKTP.CD',
                star = 2023, end = 2023)

# SÉRIE TEMPORAL  
dadospibbr <- WDI(country = 'BR',
                  indicator = 'NY.GDP.MKTP.CD')

# REFAZER COM NOVA VARIAVEL 
# SITE (WDI BANCO MUNDIAL)=https://databank.worldbank.org/source/world-development-indicators

# Exportações de matérias-primas agrícolas (% das exportações de mercadorias)(TX.VAL.AGRI.ZS.UN)
# DADOS EM PAINEL 
exportacoesmateriaprima <- WDI(country = 'all',
                               indicator = 'TX.VAL.AGRI.ZS.UN')
# CORTE TRANSVERSAL 
exportacoesmateriaprima2 <- WDI(country = 'all',
                               indicator = 'TX.VAL.AGRI.ZS.UN',
                               star = 2020,end = 2024)
# SÉRIE TEMPORAL
exportacoesmateriaprima3<- WDI(country = 'BR',
                               indicator = 'TX.VAL.AGRI.ZS.UN')


# FAZER GRÁFICOS 
# gglot2 (faz parte do pacote tidyverse)

library(tidyverse)

# DADOS EM PAINEL 
grafpainel <- ggplot(dadospib,
                    mapping = aes(y = NY.GDP.MKTP.CD,
                                  x = year)) +
  geom_point()
print(grafpainel)

# CORTE TRANSVERSAL
grafcorte <- ggplot(dadospib2023,
                     mapping = aes(y = NY.GDP.MKTP.CD,
                                   x = year)) +
  geom_point()
print(grafcorte)

# SÉRIE TEMPORAL  
grafserie <- ggplot(dadospib2023,
                    mapping = aes(y = NY.GDP.MKTP.CD,
                                  x = year)) +
  geom_line()
print(grafserie)

# FAZER OS PROPIO GRAFICO 
# DADOS EM PAINEL 
grafexportpainel <- ggplot(exportacoesmateriaprima, 
                           mapping = aes(x = year, y = TX.VAL.AGRI.ZS.UN)) + 
  geom_bar(stat = "identity") +  # Usar barras em vez de pontos
  labs(title = "Quantidade de Exportações de Matéria Prima por Ano", 
       x = "Ano", 
       y = "Quantidade")  # Alterar rótulos e adicionar título
print(grafexportpainel)

# CORTE TRANSVERSAL
grafexportcorte <- ggplot(exportacoesmateriaprima2,
                          mapping = aes(x = year, y = TX.VAL.AGRI.ZS.UN)) + 
  geom_bar(stat = "identity") +  # Usar barras em vez de pontos
  labs(title = "Quantidade de Exportações de Matéria Prima por Ano", 
       x = "Ano", 
       y = "Quantidade")  # Alterar rótulos e adicionar título
print(grafexportcorte)
# SÉRIE TEMPORAL
grafexportserie <- ggplot(exportacoesmateriaprima3,
                          mapping = aes(x = year, y = TX.VAL.AGRI.ZS.UN)) + 
  geom_bar(stat = "identity", fill = "green") +  # Barras verdes
  labs(title = "Quantidade de Exportações de Matéria Prima por Ano", 
       x = "Ano", 
       y = "Quantidade")  # Ajustar rótulos e adicionar título
print(grafexportserie)
#DEU CERTO O GRAFICO

  



                        
                      
               

