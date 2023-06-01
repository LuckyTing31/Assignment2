# Set working directory
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

# Read the data from CSV files
au_data <- read.csv("au_data_all.csv")
uk_data <- read.csv("uk_data_all.csv")
au_women <- read.csv("Fig5_AUS_TotAc_women_2020.csv")
uk_women <- read.csv("Fig6_UK_TotAc_women_2020.csv")

# Rename columns in AU women data
colnames(au_women) <- c("grid_id", "academic_year", "name", "grouping", "total_academic", "women_academic", "percent_women_academic")

# Rename columns in UK women data
colnames(uk_women) <- c("grid", "academic_year", "name", "grouping", "total_academic", "women_academic", "percent_women_academic")

# Merge AU data with women data based on grid_id
au_merged <- merge(au_data, au_women, by = "grid_id", all.x = TRUE)

# Merge UK data with women data based on grid
uk_merged <- merge(uk_data, uk_women, by.x = "grid", by.y = "grid", all.x = TRUE)

# Add a country column to indicate the data source
au_merged$country <- "Australia"
uk_merged$country <- "UK"

# Combine AU and UK merged data
data <- bind_rows(au_merged, uk_merged)

# Create the line chart for women's total income
chart_income <- ggplot(data, aes(x = academic_year, y = women_academic, color = country, group = country)) +
  geom_line() +
  geom_point() +
  labs(x = "Academic Year", y = "Women's Total Income",
       title = "Comparison of Women's Total Income: Australia vs UK") +
  facet_wrap(~ country) +
  theme_minimal()

# Display the line chart
print(chart_income)


