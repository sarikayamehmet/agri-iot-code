rm(list=ls()) # ������� ��� ����������

library(lubridate)
library(ggplot2)
library(scales)
library(ggthemes)
# library(ggthemr)
library(httr)
library(reshape2)
library(tidyverse)
library(RColorBrewer)
library(gtable)
library(grid) # ��� grid.newpage()
library(gridExtra) # ��� grid.arrange()
library(Cairo)
library(futile.logger)
library(profvis)
library(hrbrthemes)

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


timeframe <- getTimeframe()
raw_weather <- gatherRawWeatherData()

weather_df <- extractWeather(raw_weather, timeframe)
rain_df <- calcRainPerDate(raw_weather)


#profvis({
gp <- plotWeatherData(weather_df, rain_df, timeframe)
grid.draw(gp)

png(filename="render_w_cairo.png", type="cairo", #pointsize=24, 
    units="cm", height=15, width=20, res=150, pointsize=8, antialias="default")
grid.draw(gp)
dev.off()
#})

grid.draw(gp)
