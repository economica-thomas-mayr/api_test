# Generate sample data
set.seed(123)  # for reproducibility
num_rows <- 100
data <- data.frame(
  ID = 1:num_rows,
  Age = sample(18:65, num_rows, replace = TRUE),
  Gender = sample(c("Male", "Female"), num_rows, replace = TRUE),
  Score = rnorm(num_rows, mean = 75, sd = 10)
)

# Write data to a CSV file
write.csv(data, "sample_data.csv", row.names = FALSE)
