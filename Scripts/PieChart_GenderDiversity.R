# Load required libraries
library(ggplot2)

# Read the CSV files
uk_data <- read.csv("uk_data_all.csv")
au_data <- read.csv("au_data_all.csv")

# Create a data frame for gender diversity in the UK
uk_gender_data <- data.frame(
  Gender = c("Men", "Women"),
  Count = c(uk_data$total_pub - uk_data$women_acad, uk_data$women_acad)
)

# Create a data frame for gender diversity in Australia
au_gender_data <- data.frame(
  Gender = c("Men", "Women"),
  Count = c(au_data$total_pub - au_data$women_acad, au_data$women_acad)
)

# Create the pie charts for both countries
p <- ggplot() +
  geom_bar(data = uk_gender_data, aes(x = "", y = Count, fill = Gender), stat = "identity", width = 1) +
  coord_polar("y") +
  labs(x = NULL, y = NULL, fill = "Gender", title = "Gender Diversity in UK Academic Institutions") +
  theme_minimal() +
  theme(legend.position = "right") +
  guides(fill = guide_legend(override.aes = list(label = NULL)))  # Hide legend labels

q <- ggplot() +
  geom_bar(data = au_gender_data, aes(x = "", y = Count, fill = Gender), stat = "identity", width = 1) +
  coord_polar("y") +
  labs(x = NULL, y = NULL, fill = "Gender", title = "Gender Diversity in AU Academic Institutions") +
  theme_minimal() +
  theme(legend.position = "right") +
  guides(fill = guide_legend(override.aes = list(label = NULL)))  # Hide legend labels

# Arrange the pie charts side by side
library(gridExtra) 
grid.arrange(p, q, ncol = 2)

