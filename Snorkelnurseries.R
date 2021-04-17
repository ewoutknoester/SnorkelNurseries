# ------------------------------------------
# Snorkel nurseries pilot
# Asma Kopa, Hamadi Mwamlavya, Ewout Knoester
# Created 17-Apr-2021
# ------------------------------------------

# Set R and packages
rm(list=ls()) # Clear workspace
setwd(dirname(rstudioapi::getActiveDocumentContext()$path)) #Set directory at current directory
library("panelr")   # Long to wide
library(data.table) # transpose data

# Load & organize data
df <- read.csv("Snorkelnurseries.csv", check.names = FALSE, header = TRUE)
df <- df[0:420,] #remove blank rows
df <- long_panel(df, prefix = "", begin = 0, end = 1, label_location = "end") #wide to long format
df <- setDT(df)
df = subset(df, select = -c(id, wave, Width1_cm, Width2_cm))
df$Structure <- factor(df$Structure)
df$Treatment <- factor(df$Treatment)
df$Position <- factor(df$Position)
df$Species <- factor(df$Species)
df$Date <- factor(df$Date)
df$EV <- as.numeric(df$EV)
df$Survival <- as.numeric(df$Survival)
str(df) #Summarry of variables