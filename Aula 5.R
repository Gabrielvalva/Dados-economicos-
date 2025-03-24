# AULA LABORATORIO DADOS ECONOMICOS, AULA ATUAL=5
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

dadospib <- WDI(country = 'all',
               indicator = 'NY.GDP.MKTP.CD')

dadospib2023 <- WDI(country = 'all',
                indicator = 'NY.GDP.MKTP.CD',
                star = 2023, end = 2023)

dadospibbr <- WDI(country = 'BR',
                  indicator = 'NY.GDP.MKTP.CD')

# REFAZER COM NOVA VARIAVEL 
# SITE (WDI BANCO MUNDIAL)=https://databank.worldbank.org/source/world-development-indicators

# Tomadores de empréstimos de bancos comerciais (por 1.000 adultos)(FB.CBK.BRWR.P3)

tomadores <- WDI(country = 'all',
                 indicator = 'FB.CBK.BRWR.P3')







                        
                      
               

