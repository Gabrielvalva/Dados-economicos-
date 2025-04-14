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
                               star = 2000, end = 2024)


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
grafexportserie <- ggplot(exportacoesmateriaprima3, aes(x = as.factor(year), y = TX.VAL.AGRI.ZS.UN)) +
  
  # Barras com cores mais agradáveis, bordas e espaçamento
  geom_bar(stat = "identity", fill = "#4C9A2A", color = "black", width = 0.6, size = 0.6) +
  
  # Texto em cima das barras, com espaçamento ideal e cor destacada
  geom_text(
    aes(label = comma(TX.VAL.AGRI.ZS.UN)),
    vjust = -0.5,                     # Ajuste de altura para evitar sobreposição
    size = 5,                          # Tamanho ideal para visibilidade
    fontface = "bold", 
    color = "#1D2F18"
  ) +
  
  # Eixo Y com separadores de milhar e espaço extra no topo
  scale_y_continuous(
    labels = comma, 
    expand = expansion(mult = c(0, 0.2))  # Aumenta o espaço superior
  ) +
  
  # Adicionar título e rótulos de forma clara e elegante
  labs(
    title = "Exportações de Matéria Prima no Brasil por Ano",
    subtitle = "Dados de exportação de matéria prima ao longo dos anos.",
    x = "Ano", 
    y = "Quantidade Exportada (%)"
  ) +
  
  # Estilo de tema refinado para maior legibilidade
  theme_minimal(base_size = 16) +
  theme(
    plot.title = element_text(hjust = 0.5, size = 24, face = "bold", color = "#2A3D34"),
    plot.subtitle = element_text(hjust = 0.5, size = 16, face = "italic", color = "#4C4C4C"),
    axis.title.x = element_text(size = 18, face = "bold", color = "#2A3D34"),
    axis.title.y = element_text(size = 18, face = "bold", color = "#2A3D34"),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 14, color = "#4C4C4C"),
    axis.text.y = element_text(size = 14, color = "#4C4C4C"),
    panel.grid.major.y = element_line(color = "grey85", size = 0.3),
    panel.grid.minor.y = element_blank(),
    panel.grid.major.x = element_blank(),
    plot.margin = margin(20, 20, 20, 20),
    legend.position = "none"
  ) +
  
  # Melhorar a aparência geral do gráfico com margens limpas
  coord_cartesian(clip = "off")  # Evitar corte de rótulos ou números no gráfico

# Esticar visualmente
options(repr.plot.width = 20, repr.plot.height = 8)
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
#EDITAR O ARQUIVO
## ALTERAR O TÍTULO (title) PARA O SEU NOME
## MODIFICAR A PARTE (R chunk) DAS BIBLIOTECAS
##  ADICIONAR O CARREGAMENTO DOS DADOS 


                        
                      
               

