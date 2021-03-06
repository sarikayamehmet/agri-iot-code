rm(list=ls()) # ������� ��� ����������

library(lubridate)
library(ggplot2)
library(scales)
library(ggthemes)
# library(ggthemr)
library(httr)
library(reshape2)
library(tidyverse)
library(magrittr)
library(arules)
library(RColorBrewer)
library(wesanderson)
library(gtable)
library(grid) # ��� grid.newpage()
library(gridExtra) # ��� grid.arrange()
library(Cairo)
library(futile.logger)
library(hrbrthemes)
library(profvis)

# �� ����� ������� ������ ��� ����������� �����, ������� �������� ��������������.
tmp <- getwd()
setwd("d:/iwork.GH/dvtiot")
devtools::load_all()
setwd(tmp)
getwd()

# ��� ������ source
# How to source() .R file saved using UTF-8 encoding?
# http://stackoverflow.com/questions/5031630/how-to-source-r-file-saved-using-utf-8-encoding
eval(parse("common_funcs.R", encoding = "UTF-8"))

flog.appender(appender.file('iot-dashboard.log'))
flog.threshold(TRACE)
flog.info("plot started")

#profvis({
raw_field_df <- getSensorData()
# ������� ������ � ���������� ������� �������
dshift <- now() - max(raw_field_df$timestamp)
raw_field_df$timestamp <- raw_field_df$timestamp + dshift
#})

timeframe <- getTimeframe()
plotSensorData(raw_field_df, timeframe, as.numeric(1), expand_y = TRUE)


