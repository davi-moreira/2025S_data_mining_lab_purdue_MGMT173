# ---
# title: "<span style = 'font-size: 100%;'> MGMT 17300: Data Mining Lab </span>"
# subtitle: "<span style = 'font-size: 150%;'> Data Wrangling </span>"
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
# footer: "Data Mining Lab"
# theme: [simple,custom.scss]
# html-math-method:
# method: mathjax
# url: "https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"
# ---
# 
# ## Overview
# 
# :::::: nonincremental
# ::::: columns
# ::: {.column width="50%" style="text-align: center; justify-content: center; align-items: center;"}
# -   Tidy Data
# -   Tidyverse
# -   Data Wrangling
# :::
# 
# ::: {.column width="50%" style="text-align: center; justify-content: center; align-items: center;"}
# -   Reshaping Data
# -   Merging Datasets
# :::
# :::::
# ::::::
# 
# ## 
# 
# <center>
# 
# > “Happy families are all alike; every unhappy family is unhappy in its own way.”
# >
# > --- Leo Tolstoy
# 
# <br>
# 
# > “Tidy datasets are all alike; every messy dataset is messy in its own way.”
# >
# > --- Hadley Wickham
# 
# </center>
# 
# # Tidy Data {background-color="#cfb991"}
# 
# ## Tidy Data vs. Messy Data
# 
# In the real world, most data will not be in the format we desire. In this class, we will learn how to process data so that it becomes *tidy* according to our objectives.
# 
# <center>
# 
# ![Tidy Dataset](figs/tidy.png)
# 
# </center>
# 
# # Tidyverse {background-color="#cfb991"}
# 
# ## Tidyverse
# 
# All the tools we will see are part of the [tidyverse](https://www.tidyverse.org/), a set of packages for data manipulation.
# 
# ```{r message=FALSE, warning=FALSE, echo=T}
if(!require(tidyverse)) install.packages("tidyverse")
library(tidyverse)
# ```
# 
# This set of packages follows principles that are becoming the standard for data analysis in `R`.
# 
# <center>
# 
# ![Tidyverse](figs/tidyverse.PNG){width="600px"}
# 
# </center>
# 
# <center>[The tidy tools manifesto](https://cran.r-project.org/web/packages/tidyverse/vignettes/manifesto.html)</center>
# 
# ## Pipe
# 
# ::::: columns
# ::: {.column width="50%"}
# <br>
# 
# ![](figs/pipe.png){fig-align="center" width="80%"}
# :::
# 
# ::: {.column width="50%"}
# ![](figs/pipe_02.png){fig-align="center" width="80%"}
# :::
# :::::
# 
# ## Pipe
# 
# The `%>%` or `|>` makes the order of operations clearer, making code easier to read and understand.
# 
# ```{r eval=FALSE, echo=TRUE}
# # A random vector
x <- c(1:10)

# A simple calculation with complicated code
sum(sqrt(factorial(x)))

# The same calculation with %>%
x %>% factorial() %>% sqrt() %>% sum()
# ```
# 
# ````{=html}
# <!---
# ## Exercise
# 
# - Using the `%>%` operator and the functions `sqrt()` and `plot()`, obtain a visualization of the square root of each element of the vector below:
# 
# ```{r eval=FALSE, echo=TRUE}
# # Vector
# x <- seq(0, 10, .1)
# ```
# 
# ## Exercise: Answer
# 
# --->
# ````
# 
# ````{=html}
# <!---
# ```{r eval=FALSE, echo=TRUE}
# # Vector
# x <- seq(0, 10, .1)
# 
# # answer
# x %>% sqrt() %>% plot()
# ```
# --->
# ````
# 
# # Data Wrangling {background-color="#cfb991"}
# 
# ## What is Data Wrangling?
# 
# -   **Data Wrangling (Data Cleaning / Data Munging):**\
# The process of transforming raw, messy data into a clean and structured format that is ready for analysis.
# 
# -   It often involves:
# 
# -   Handling missing values
# -   Correcting inconsistencies
# -   Reshaping data from wide to long formats (or vice versa)
# -   Filtering, arranging, and summarizing data
# 
# ## Why is it Important?
# 
# -   **Improved Data Quality:**\
# Reliable analyses start with clean, accurate, and consistent data.
# 
# -   **Efficiency in Analysis:**\
# Data prepared in a structured and “tidy” format reduces the time spent fixing errors and allows focus on actual insights.
# 
# -   **Better Decision Making:**\
# High-quality, well-structured data leads to more meaningful interpretations, stronger conclusions, and actionable insights.
# 
# ## Loading Data
# 
# -   It is advisable to adopt a project-based workflow in your data analysis ([Workflow: projects](https://r4ds.hadley.nz/workflow-scripts#projects)).
# 
# -   Using a consistent project structure optimizes collaboration and sharing of your analysis.
# 
# -   For this lecture, we will use the `nycflights13` package, which comes with several related datasets about flights departing from NYC in 2013.
# 
# ## Loading Data
# 
# ```{r message=FALSE, warning=FALSE, echo=TRUE}
if(!require(nycflights13)) install.packages("nycflights13")
library(nycflights13)

# The main dataset we'll use is flights
flights <- nycflights13::flights

# ```
# 
# The `flights` dataset includes information on all US domestic flights departing NYC in 2013. Some key variables include:
# 
# -   `year`, `month`, `day`: date of departure
# -   `dep_delay`, `arr_delay`: departure and arrival delays in minutes
# -   `carrier`: airline carrier
# -   `origin` and `dest`: origin and destination airports
# 
# ## Verbs in the Tidyverse
# 
# In the `tidyverse`, we use **verbs** (functions) that describe step-by-step data manipulation tasks:
# 
# -   `filter()`: Select rows
# -   `arrange()`: Sort observations
# -   `select()` and `rename()`: Select or rename columns\
# -   `mutate()`: Create new variables
# -   `case_when()`: Recode variables\
# -   `summarise()` and `group_by()`: Summarize information
# -   `pivot_wider()` and `pivot_longer()`: Reshape data
# -   `left_join()`: Merge datasets
# -   Combine different steps using the `%>%` or `|>`
# 
# ## Selecting Columns with `select()`
# 
# The `flights` dataset has many columns. We can choose only the ones we need:
# 
# ```{r echo=T, eval=FALSE, message=FALSE, warning=FALSE, results='hide'}
# Select only a few important columns
flights %>%
select(year, month, day, dep_delay, arr_delay)

# Select all columns except a few
flights %>%
select(-tailnum, -time_hour)
# ```
# 
# ## Selecting Columns with `select()`
# 
# ```{r echo=T, eval=FALSE, message=FALSE, warning=FALSE, results='hide'}
# Select columns that start with 'arr'
arr_data <- flights %>%
select(starts_with("arr"))

# Rearrange the order of variables
flights_reordered <- flights %>%
select(carrier, flight, everything())
# ```
# 
# ## Renaming Variables with `rename()`
# 
# If we want to rename a variable:
# 
# ```{r echo=T, eval=FALSE, message=FALSE, warning=FALSE, results='hide'}
# IMPORTANT: the new name is given first
flights %>%
rename(airline = carrier) %>%
select(airline, flight, dep_delay)
# ```
# 
# ## Creating Variables with `mutate()`
# 
# <center>![](figs/mutate.png){width="90%"}</center>
# 
# ## Creating Variables with `mutate()`
# 
# We can create new variables based on existing ones. For example, create a total delay variable:
# 
# ```{r echo=T, eval=FALSE, message=FALSE, warning=FALSE, results='hide'}
flights %>%
mutate(total_delay = arr_delay + dep_delay) %>%
select(year, month, day, carrier, total_delay)
# ```
# 
# ## Creating Variables with `transmute()`
# 
# `transmute()` works similarly, but keeps only the newly created variables:
# 
# ```{r echo=T, eval=FALSE, message=FALSE, warning=FALSE, results='hide'}

flights %>%
transmute(total_delay = arr_delay + dep_delay)

# ```
# 
# ## Recoding Variables with `case_when()`
# 
# We can recode continuous variables into categories. For example, classify flights as “On Time” if `arr_delay <= 0` and “Delayed” otherwise:
# 
# ```{r echo=T, eval=FALSE, message=FALSE, warning=FALSE, results='hide'}
flights %>%
mutate(status = case_when(
arr_delay <= 0 ~ "On Time",
TRUE ~ "Delayed"
)) %>%
select(year, month, day, carrier, arr_delay, status)
# ```
# 
# ## Recoding Variables with `case_when()`
# 
# We can also have more complex conditions:
# 
# ```{r echo=T, eval=FALSE, message=FALSE, warning=FALSE, results='hide'}
flights %>%
mutate(delay_category = case_when(
arr_delay <= 0 ~ "On Time",
arr_delay <= 30 ~ "Short Delay",
TRUE ~ "Long Delay"
)) %>%
select(year, month, day, carrier, arr_delay, delay_category)
# ```
# 
# ## Selecting Cases with `filter()`
# 
# <center>
# 
# ![Filter](figs/filter.png){width="90%"}
# 
# </center>
# 
# ## Selecting Cases with `filter()`
# 
# We can select rows based on conditions. For example, flights in January:
# 
# ```{r echo=T, eval=FALSE, message=FALSE, warning=FALSE, results='hide'}
flights %>%
filter(month == 1)
# ```
# 
# Or flights in January operated by United Airlines (carrier "UA"):
# 
# ```{r echo=T, eval=FALSE, message=FALSE, warning=FALSE, results='hide'}
flights %>%
filter(month == 1 & carrier == "UA")
# ```
# 
# ## Remembering Logical Operators
# 
# <center>
# 
# ![Logical Operators](figs/transform-logical.png){width="60%"}
# 
# </center>
# 
# -   `&` means AND
# -   `|` means OR
# -   `!` means NOT
# 
# ## Selecting Cases with `filter()`
# 
# We can store results in a new object using logical operators:
# 
# ```{r echo=T, eval=FALSE, echo=TRUE}
jan_ua_flights <- flights %>%
filter(month == 1 & carrier == "UA")
# ```
# 
# ## Sorting Observations with `arrange()`
# 
# <center>
# 
# ![Arrange](figs/arrange.png){width="90%"}
# 
# </center>
# 
# ## Sorting Observations with `arrange()`
# 
# We can sort rows. For example, sort by departure delay ascending:
# 
# ```{r echo=T, eval=FALSE, message=FALSE, warning=FALSE, results='hide'}
flights %>%
arrange(dep_delay) %>%
select(carrier, flight, dep_delay)
# ```
# 
# ## Sorting Observations with `arrange()`
# 
# For descending order:
# 
# ```{r echo=T, eval=FALSE, message=FALSE, warning=FALSE, results='hide'}
flights %>%
arrange(desc(arr_delay)) %>%
select(carrier, flight, arr_delay)
# ```
# 
# ## Summarizing Information with `summarise()` and `group_by()`
# 
# `summarise()` computes summary statistics. Paired with `group_by()`, it creates summaries within groups. For example, find the average departure delay by airline carrier:
# 
# ```{r echo=T, eval=FALSE, message=FALSE, warning=FALSE, results='hide'}
flights %>%
group_by(carrier) %>%
summarise(mean_dep_delay = mean(dep_delay, na.rm = TRUE)) %>%
drop_na()
# ```
# 
# Useful functions include `mean()`, `sum()`, `median()`, `sd()`, `n()`, and `n_distinct()`.
# 
# ## Other Functions for Grouping
# 
# `group_by()` can be combined with other operations:
# 
# ```{r echo=T, eval=FALSE, message=FALSE, warning=FALSE, results='hide'}
flights_group <- flights %>%
group_by(month, carrier) %>%
summarise(mean_arr_delay = mean(arr_delay, na.rm = TRUE),
mean_dep_delay = mean(dep_delay, na.rm = TRUE)) %>%
arrange(mean_arr_delay) %>%
ungroup()

flights_group
# ```
# 
# After grouping and summarizing, always `ungroup()` to return to the normal structure.
# 
# ````{=html}
# <!--- 
# ## Exercise
# 
# Create a summary (`flights_group`) that computes the median departure delay for each origin airport in the month of June (month == 6):
# 
# ```{r eval=FALSE, echo=TRUE}
# ```
# 
# 
# ## Exercise: Answer
# 
# --->
# ````
# 
# ````{=html}
# <!---
# ```{r eval=FALSE, echo=TRUE}
# flights_group <- flights %>%
# filter(month == 6) %>%
# group_by(origin) %>% 
# summarise(median_dep_delay = median(dep_delay, na.rm = TRUE)) %>%
# ungroup() %>% drop_na()
# 
# flights_group
# ```
# --->
# ````
# 
# # Reshaping Data {background-color="#cfb991"}
# 
# ## Reshaping Data with `pivot_wider()` and `pivot_longer()`
# 
# <br>
# 
# Let’s create a summary and then reshape it. For example, find the average arrival delay by carrier and month, then pivot to a wide format.
# 
# <br>
# 
# Our data is currently in **long** format.
# 
# ## `pivot_wider()`: from *long* to *wide*
# 
# ```{r echo=T, eval=FALSE, message=FALSE, warning=FALSE, results='hide'}
# Create a summary of mean arrival delay by carrier and month
delay_summary <- flights %>%
group_by(carrier, month) %>%
summarise(mean_arr_delay = mean(arr_delay, na.rm = TRUE)) %>%
ungroup()

# Pivot wider: carriers in rows, months in columns
delay_wide <- delay_summary %>%
pivot_wider(names_from = month, values_from = mean_arr_delay)

delay_wide
# ```
# 
# ## `pivot_longer()`: from *wide* to *long*
# 
# If we want to go back to the long format:
# 
# ```{r echo=T, eval=FALSE, message=FALSE, warning=FALSE, results='hide'}
delay_long <- delay_wide %>%
pivot_longer(cols = -carrier, names_to = "month", values_to = "mean_arr_delay")

delay_long
# ```
# 
# # Merging Datasets {background-color="#cfb991"}
# 
# ## 
# 
# <br>
# 
# <center>
# 
# > *"There are two certainties in life: death and bad merges"*
# 
# </center>
# 
# <br>
# 
# ## Merging Datasets
# 
# <br>
# 
# ```{r  echo=FALSE, out.width = "130%",fig.align="center"}
# knitr::include_graphics("figs/flights.png") 
# ```
# 
# :::: {style="font-size: 80%;"}
# The `flights` dataset can be connected to others:
# 
# ::: nonincremental
# -   **flights** connects to `planes` by: `tailnum`.
# -   **flights** connects to `airlines` by: `carrier`.
# -   **flights** connects to `airports` by: `origin` and `dest`.
# -   **flights** connects to `weather` by: `origin`, `year`, `month`, `day`, `hour`.
# :::
# ::::
# 
# ## Commands for Joining
# 
# <center>![](figs/join.png){width="90%"}</center>
# 
# <center>![](figs/merge.png){width="800px"}</center>
# 
# ## Commands for Joining `full_join()`
# 
# <center>![](figs/full_join.png){width="900px"}</center>
# 
# ## Commands for Joining `inner_join()`
# 
# <center>![](figs/inner_join.png){width="900px"}</center>
# 
# ## Commands for Joining `right_join()`
# 
# <center>![](figs/right_join.png){width="900px"}</center>
# 
# ## Commands for Joining `left_join()`
# 
# <center>![](figs/left_join.png){width="900px"}</center>
# 
# ## Merging Datasets: Example
# 
# For instance, to attach airline names to `flights`:
# 
# ```{r echo=T, eval=FALSE, message=FALSE, warning=FALSE, results='hide'}
flights_with_names <- flights %>%
left_join(airlines, by = "carrier")

head(flights_with_names)
# ```
# 
# ## Additional Material
# 
# Some interesting resources:
# 
# -   [Primer: Tidy your Data](https://rstudio.cloud/learn/primers/4)
# -   [Data Transformation Cheat Sheet](https://github.com/rstudio/cheatsheets/raw/master/data-transformation.pdf)
# -   [Data Visualization Cheat Sheet](https://github.com/rstudio/cheatsheets/raw/master/data-visualization-2.1.pdf)
# 
# # Summary {background-color="#cfb991"}
# 
# ## Summary
# 
# :::: {style="font-size: 0.8em;"}
# ::: nonincremental
# -   Using the `%>%` or `|>` to streamline code
# -   Selecting and renaming columns
# -   Filtering and sorting rows
# -   Creating and recoding variables
# -   Summarizing groups of observations
# -   Reshaping data from long to wide and back
# -   Joining multiple datasets for richer analysis
# :::
# ::::
# 
# # Thank you! {background-color="#cfb991"}
