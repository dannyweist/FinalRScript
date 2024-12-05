library(readr)
nfl_weather_data_2018_2022 <- read_csv("~/Downloads/nfl_weather_data_2018_2022.csv")

library(DataExplorer)

# Load Data
missing_weather <- read.csv("~/Downloads/nfl_weather_data_2018_2022.csv")

plot_missing(missing_weather)
