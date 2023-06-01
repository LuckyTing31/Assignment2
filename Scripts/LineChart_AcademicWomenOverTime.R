# Load the required libraries
library(ggplot2)
library(dplyr)

# Read the data from the CSV files
aus_data <- read.csv("Fig5_AUS_TotAc_women_2020.csv", stringsAsFactors = FALSE)
uk_data <- read.csv("Fig6_UK_TotAc_women_2020.csv", stringsAsFactors = FALSE)

# Update column names to match the actual column names in the CSV files
colnames(aus_data) <- c("GRID ID", "Year", "Institution name", "Group", "Total Academic", "Academic Women", "Academic Women Percentage")
colnames(uk_data) <- c("GRID ID", "Year", "Institution name", "Group", "Total Academic", "Academic Women", "Academic Women Percentage")

# Select the required columns
aus_data <- aus_data %>%
  select(Year, AcademicWomen = `Academic Women`)
uk_data <- uk_data %>%
  select(Year, AcademicWomen = `Academic Women`)

# Create a new column 'Grouping' to identify the country
aus_data$Grouping <- "Australia"
uk_data$Grouping <- "United Kingdom"

# Combine the data from both countries
combined_data <- rbind(aus_data, uk_data)

# Convert the Year column to numeric
combined_data$Year <- as.numeric(combined_data$Year)

# Sort the combined data by Year
combined_data <- combined_data %>% 
  arrange(Year)

# Plot the line chart
ggplot(combined_data, aes(x = Year, y = AcademicWomen, color = Grouping)) +
  geom_line() +
  labs(title = "Trend of Academic Women Over Time",
       x = "Year",
       y = "Number of Academic Women") +
  scale_color_manual(values = c("Australia" = "blue", "United Kingdom" = "red")) +
  theme_minimal()

