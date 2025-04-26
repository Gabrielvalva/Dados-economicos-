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
                               indicator = 'TX.VAL.AGRI.ZS.UN',
                               star = 2014, end = 2024)


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
                           aes(x = year, y = TX.VAL.AGRI.ZS.UN)) + 
  geom_bar(stat = "identity", fill = "steelblue") +  # Colore as barras de azul
  labs(title = "Quantidade de Exportações de Matéria Prima por Ano", 
       x = "Ano", 
       y = "Quantidade") +
  theme_minimal() +  # Tema limpo e moderno
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),  # Centraliza e estiliza o título
    axis.title.x = element_text(size = 12, face = "bold"),             # Eixo X
    axis.title.y = element_text(size = 12, face = "bold"),             # Eixo Y
    axis.text.x = element_text(angle = 45, hjust = 1)                  # Inclina rótulos do eixo X
  )

print(grafexportpainel)

# CORTE TRANSVERSAL
grafexportcorte <- ggplot(exportacoesmateriaprima2, 
                          aes(x = year, y = TX.VAL.AGRI.ZS.UN)) +
  geom_bar(stat = "identity", fill = "steelblue") +  # Adiciona cor nas barras
  labs(
    title = "Exportações de Matéria-Prima ao Longo dos Anos",  # Novo título
    x = "Ano", 
    y = "Quantidade Exportada"
  ) +
  theme_minimal() +  # Deixa o gráfico com um estilo mais limpo
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),  # Centralizar e destacar o título
    axis.title = element_text(size = 14),
    axis.text = element_text(size = 12)
  )

print(grafexportcorte)

# SÉRIE TEMPORAL

grafexportserie <- ggplot(exportacoesmateriaprima3, 
                          aes(x = factor(year), y = TX.VAL.AGRI.ZS.UN)) + 
  geom_bar(stat = "identity", fill = "#0072B2", width = 0.7) +
  geom_text(aes(label = round(TX.VAL.AGRI.ZS.UN, 1)),  # Adiciona os números no topo das barras
            vjust = -0.5, size = 4, color = "black") +  # Ajuste vertical e cor do texto
  labs(
    title = "Evolução Anual das Exportações de Matéria-Prima no Brasil",  # Novo título
    x = "Ano", 
    y = "Quantidade Exportada"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 18, face = "bold", color = "#003366"),
    axis.title.x = element_text(margin = margin(t = 10)),
    axis.title.y = element_text(margin = margin(r = 10)),
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank()
  )

print(grafexportserie)

#DEU CERTO O GRAFICO

### AVALIAÇAO ###
# CRIAR UM DOCUMENTO HTML EM QUARTO
# ISTO É, UMA PÁGINA DE INTERNET COM SEUS GRÁFICOS 

# 1o PASSO
# INSTALAR O PACOTE QUARTO
#install.packages('quarto')
library('quarto')

  
# 2o PASSO 
# CRIAR O DOCUMENTO('RENDER')

#3o PASSO
# EDITAR O ARQUIVO
## ALTERAR O TÍTULO (title) PARA O SEU NOME
## MODIFICAR A PARTE (R chunk) DAS BIBLIOTECAS
##  ADICIONAR O CARREGAMENTO DOS DADOS 


                        
                      
               

