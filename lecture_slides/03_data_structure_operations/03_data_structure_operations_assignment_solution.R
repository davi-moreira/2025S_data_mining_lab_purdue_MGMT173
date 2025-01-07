
# Load the data
data <- read.csv("tech_company_data.csv")

# Create a new column: Efficiency Score = Tasks_Completed / Hours_Worked
data$Efficiency_Score <- data$Tasks_Completed / data$Hours_Worked

# Display the first few rows of the updated data
head(data)
