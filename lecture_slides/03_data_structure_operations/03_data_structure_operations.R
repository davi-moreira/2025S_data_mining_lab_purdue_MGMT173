# ---
# title: "<span style = 'font-size: 100%;'> MGMT 17300: Data Mining Lab </span>"
# subtitle: "<span style = 'font-size: 150%;'> Basic Operations and Data Structures </span>"
# author: "Professor: Davi Moreira"
# # date: "2024-08-01"
# date-format: "MMMM DD, YYYY"
# format:
# revealjs: 
# transition: slide
# background-transition: fade
# width: 1600
# height: 900
# center: true
# slide-number: true
# incremental: true
# chalkboard: 
# buttons: false
# preview-links: auto
# #logo: figs/quarto.png
# footer: "Data Mining Lab"
# theme: [simple,custom.scss]
# ---
# 
# ## Overview
# 
# :::::: nonincremental
# ::::: columns
# ::: {.column width="50%" style="text-align: center; justify-content: center; align-items: center;"}
# -   Basic Operations
# -   Data types
# -   Dataframes
# -   Logical operators
# :::
# 
# ::: {.column width="50%" style="text-align: center; justify-content: center; align-items: center;"}
# -   R Packages and Their Importance
# -   Data Import in `R`
# -   Exporting Data from `R`
# -   Where to find Help?
# :::
# :::::
# ::::::
# 
# # Basic Operations {background-color="#cfb991"}
# 
# ## What Does Coding Really Mean?
# 
# <br>
# 
# <center>
# 
# <iframe width="660" height="415" src="https://www.youtube.com/embed/FN2RM-CHkuI" frameborder="0" allowfullscreen>
# 
# </iframe>
# 
# <br>
# 
# [Youtube Video!](https://www.youtube.com/embed/FN2RM-CHkuI)
# 
# </center>
# 
# ## Using R as a Calculator!
# 
# ```{r eval=FALSE, echo=TRUE}
# What is the result?
2 + 9 * 4
4 + 3 / 10^2
pi - 3

# Scientific notation
5 * 10^2
5 * 10^-2
111111 * 111111
1111111 * 1111111
# ```
# 
# # Scripts and objects {background-color="#cfb991"}
# 
# ## Objects: Variables and Vectors
# 
# ```{r eval=FALSE, echo=TRUE}
# What is the value of a?
a <- 4
a <- a * 5
a <- a + 10
a <- seq(a, 100, 5)
# ```
# 
# ## Vectors
# 
# ```{r eval=FALSE, echo=TRUE}
numbers <- c(1, 4, 10, pi, 1/3)
text <- c("a", "b", "Daniels Business School", "Purdue University", "BAIM")
(all_together <- c(numbers, text)) # use parentheses to display the object content
# ```
# 
# Note that when combining numbers and text, **all elements turn into text**. We will discuss text handling more later.
# 
# ## Style
# 
# <br>
# 
# > "Programs must be written for people to read, and only incidentally for machines to execute."
# >
# > --- Hal Abelson
# 
# <center>[The tidy tools manifesto](https://cran.r-project.org/web/packages/tidyverse/vignettes/manifesto.html){target="_blank"}</center>
# 
# ## Style
# 
# <br>
# 
# It is recommended that object names be descriptive. Additionally, adopting a programming style for your data analysis is valuable. It facilitates human reading and interpretation of the code. Let's look at object names from [`r4ds`](https://r4ds.hadley.nz/workflow-style){target="_blank"}. Which one is better?
# 
# <br>
# 
# ```{r eval=FALSE, echo=TRUE}
# i_use_snake_case
# otherPeopleUseCamelCase
# some.people.use.periods
# And_aFew.People_RENOUNCEconvention
# ```
# 
# ## The tidyverse style guide
# 
# <br>
# 
# [The tidyverse style guide](https://style.tidyverse.org/){target="_blank"}: this guide not only presents good practices and programming style but is accompanied by two packages that help data scientists maintain code consistency.
# 
# # Functions {background-color="#cfb991"}
# 
# ## Functions
# 
# Functions are the workhorse of statistical programming in `R`. Many of the analyses we will perform are based on using the correct functions and identifying the **appropriate arguments** for each case.
# 
# We have already seen some examples of functions:
# 
# ```{r eval=FALSE, echo=TRUE}
# install.packages() # installs packages
# library() # loads packages into memory
# require() # loads packages into memory
# sessionInfo() # information about the R version
# ```
# 
# The main use of functions is to automate operations that would take a long time to do manually, be prone to errors, or simply be tedious. For this reason, functions are developed in [packages.](https://www.datacamp.com/community/tutorials/r-packages-guide){target="_blank"}
# 
# ## Functions
# 
# For example, if we need to find the mean between two numbers, we could do the calculation manually:
# 
# ```{r eval=FALSE, echo=TRUE}
(35 + 65) / 2
# ```
# 
# But if we had 1000 numbers instead of 2, this process would be extremely long and tiring. So, we can simply use the `mean()` function to calculate the average of all numbers from 1 to 1000:
# 
# ```{r eval=FALSE, echo=TRUE}
mean(1:1000)
# ```
# 
# ## Functions
# 
# `R` has countless functions for doing all kinds of calculations that you can imagine (and even those you can't). As you progress in using R, there will be specific tasks for which no existing function is satisfactory. In these moments, the advantage of R being a programming language becomes evident — we can **create our own functions**.
# 
# For now, let’s explore some of the functions that already exist in R. Did you notice that I didn’t need to type all the numbers from 1 to 1000 in the previous example?
# 
# ```{r eval=FALSE, echo=TRUE}
numbers <- 1:1000
numbers_desc <- 1000:1
# ```
# 
# Much easier than `numbers <- c(1, 2, 3, ..., 1000)`.
# 
# ## Functions
# 
# But what if I wanted to find the mean of the odd numbers from 1 to 1000? Would I need to type the numbers one by one?
# 
# In these moments, remember that **laziness** is one of the traits that separates good programmers from the rest. Almost all tedious and repetitive tasks in programming can be automated in some way.
# 
# Obviously, R has the `seq()` function that allows us to create a vector of odd numbers. Notice how the arguments of the function are used:
# 
# ```{r eval=FALSE, echo=TRUE}
odds <- seq(from = 1, to = 1000, by = 2)
mean(odds)
# ```
# 
# ## Functions
# 
# R comes pre-installed with several statistical functions — after all, this is one of its main purposes. Besides the `mean()` function, which we saw earlier, let’s also look at other descriptive statistics:
# 
# ```{r eval=FALSE, echo=TRUE}
sd(odds) # standard deviation
var(odds) # variance
range(odds) # range
IQR(odds) # interquartile range
# ```
# 
# The `summary()` command gives us an overview of this vector:
# 
# ```{r eval=FALSE, echo=TRUE}
summary(odds)
# ```
# 
# # Data Types {background-color="#cfb991"}
# 
# ## Data Types
# 
# ::: nonincremental
# Programming languages store variables under different classes. Today, we will have a general discussion about them so that you know they exist, and we will go into details throughout the course.
# 
# -   Numeric values: `double`, `integer`
# -   Text: `character`
# -   Factors: `factor`
# -   Logical values: `logical`
# -   Special values: `NA`, `NULL`, `Inf`, `NaN`
# 
# To discover the type of an object, you can use the `typeof()` function.
# :::
# 
# # Dataframes {background-color="#cfb991"}
# 
# ## Dataframes
# 
# We can think of dataframes as **collections of vectors** placed side by side. It is by far the most used format for data analysis and processing.
# 
# ```{r eval=FALSE, echo=TRUE}
names <- c("Mary", "Davi", "Juliana", "Gabriel")
major <- c("Engineering", "Political Science", "Business", "Economy")
time_at_company <- c(3, 10, 10, 1)

team <- data.frame(names, major, time_at_company)

nrow(team) # number of rows
ncol(team) # number of columns
head(team) # first observations
summary(team) # summary of data
# ```
# 
# `R` also supports other data structures like matrices and lists, which we will cover as needed.
# 
# ## Data Tidying
# 
# ::: nonincremental
# <center>[![Tidy Data](figs/tidy.png)](https://r4ds.hadley.nz/data-tidy){target="_blank"}</center>
# 
# -   Observations in rows
# 
# -   Attributes in columns
# 
# -   Values in cells
# :::
# 
# ## Subsetting Vectors
# 
# The tools we will now see are used to "pinpoint" information stored in R's memory. Returning to the vector of odd numbers we created earlier, suppose I want to know the value of the 287th element:
# 
# ```{r eval=FALSE, echo=TRUE}
odds <- seq(from = 1, to = 1000, by = 2)
odds[287]
# ```
# 
# We can expand the `[` operator for various selections, as needed:
# 
# ```{r eval=FALSE, echo=TRUE}
odds[c(1, 76, 48)] # select various numbers
odds[-c(1:250)] # all numbers except the first 250
odds[odds > 900] # only values greater than 900
# ```
# 
# ## Subsetting Dataframes
# 
# The use of the `[` operator is similar for dataframes, but we need to pay attention to rows and columns:
# 
# ```{r eval=FALSE, echo=TRUE}
team[1, 3] # row 1, column 3
team[1,] # returns all of row 1
team[, 3] # returns all of column 3
team[, c(1, 3)] # returns columns 1 and 3
# ```
# 
# For dataframes, it is very common to use the `$` operator to select columns:
# 
# ```{r eval=FALSE, echo=TRUE}
team$time_at_company # selects the variable "time at company"
team[, 3] # same result
# ```
# 
# # Logical operators {background-color="#cfb991"}
# 
# ## Logical Operators
# 
# <br>
# 
# For more complex selections, it is common to rely on logical operators.
# 
# <br>
# 
# <center>
# 
# ![Logical](figs/transform-logical.png){width="800px"}
# 
# </center>
# 
# ## Logical Operators
# 
# ::: nonincremental
# The most common are `&` and `|`, but all relational operators are also recognized:
# 
# -   `==` (equal to)
# -   `!=` (not equal to)
# -   `>` (greater than)
# -   `<` (less than)
# -   `>=` (greater than or equal to)
# -   `<=` (less than or equal to).
# 
# <br>
# 
# ```{r eval=FALSE, echo=TRUE}
team[team$time_at_company == 10,] # only people with 10 years at the company
team[team$time_at_company < 5,] # only people with less than 5 years at the company
team[team$time_at_company < 5 | team$major == "Business",] # less than 5 years at the company OR in and specific area
team[team$time_at_company > 2 & team$time_at_company < 5,] # between 2 and 5 years at the company
# ```
# :::
# 
# # `R` Packages {background-color="#cfb991"}
# 
# ## `R` Packages and Their Importance
# 
# <br>
# 
# `R` functionality is enhanced by **packages**—which are like "apps" in the smartphone ecosystem.
# 
# ```{r eval=FALSE, echo=TRUE}
# Example of installing a package
install.packages("readxl")

# Loading a package to use its functions
library(readxl)
# ```
# 
# ## The Tidyverse Project
# 
# <br>
# 
# <br>
# 
# > In space, no one can hear you scream.
# >
# > – Alien (1979)
# 
# <br>
# 
# <br>
# 
# ## The Tidyverse Project
# 
# <center>[![Tidyverse Project](figs/tidyverse_hex_logo.png){width="30%"}](https://www.tidyverse.org/){target="_blank"}</center>
# 
# The tidyverse is a collection of R packages designed for data science. All packages share an underlying philosophy and common APIs.
# 
# ## The Tidyverse Data Science Workflow
# 
# <center>
# 
# ![Tidyverse Project](figs/data_science_workflow_pkgs.png){width="70%"}
# 
# </center>
# 
# ## Installing Packages
# 
# <br>
# 
# You can install packages in two ways:
# 
# 1.  **Using the `R` command line** with `install.packages()`
# 2.  **Using `RStudio`**, by navigating to the "Packages" tab and searching for the desired package.
# 
# ::: fragment
# ```{r eval=FALSE, echo=TRUE}
# Installing multiple packages at once
install.packages(c("readxl", "ggplot2"))
# ```
# :::
# 
# ## Loading Packages
# 
# <br>
# 
# After installation, you must load a package to use it:
# 
# ```{r eval=FALSE, echo=TRUE}
# Loading the readxl package
library(readxl)
# ```
# 
# <br>
# 
# > **Note**: Some commonly used packages for data analysis are `ggplot2`, `dplyr`, and `tidyr`.
# 
# # Data Import in `R` {background-color="#cfb991"}
# 
# ## Data Import in `R`
# 
# <br>
# 
# `R` allows importing data from various file formats like **text files**, **Excel sheets**, **CSV files**, and **SQL databases**.
# 
# ## Importing Text Files
# 
# <br>
# 
# ```{r eval=FALSE, echo=TRUE}
# # Importing a text file
# data <- read.table("data.txt", header = TRUE, sep = ",")
# ```
# 
# ## Importing Excel Files
# 
# <br>
# 
# Make sure you have the `readxl` package installed:
# 
# ```{r eval=FALSE, echo=TRUE}
# # Importing data from an Excel file
# library(readxl)
# data <- read_excel("data/SalesData.xlsx")
# ```
# 
# <br>
# 
# To import a specific sheet:
# 
# ```{r eval=FALSE, echo=TRUE}
# # Importing a specific sheet from an Excel file
# data <- read_excel("c:/mydata/data.xlsx", sheet = "Sheet1")
# ```
# 
# ## Importing CSV Files
# 
# <br>
# 
# `CSV` files are commonly used and can be easily imported using `read.csv()`:
# 
# ```{r eval=FALSE, echo=TRUE}
# # Importing data from a CSV file
# data <- read.csv("data.csv")
# ```
# 
# ## Importing Data from `SQL` Databases
# 
# <br>
# 
# To import data from a `SQL` database, you can use the `RODBC` package:
# 
# ```{r eval=FALSE, echo=TRUE}
# # Importing from SQL database
# library(RODBC)
# conn <- odbcConnect("database_name")
# data <- sqlQuery(conn, "SELECT * FROM table_name")
# odbcClose(conn)
# ```
# 
# <br>
# 
# > **Note**: For this course, we will primarily focus on importing data from Excel spreadsheets.
# 
# # Exporting Data from `R` {background-color="#cfb991"}
# 
# ## Exporting Data from `R`
# 
# <br>
# 
# Once your data analysis is complete, you'll often need to export the data for further use or reporting. `R` provides several ways to export datasets to various formats, including **CSV**, **Excel**, and **text files**.
# 
# ## Exporting Data to `CSV` Files
# 
# <br>
# 
# One of the most common way to export data from `R` is to save it as a `CSV` file using the `write.csv()` function.
# 
# ```{r eval=FALSE, echo=TRUE}
# # Exporting a dataset to a CSV file
# write.csv(data, "output_data.csv", row.names = FALSE)
# ```
# 
# -   The first argument is the data you want to export.
# -   The second argument is the file name (path) for the exported file.
# -   `row.names = FALSE` avoids adding an extra column for row numbers.
# 
# ## Exporting Data to Excel Files
# 
# <br>
# 
# You can export data to Excel using the `writexl` package. First, make sure it's installed.
# 
# ```{r eval=FALSE, echo=TRUE}
# # Install the writexl package
# install.packages("writexl")
# 
# # Exporting a dataset to an Excel file
# library(writexl)
# write_xlsx(data, "data/output_data.xlsx")
# ```
# 
# <br>
# 
# > **Note**: The `write_xlsx()` function saves the data into an Excel file, and you can specify the file path.
# 
# ## Exporting Data to Text Files
# 
# <br>
# 
# For exporting data to a text file, you can use the `write.table()` function. This is particularly useful when you want to use a delimiter other than commas, such as tabs.
# 
# ```{r eval=FALSE, echo=TRUE}
# # Exporting a dataset to a tab-delimited text file
# write.table(data, "output_data.txt", sep = "\t", row.names = FALSE)
# ```
# 
# -   The `sep` argument specifies the delimiter used in the file (in this case, tabs).
# 
# ## Exporting Data to `RDS` Files
# 
# <br>
# 
# RDS is a format specific to `R` that allows you to save `R` objects and reload them later.
# 
# ```{r eval=FALSE, echo=TRUE}
# # Exporting data to an RDS file
# saveRDS(data, "data.rds")
# 
# # Loading the RDS file back into R
# data <- readRDS("data.rds")
# ```
# 
# <br>
# 
# > **Note**: `RDS` files are useful when you want to save R objects for later use within R itself.
# 
# # Where to find Help? {background-color="#cfb991"}
# 
# ## Where to find Help?
# 
# The `sum()` function is often useful. It allows you to sum vectors. Let's take the opportunity to consult the **documentation** of this function through another function, `?`.
# 
# ```{r eval=FALSE, echo=TRUE}
?sum()
# ```
# 
# ## Where to find Help?
# 
# <br>
# 
# <center>![](figs/google-better.png){width="30%"}</center>
# 
# ## Where to find Help?
# 
# Besides `R`'s official documentation, a very valuable resource is [Stack Overflow](https://stackoverflow.com/).
# 
# <center>
# 
# ![Stack](figs/stack-WeRWhatWeAsk.jpg){width="800px"}
# 
# </center>
# 
# ## Where to find Help?
# 
# +---------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
# | [![Claude AI Logo](figs/claude_ai_logo.png){width="50%"}](https://www.anthropic.com/index/claude) | [![ChatGPT AI Logo](figs/chatgpt_ai_logo.png){width="50%"}](https://openai.com/chatgpt) | [![Copilot AI Logo](figs/copilot_ai_logo.jpeg){width="50%"}](https://www.copilotsearch.com/) | [![GitHub Copilot Logo](figs/github_copilot_logo.jpeg){width="80%"}](https://github.com/features/copilot) | [![Cursor AI Logo](figs/cursor_ai_logo.png){width="50%"}](https://www.cursor.so/) |
# +:=================================================================================================:+:=======================================================================================:+:============================================================================================:+:=========================================================================================================:+:=================================================================================:+
# | [Claude AI](https://www.anthropic.com/index/claude)                                               | [ChatGPT](https://openai.com/chatgpt)                                                   | [Copilot AI](https://www.copilotsearch.com/)                                                 | [GitHub Copilot](https://github.com/features/copilot)                                                     | [Cursor AI](https://www.cursor.so/)                                               |
# +---------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------+----------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------+
# 
# ## Where to find Help?
# 
# <center>
# 
# [![](figs/swirl.png){width="600px"}](https://swirlstats.com/)
# 
# [swirl teaches you R programming and data science interactively](https://swirlstats.com/){target="_blank"}
# 
# </center>
# 
# ## Where to find Help?
# 
# <center>
# 
# [![](figs/primers.png){width="600px"}](https://rstudio.cloud/learn/primers)
# 
# [RStudio Primers](https://rstudio.cloud/learn/primers){target="_blank"}
# 
# </center>
# 
# # Summary {background-color="#cfb991"}
# 
# ## Summary
# 
# :::: {style="font-size: 0.8em;"}
# ::: nonincremental
# -   **Functions in R**
# 
# -   Automating tasks with functions
# -   Predefined functions (e.g., `mean()`, `sd()`, `summary()`)
# -   Creating custom functions for specific tasks
# 
# -   **Data Structures**
# 
# -   Data types in R: numeric, text, factors, logical values
# -   Dataframes: the most used data structure for analysis
# 
# -   Packages are essential in extending `R`’s functionality.
# 
# -   You can install and load packages easily with `install.packages()` and `library()` functions.
# 
# -   `R` supports importing data from multiple sources, including text files, `Excel` sheets, `CSV` files, and `SQL` databases.
# 
# -   You can export datasets to various formats in R, including **CSV**, **Excel**, **text files**, and **RDS**.
# 
# -   `write.csv()` and `write_xlsx()` are common functions for CSV and Excel exports.
# -   `write.table()` allows for more customizable exports, such as tab-delimited files.
# -   Use `saveRDS()` and `readRDS()` for saving and reloading R-specific objects.
# :::
# ::::
# 
# # Thank you! {background-color="#cfb991"}
