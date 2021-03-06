results <- read.csv("PRESIDENT_precinct_primary.csv")
# View(results)
n <- length(results$precinct)
biden <- 0
trump <- 0
for (i in 2:n) {
  if (results$candidate[i] == "JOSEPH R BIDEN") {
    biden <- biden + results$votes[i]
  } else if (results$candidate[i] == "DONALD J TRUMP") {
    trump <- trump + results$votes[i]
  }
}

cat("Trump: ", trump, "\nBiden: ", biden)