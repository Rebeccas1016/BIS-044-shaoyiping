# replicate of line 232-249
# Data Frames
x <- 10:1
y <- -4:5
z <- c("Hockey", 'Football', 'Curling', 'Soccer', 'Rugby', 'Baseball', 'Golf', 'Basketball', 'Wrestling', 'Tennis')
theDF <- data.frame(x, y, z)
# theDF

# str(theDF)

# theDF[1,2]
# View(theDF)

# Using nanmes
# theDF$x
# theDF$x[3]

# Editing names
names(theDF) <- c("Popularity", "Team Strength", "Sport")
# View(theDF)
cat("The mean of Team Strength is: ", mean(theDF$"Team Strength"))
