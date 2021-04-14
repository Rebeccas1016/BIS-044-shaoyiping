# Read the two csv files into data frames.
if (!require(tidyverse)) install.packages(tidyverse)
library(tidyverse)
if (!require("data.table")) install.packages("data.table")
library("data.table")

decode <- read.csv("city-of-st-louis-decode.csv")
survey <- read.csv("city-of-st-louis-survey.csv")

# View(decode)
# View(survey)

# Drop all rows from the first data frame that do not have Owner values starting with "A".
survey <- select(survey, Owner, Land.Area)

survey$First <- substr(survey$Owner, 1, 1)
survey$First

survey_A <- survey[which(survey$First == "A"),]

summary(survey_A$Land.Area)

# View(survey_A)

# Convert the Owners in the survey data to the standardized names in the decode data.
if (!require(dplyr)) install.packages(dplyr)
library(dplyr)
names(decode)[1] <- "Owner"
survey_replaced <- survey_A %>% left_join(decode, by = "Owner")
survey_replaced <- survey_replaced %>% 
  mutate(Owner = ifelse(.$Standardized.Names %in% decode$Standardized.Names, .$Standardized.Names, survey_A$Owner)) %>%
  select(Owner, Land.Area)

# View(survey_replaced)

# Total "Land Area" by standardized name.
survey_final <- survey_replaced %>% group_by(Owner) %>% summarise(sum = sum(Land.Area), n = n())

# Print landowners start with "A"
survey_final <- survey_final %>% arrange(Owner, desc(sum))
survey_final[1:10]

