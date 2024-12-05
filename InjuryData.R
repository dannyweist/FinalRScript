library(DataExplorer)

# Load Data
injury_data <- read.csv("~/Downloads/NFL_Injuries_Assumed_2018-2022.csv")

plot_missing(injury_data)
