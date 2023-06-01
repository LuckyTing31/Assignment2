# Load required libraries
library(ggplot2)
library(dplyr)


# Read the CSV files
au_data <- read.csv("au_data_all.csv")
uk_data <- read.csv("uk_data_all.csv")

# Combine the data from Australia and the UK
combined_data <- rbind(
  data.frame(Country = "Australia", women_acad = au_data$women_acad, total_rev = au_data$total_rev),
  data.frame(Country = "UK", women_acad = uk_data$women_acad, total_rev = uk_data$total_income)
)

# Plot the scatter plot with different colors for Australia and the UK
ggplot(combined_data, aes(x = women_acad, y = total_rev, color = Country)) +
  geom_point() +
  labs(x = "Women Academics", y = "Total Revenue", title = "Relationship between Gender Diversity and Citation Impact") +
  theme_minimal() +
  scale_y_continuous(labels = scales::comma)

