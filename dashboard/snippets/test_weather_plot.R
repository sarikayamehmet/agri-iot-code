library(tidyverse)

# plot_real_weather2_data(rvars$weather.df, rvars$rain.df, timeframe)

getwd()

source("common_funcs.R") # ���� ������� ��� �������������� � ������������� �������

load_weather_history <- function(data_url){
  # �������� �� ������� ���������������� ������������ ������ �� ������ -------------------------------------------------
  # ���� �� �� ������������, ��� ��� ������ ��������, ������ �� ���������, ���� ����� ������� pull � �������� �����
  
  # weather_hist <- 
  #   safely(read_csv)("https://raw.githubusercontent.com/iot-rus/agri-iot-data/master/weather_history.csv1") %>%
  #   '[['("result")

  resp <- safely(read_csv)(data_url)
  if(!is.null(resp$error))
  
  # ���������� ������, ������� ����� ���� ��������, ���� NULL � ������ ������  
}

load_weather_history("https://raw.githubusercontent.com/iot-rus/agri-iot-data/master/weather_history.csv1")