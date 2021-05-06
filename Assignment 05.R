if (!require("ggplot2")) install.packages("ggplot2")
library("ggplot2")

DF <- read.csv("most-recent-cohorts-all-data-elements-1.csv")

DF$STABBR <- as.factor(DF$STABBR)

attach(DF)

ggplot(data=DF) + 
  geom_histogram(binwidth=1, aes(x=HIGHDEG)) + 
  ggtitle("Highest Degrees by State") + 
  xlab("Highest Degree") + 
  ylab("Frequency") +
  theme_minimal() +
  xlim(0, 5) + 
  facet_wrap(~STABBR)

# cat("\014")
