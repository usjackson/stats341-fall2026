
# Chi-Square Assignment
# COVID-19 Data Analysis
# January 22, 2022

# 1. Import CSV file
covid_data <- read.csv("~/Downloads/01-22-2022.csv")

# 2. Remove rows with NA or empty values
# in the two variables used for analysis

covid_data <- covid_data[
  !is.na(covid_data$Province_State) &
  !is.na(covid_data$Country_Region) &
  trimws(covid_data$Province_State) != "" &
  trimws(covid_data$Country_Region) != "",
]

# 3. Create contingency table
table_data <- table(
  covid_data$Province_State,
  covid_data$Country_Region
)

# 4. Perform Chi-Square test
chi_result <- chisq.test(table_data)

# 5. Display results
print(table_data)
print(chi_result)

# 6. Display test statistic and p-value
print(chi_result$statistic)
print(chi_result$parameter)
print(chi_result$p.value)
