# Load required libraries
library(ggplot2)

# Read the CSV files
au_data <- read.csv("au_data_all.csv")
uk_data <- read.csv("uk_data_all.csv")

# Create a combined data frame
bar_data <- data.frame(
  Country = c(rep("Australia", nrow(au_data)), rep("United Kingdom", nrow(uk_data))),
  AcademicWomen = c(au_data$women_acad, uk_data$women_acad)
)

# Create a bar chart
chart <- ggplot(bar_data, aes(x = Country, y = AcademicWomen, fill = Country)) +
  geom_bar(stat = "identity") +
  labs(title = "Number of Academic Women in Australia and the United Kingdom",
       x = "Country",
       y = "Number of Academic Women") +
  theme_bw()

# Display the chart
print(chart)
