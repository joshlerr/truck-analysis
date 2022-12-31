
library(dplyr)
library(tidyverse)
library(readxl)
library(lubridate)
rm(list = ls())

setwd("~/Data331/r project/chapter1")
df_case1<- read_excel("NP_EX_1-2.xlsx", skip = 3, .name_repair = "universal", 
                      sheet = "Sheet1")


df <- df_case1 %>%
  dplyr::select(-"Summary", -"...2", -"...3", -"...10")

df$Date <- as.Date(df$Date, format = "%m/%d/y")

total_hours_driving <- sum(df$Hours)

df$total_hours_driving <- total_hours_driving

df$days_driving <- df$Date[21] - df$Date[1]
