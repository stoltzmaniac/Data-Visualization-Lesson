# This file will prepare the data
# Data was originally found on data.world
# http://www.eia.gov/dnav/pet/pet_crd_crpdn_adc_mbbl_m.htm

library(dplyr)
library(tidyr)
library(stringr)
library(zoo)

getData = function(){
  
  data = read.csv('Monthly Crude Oil Production by State 1981 - Nov 2016.csv')
  data = data[data$Date != 'Back to Contents',]
  data = data[data$Date != 'Sourcekey',]
  data = data[data$Date != '',]
  
  #Convert data 
  df = data.frame(data %>% gather(Location,ThousandBarrel, -Date))

  df = data.frame(df %>% separate(Date,c('Month','Year'),"-"))
  df$Date = as.Date(as.yearmon(paste(df$Month,df$Year)))
  
  df$Location = as.character(sub('.Field.Production.of.Crude.Oil..Thousand.Barrels.','',df$Location))
  df$ThousandBarrel = as.numeric(df$ThousandBarrel)
  
  States = data.frame(Location = as.character(state.name))
  
  df = merge(df,States,by='Location')
  df$Month = factor(df$Month, levels = month.abb)
  
  return(df)
  
}
