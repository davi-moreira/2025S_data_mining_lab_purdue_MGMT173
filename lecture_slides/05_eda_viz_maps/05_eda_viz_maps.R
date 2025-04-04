# ---
# title: "<span style = 'font-size: 100%;'> MGMT 17300: Data Mining Lab </span>"
# subtitle: "<span style = 'font-size: 150%;'>Exploratory Data Analysis with Vizualization and Maps</span>"
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
# -   Exploratory Data Analysis (EDA)
# 
# -   Obtaining Summary Statistics with R
# 
# -   Introduction to `ggplot()`
# 
# -   The Grammar of Graphics
# -   Adding Layers, Facets, and Themes
# -   Computed Statistics and Advanced Visualizations
# :::
# 
# ::: {.column width="50%" style="text-align: center; justify-content: center; align-items: center;"}
# -   Creating Maps for Exploratory Data Analysis
# 
# -   Animations
# :::
# :::::
# ::::::
# 
# # Exploratory Data Analysis (EDA) {background-color="#cfb991"}
# 
# ## Exploratory Data Analysis (EDA)
# 
# **What is EDA?**
# 
# The initial step in the data mining process, involving examining and summarizing datasets to understand their main characteristics, identify patterns, and detect potential issues (e.g., missing values, outliers).
# 
# EDA helps you understand what your data can tell you beyond the formal modeling and hypothesis testing tasks. It involves:
# 
# 1.  **Data Summarization:** Using descriptive statistics to summarize data.
# 2.  **Data Visualization:** Using plots to reveal patterns, trends, and relationships.
# 
# ::: fragment
# **Why EDA?**
# 
# EDA ensures you know the "story" behind your data, identify possible data quality issues, and guide subsequent analytical steps.
# :::
# 
# # Obtaining Summary Statistics with R {background-color="#cfb991"}
# 
# ## Motivation: The `gapminder` Dataset
# 
# :::: {style="font-size: 80%;"}
# We will mostly use the [`gapminder`](https://CRAN.R-project.org/package=gapminder) dataset throughout this class. It contains life expectancy, population, and GDP per capita for countries over time.
# 
# ::: {style="overflow-y: auto; max-height: 350px; border: .5px solid #ccc; padding: 10px;"}
# ```{r}
# Load the gapminder package
library(gapminder)
library(tidyverse)
library(ggplot2)

# Display the dataset

# Print the dataset. This will create a long table.
knitr::kable(gapminder, format = "html", table.attr = "style='width:70%'")
# ```
# :::
# 
# `gapminder` variables include:
# 
# -   **country**: Country name
# -   **continent**: Continent of the country
# -   **year**: Observation year
# -   **lifeExp**: Life expectancy at birth
# -   **pop**: Total population
# -   **gdpPercap**: GDP per capita (inflation-adjusted)
# ::::
# 
# ## Obtaining Summary Statistics with R
# 
# Descriptive statistics give you a quick overview of data distribution and properties:
# 
# -   **Central tendency:** mean, median
# -   **Dispersion:** standard deviation, variance, range
# -   **Shape:** skewness, kurtosis
# 
# ::: fragment
# ```{r echo=T, eval=FALSE}
summary(gapminder)
# ```
# 
# These summary statistics provide specific insights into data distribution and characteristics. They are indispensable in data analysis across domains like statistics, data science, social sciences, finance, and business.
# :::
# 
# ## Understanding Summary Statistics for Different Data Types
# 
# Different data types may require distinct descriptive statistics.
# 
# -   **Numeric variables** have statistics like mean, median, variance, etc.
# 
# -   **Categorical data** have meaningful statistics like count and proportion.
# 
# ::: fragment
# When applying the `R` function `summary()` to variable(s), it automatically generates descriptive statistics tailored to the data type. For character data, which is not meant for calculation, no descriptive statistics are generated.
# :::
# 
# ## Specific Summary Statistics
# 
# -   Mean GDP per capita across all observations:
# 
# ::: fragment
# ```{r echo=T, eval=FALSE}
mean(gapminder$gdpPercap)
# ```
# 
# -   Median life expectancy:
# :::
# 
# ::: fragment
# ```{r echo=T, eval=FALSE}
median(gapminder$lifeExp)
# ```
# 
# -   Frequency counts for categorical variables:
# :::
# 
# ::: fragment
# ```{r echo=T, eval=FALSE}
table(gapminder$continent)
# ```
# 
# -   Relationships between variables (e.g., correlation between lifeExp and gdpPercap):
# :::
# 
# ::: fragment
# ```{r echo=T, eval=FALSE}
cor(gapminder$lifeExp, gapminder$gdpPercap)
# ```
# :::
# 
# # Introduction to `ggplot()` {background-color="#cfb991"}
# 
# ## Introduction to `ggplot()`
# 
# <br>
# 
# The `gg` in `ggplot()` refers to the [Grammar of Graphics](http://vita.had.co.nz/papers/layered-grammar.pdf). More than just a graphics package, `ggplot()` is a set of principles about data visualization and plot construction.
# 
# ## The Grammar of Graphics
# 
# `ggplot2` is built on the Grammar of Graphics, a coherent system for describing and building graphs. Its key components:
# 
# 1.  **Data**: The dataset you are plotting.
# 2.  **Geoms**: Geometric objects that represent data (e.g., points, lines, bars).
# 3.  **Aesthetics (aes)**: Mappings from data to visual properties like position, color, size.
# 4.  **Stats**: Statistical transformations applied to data.
# 5.  **Facets**: Dividing data into subplots based on categories.
# 6.  **Coordinates**: Defining coordinate systems and plot orientation.
# 7.  **Themes**: Control the overall appearance (background, gridlines, fonts).
# 
# ## A Simple Scatter Plot
# 
# ::: {style="font-size: 80%;"}
# Let's examine the relationship between GDP per capita and life expectancy with a scatter plot.
# 
# ```{r fig.align='center', message=FALSE, warning=FALSE}
gapminder %>%
ggplot(aes(x = gdpPercap, y = lifeExp)) +
geom_point(alpha = 0.5) +
scale_x_log10() +
labs(title="Life Expectancy vs. GDP per Capita",
x="GDP per Capita (log scale)",
y="Life Expectancy (years)")
# ```
# 
# We used `scale_x_log10()` to handle skewed GDP data.
# :::
# 
# ````{=html}
# <!---
# ## Exercise
# 
# Choose another variable from the `mpg` dataset and develop a similar plot to the one we saw.
# 
# ## Exercise: Answer
# 
# ```{r message=FALSE, warning=FALSE, results='hide'}
# mpg %>% ggplot() +  # base plot
# geom_point(mapping = aes(x = cty, y = hwy))  # add a layer of points
# ```
# --->
# ````
# 
# # Going Beyond the Basics {background-color="#cfb991"}
# 
# ## Adding Color for More Information
# 
# ::: {style="font-size: 80%;"}
# We can add continent as a third dimension through color:
# 
# ```{r fig.align='center', message=FALSE, warning=FALSE}
gapminder %>%
ggplot(aes(x = gdpPercap, y = lifeExp, color = continent)) +
geom_point(alpha = 0.5) +
scale_x_log10() +
labs(title="Life Expectancy vs. GDP by Continent",
x="GDP per Capita (log scale)",
y="Life Expectancy (years)")
# ```
# :::
# 
# ## Facets
# 
# ::: {style="font-size: 80%;"}
# We can separate plots by continent using `facet_wrap()`:
# 
# ```{r fig.align='center', message=FALSE, warning=FALSE}
gapminder %>%
ggplot(aes(x = gdpPercap, y = lifeExp)) +
geom_point(alpha = 0.5) +
scale_x_log10() +
facet_wrap(~ continent) +
labs(title="Life Expectancy vs. GDP by Continent (Faceted)",
x="GDP per Capita (log scale)",
y="Life Expectancy")
# ```
# :::
# 
# ## Adding Smooth Curves
# 
# ::: {style="font-size: 80%;"}
# Add a trend line:
# 
# ```{r fig.align='center', message=FALSE, warning=FALSE}
gapminder %>%
ggplot(aes(x = gdpPercap, y = lifeExp)) +
geom_point(alpha = 0.5) +
geom_smooth(method="loess", se=FALSE) +
scale_x_log10() +
labs(title="Trend in Life Expectancy vs. GDP",
x="GDP per Capita (log scale)",
y="Life Expectancy")
# ```
# :::
# 
# # Themes {background-color="#cfb991"}
# 
# ## Themes
# 
# <br>
# 
# Beyond the structural elements we've seen, a good data presentation also depends on aesthetic adjustments. Let's briefly cover some possibilities.
# 
# `ggplot` already comes with some predefined themes. You are not obliged to like that gray background: let's reproduce the plot of the relationship between engine size and efficiency, using the themes `theme_bw`, `theme_light`, `theme_dark`, `theme_minimal`, and `theme_classic`.
# 
# ## Original Plot
# 
# ```{r fig.align="center"}
gapminder %>%
ggplot(aes(x = gdpPercap, y = lifeExp)) +
geom_point(alpha = 0.5) +
scale_x_log10() +
labs(title="Life Expectancy vs. GDP per Capita",
x="GDP per Capita (log scale)",
y="Life Expectancy (years)")
# ```
# 
# ## Black and White
# 
# ```{r fig.align="center"}
gapminder %>%
ggplot(aes(x = gdpPercap, y = lifeExp)) +
geom_point(alpha = 0.5) +
scale_x_log10() +
labs(title="Life Expectancy vs. GDP per Capita",
x="GDP per Capita (log scale)",
y="Life Expectancy (years)") +
theme_bw()
# ```
# 
# ## Light
# 
# ```{r fig.align="center"}
gapminder %>%
ggplot(aes(x = gdpPercap, y = lifeExp)) +
geom_point(alpha = 0.5) +
scale_x_log10() +
labs(title="Life Expectancy vs. GDP per Capita",
x="GDP per Capita (log scale)",
y="Life Expectancy (years)") +
theme_light()
# ```
# 
# ## Dark
# 
# ```{r fig.align="center"}
gapminder %>%
ggplot(aes(x = gdpPercap, y = lifeExp)) +
geom_point(alpha = 0.5) +
scale_x_log10() +
labs(title="Life Expectancy vs. GDP per Capita",
x="GDP per Capita (log scale)",
y="Life Expectancy (years)") +
theme_dark()
# ```
# 
# ## Minimal
# 
# ```{r fig.align="center"}
gapminder %>%
ggplot(aes(x = gdpPercap, y = lifeExp)) +
geom_point(alpha = 0.5) +
scale_x_log10() +
labs(title="Life Expectancy vs. GDP per Capita",
x="GDP per Capita (log scale)",
y="Life Expectancy (years)") +
theme_minimal()
# ```
# 
# ## Classic
# 
# ```{r fig.align="center"}
gapminder %>%
ggplot(aes(x = gdpPercap, y = lifeExp)) +
geom_point(alpha = 0.5) +
scale_x_log10() +
labs(title="Life Expectancy vs. GDP per Capita",
x="GDP per Capita (log scale)",
y="Life Expectancy (years)") +
theme_classic()
# ```
# 
# ## Other Themes?
# 
# ::: nonincremental
# For those who didn't like these themes, there are two options:
# 
# -   You can change **absolutely everything** in the plot with the `theme()` function, element by element. For that, you need to have a good eye for graphic design, as well as patience to tweak each detail. See the number of arguments that can be changed with the `?theme` command.
# 
# -   Install external packages with ready-made themes. Two that I really like are [ggthemes](https://yutannihilation.github.io/allYourFigureAreBelongToUs/ggthemes/) and [hrbrthemes](https://github.com/hrbrmstr/hrbrthemes)
# 
# On Google, you can also find many other packages.
# :::
# 
# # Types of Plots {background-color="#cfb991"}
# 
# ## What plot should I use?
# 
# <br>
# 
# So far, all the examples were made with scatter plots. However, `ggplot` supports many other types of plots: bars, areas, lines, pie charts (ugh!), etc.
# 
# <br>
# 
# <center>**What plot should I use?**</center>
# 
# ::: fragment
# It depends on the type of the variables and type of statistic relevant for each plot. **The important thing is that the logic is the same!**
# 
# In the scatter plot, we used the values of the numerical variables in our dataset. For other plots, we need other statistics: counts for bar plots, predicted values for fit curves, dispersion measures for boxplots, etc.
# 
# A good source to search for options is the [The R Graph Gallery.](https://r-graph-gallery.com/) Check it out!
# :::
# 
# <br>
# 
# ## Bar Plots with Computed Stats
# 
# ::: {style="font-size: 80%;"}
# For categorical data, `ggplot2` can compute frequencies automatically.
# 
# <center><img src="figs/visualization-stat-bar.png" width="1100px"/></center>
# :::
# 
# ## Bar Plots with Computed Stats
# 
# ::: {style="font-size: 80%;"}
# Example: Count how many records per continent:
# 
# ```{r , fig.align='center', message=FALSE, warning=FALSE}
gapminder %>%
ggplot(aes(x = continent)) +
geom_bar(fill="steelblue") +
labs(title="Number of Observations by Continent", x="Continent", y="Count")
# ```
# :::
# 
# # Positioning {background-color="#cfb991"}
# 
# ```{=html}
# <!---
# 
# ## Calculating Statistics
# 
# <br>
# 
# ::: {style="font-size: 80%;"}
# 
# Unlike the scatter plot, we don't need to specify anywhere the variable that contains the number of diamonds for each type of cut (even because this variable doesn't exist in the dataset!).
# 
# `ggplot()` recognizes that when we use `geom_bar()`, the relevant statistic is the **count** within each category and calculates this automatically. Other functions calculate other statistics by default (you can consult the `stat` argument in `?geom_bar`).
# 
# <center><img src="figs/visualization-stat-bar.png" width="1100px"/></center>
# :::
# 
# --->
# ```
# 
# ````{=html}
# <!---
# ## Exercise
# 
# Select another variable in the `diamonds` dataset to produce a new bar plot.
# 
# ## Exercise: Answer
# 
# ```{r , fig.align="center"}
# diamonds %>% ggplot() + 
# geom_bar(mapping = aes(x = clarity))
# ```
# --->
# ````
# 
# ````{=html}
# <!---
# 
# ## Calculating Statistics
# 
# <br>
# 
# Every plot has a default statistic, but we can make changes to relate two different variables, for example:
# 
# ```{r fig.height = 2, fig.align="center"}
# # Relationship between cut type and diamond dimensions
# gapminder %>% 
# filter(year == 2007) %>%
# ggplot() + 
# stat_summary(
# mapping = aes(x = continent, y = lifeExp),
# fun.min = min,
# fun.max = max,
# fun = median
# )
# ```
# 
# --->
# ````
# 
# ## Adjusting the Positioning of Elements
# 
# ::: {style="font-size: 80%;"}
# <br>
# 
# The idea of filling (`fill`) is important because it can also be used to alter the arrangement of graphical elements. For example, if we want a bar plot with relative values, we can fill the entire plotting area:
# 
# ```{r , fig.align="center"}
gap_2007 <- gapminder %>%
filter(year == 2007) %>%
mutate(lifeExp_cat = case_when(
lifeExp < 60  ~ "Low",
lifeExp <= 75 ~ "Medium",
TRUE           ~ "High"
),
# Set factor levels in the desired order: High > Medium > Low
lifeExp_cat = factor(lifeExp_cat, levels = c("High", "Medium", "Low"))
)

gap_2007 %>%
ggplot(aes(x = continent, fill = lifeExp_cat)) +
geom_bar(position = "fill") +
labs(title = "Proportions of Life Expectancy Categories by Continent (2007)",
x = "Continent",
y = "Proportion",
fill = "Life Expectancy Category")
# ```
# :::
# 
# ## Adjusting the Positioning of Elements
# 
# ::: {style="font-size: 80%;"}
# <br>
# 
# Alternatively, we might want the graphical elements to "dodge" each other, so they are not stacked:
# 
# ```{r , fig.align="center"}
gap_2007 %>%
ggplot(aes(x = continent, fill = lifeExp_cat)) +
geom_bar(position = "dodge") +
labs(title = "Count of Countries by Life Expectancy Category and Continent (2007)",
x = "Continent",
y = "Count",
fill = "Life Expectancy Category")
# ```
# :::
# 
# ## And the Pie Chart?
# 
# <center>
# 
# <img src="figs/steve-jobs-pie.jpg" width="950px"/>
# 
# [About Pie Charts](https://stats.stackexchange.com/questions/8974/problems-with-pie-charts){target="_blank"}
# 
# </center>
# 
# # Maps {background-color="#cfb991"}
# 
# # Making Maps for EDA {background-color="#cfb991"}
# 
# ## Why Maps?
# 
# Maps are crucial for EDA when dealing with geographic data. They allow us to visualize spatial patterns, regional disparities, and location-based trends.
# 
# We can combine `gapminder` with world map data to explore, for example, how life expectancy varies across the globe.
# 
# ## Getting World Map Data
# 
# We can use the `rnaturalearth` package to get world map polygons:
# 
# ::: {style="overflow-y: auto; max-height: 350px; border: .5px solid #ccc; padding: 10px;"}
# ```{r message=FALSE, warning=FALSE}
if(!require(rnaturalearth)) install.packages("rnaturalearth", repos="http://cloud.r-project.org")
if(!require(rnaturalearthdata)) install.packages("rnaturalearthdata", repos="http://cloud.r-project.org")
library(rnaturalearth)
library(rnaturalearthdata)

world <- ne_countries(scale = "medium", returnclass = "sf")

# Print the dataset. This will create a long table.
knitr::kable(world, format = "html", table.attr = "style='width:70%'")

# ```
# :::
# 
# ## Merging Gapminder Data with World Map
# 
# We need a specific year to visualize life expectancy. Let's pick 2007 (the last year in the dataset).
# 
# ```{r echo=TRUE}
gap_2007 <- gapminder %>%
filter(year == 2007) %>%
mutate(country = if_else(
country == "United States",
"United States of America",
country
))
# ```
# 
# <br>
# 
# We will join on country names. The `world` dataset uses `name` for countries:
# 
# ```{r echo=TRUE}
world_gap <- world %>%
left_join(gap_2007, by = c("name" = "country"))
# ```
# 
# ## Plotting a World Map of Life Expectancy
# 
# ```{r  message=FALSE, warning=FALSE, fig.align='center'}
# Install packages if necessary:
# install.packages(c("gapminder", "rnaturalearth", "rnaturalearthdata", "sf", "dplyr", "ggplot2", "RColorBrewer"))

library(gapminder)
library(rnaturalearth)
library(rnaturalearthdata)
library(sf)         # for working with spatial data frames
library(dplyr)
library(ggplot2)
library(RColorBrewer)

# 1. Subset gapminder data for the year 2007
#    Rename "United States" to "United States of America"
gap_2007 <- gapminder %>%
filter(year == 2007) %>%
mutate(country = if_else(
country == "United States",
"United States of America",
country
))

# 2. Get the world map data (as an sf object)
world <- ne_countries(scale = "medium", returnclass = "sf")

# 3. Join the gapminder data with the world map polygons
world_gap <- world %>%
left_join(gap_2007, by = c("name" = "country"))

# 4. Plot the map using ggplot2 with a custom Brewer palette
ggplot(data = world_gap) +
geom_sf(aes(fill = lifeExp), color = "white", size = 0.2) +
scale_fill_distiller(
palette = "YlGnBu",
direction = 1,           # 1 = low to high in brightness
na.value = "grey90",     # color for missing data
name = "Life Expectancy"
) +
labs(
title = "Global Life Expectancy in 2007"
) +
theme_minimal() +
theme(
legend.position = "right",
plot.title      = element_text(face = "bold", size = 14)
)

# ```
# 
# ## Mapping the US: states
# 
# A good option to plot the US maps with `usmap` package:
# 
# ```{r  message=FALSE, warning=FALSE}
library(usmap)
library(ggplot2)

usmap::plot_usmap()

# ```
# 
# ## Mapping the US: states
# 
# A good option to plot the US maps is to combine `usmap` and `ggplot2` packages:
# 
# ```{r  message=FALSE, warning=FALSE}
library(usmap)
library(ggplot2)

plot_usmap(data = statepop, values = "pop_2022", color = "black") +
scale_fill_continuous(
low = "white", high = "red", name = "Population (2022)", label = scales::comma
) + theme(legend.position = "right") +
labs(title = "US States", subtitle = "") +
theme(legend.position = "right")


# ```
# 
# ## Mapping the US: states
# 
# We can filter the map!
# 
# ```{r  message=FALSE, warning=FALSE}

library(usmap)
library(ggplot2)

# Define a vector of Midwestern states.
# You can adjust this list if you use a slightly different definition of "Midwest."
# midwest_states <- c("IL","IN","IA","KS","MI","MN","MO","NE","ND","OH","SD","WI")

plot_usmap(
data    = statepop,
labels = TRUE,
values  = "pop_2022",
#  include = midwest_states,
include = .midwest_region,
color   = "darkgreen"
) +
scale_fill_continuous(
low   = "white",
high  = "darkgreen",
name  = "Population (2022)",
label = scales::comma
) +
labs(
title    = "Midwestern US States",
subtitle = "Population data from 2022"
) +
theme(legend.position = "right")

# ```
# 
# ## Mapping the US: counties
# 
# We will map the total amount of agricultural subsidies (in 2019 inflation-adjusted dollars) received by each US county from 2010 to 2019, focusing on the year 2019 for this example. These data come from the Environmental Working Group website (scraped and compiled by Haley Fox).
# 
# Each US county is uniquely identified by a 5-digit [FIPS code](https://transition.fcc.gov/oet/info/maps/census/fips/fips.txt)([Wiki](https://en.wikipedia.org/wiki/Federal_Information_Processing_Standard_state_code)). For example, California (state FIPS 06) and Santa Barbara County (county FIPS 083) combine to 06083.
# 
# **Source**: [Blog post “Animated map of agricultural subsidies by US county (2010-2019)” by Haley Fox, published June 26, 2022.](https://rpubs.com/haleyepperlyfox/919270)
# 
# ## Mapping the US: counties
# 
# ```{r  message=FALSE, warning=FALSE, fig.align='center'}
# source: https://rpubs.com/haleyepperlyfox/919270
if (!require(librarian)) {
install.packages("librarian")
library(librarian)
}
librarian::shelf(here, #creates paths relative to the top-level directory
readr, #reads csv
ggplot2, #for plotting data
usmap, #maps US data using FIPS code
transformr, #required to tween polygons
magrittr, #pipe function
dplyr, #data manipulation
gganimate) #add animation to maps

subsidies <- read_csv("https://raw.githubusercontent.com/haleyepperlyfox/ag-subsidies-gganimate/refs/heads/main/2010-19-us-county-total-subsidies-adj-inflation.csv")

# Add missing FIPS codes
data_check <- map_with_data(subsidies, values = "total_subs_adj")
data_check$fips <- as.numeric(data_check$fips)
missing_fips <- setdiff(unique(data_check$fips), unique(subsidies$fips))
subsidies_data_missing_all <- data.frame()
for(fip in missing_fips){
subsidies_data_missing_1 <- data.frame(year = sort(unique(subsidies$year)),
total_subs_adj = 0,
fips = fip)
subsidies_data_missing_all <- rbind(subsidies_data_missing_1, subsidies_data_missing_all)
}
# head(subsidies_data_missing_all)
subsidies_df <- rbind(subsidies, subsidies_data_missing_all)

# adjusting upper and lower cutoff
subsidies_df_wo_outliers <- subsidies_df %>%
mutate(total_subs_adj_cut_off = if_else(total_subs_adj > 50000000, 50000000, total_subs_adj)) %>%
mutate(total_subs_adj_cut_off = if_else(total_subs_adj < 0, 0, total_subs_adj_cut_off))

plot_usmap(data = subsidies_df_wo_outliers[subsidies_df_wo_outliers$year==2019,], values = "total_subs_adj_cut_off", size = .1)  +
scale_fill_gradient2(breaks = c(0, 10000000, 20000000, 30000000, 40000000, 50000000),
labels = c("0-", "10,000,000", "20,000,000", "30,000,000", "40,000,000", "50,000,000+"), name = "Subsidies (in 2019 $)")  +
theme(legend.position = "right", plot.title = element_text(size=14), legend.title = element_text(size=12)) +
labs(title = "Total agricultural subsidies received in 2019")

# ```
# 
# # Animations {background-color="#cfb991"}
# 
# ## To Create Animations, Use the `gganimate` Package
# 
# ```{r message=FALSE, warning=FALSE,  cache=TRUE, fig.align='center'}
library(gganimate)
library(gapminder)

gapminder %>% ggplot(aes(gdpPercap, lifeExp, size = pop, colour = country)) +
geom_point(alpha = 0.7, show.legend = FALSE) +
scale_colour_manual(values = country_colors) +
scale_size(range = c(2, 12)) +
scale_x_log10() +
# Specific code for the animation
labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'Life Expectancy') +
transition_time(year) +
ease_aes('linear')
# ```
# 
# ## Dynamic X-Axis
# 
# ```{r echo=FALSE, message=FALSE, warning=FALSE,  cache=TRUE}
gapminder %>% ggplot(aes(gdpPercap, lifeExp, size = pop, colour = country)) +
geom_point(alpha = 0.7, show.legend = FALSE) +
scale_colour_manual(values = country_colors) +
scale_size(range = c(2, 12)) +
scale_x_log10() +
# Specific code for the animation
labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'Life Expectancy') +
transition_time(year) +
labs(title = "Year: {frame_time}") +
view_follow(fixed_y = TRUE)
# ```
# 
# ## Trailing Points
# 
# ```{r echo=FALSE, message=FALSE, warning=FALSE,  cache=TRUE}
gapminder %>% ggplot(aes(gdpPercap, lifeExp, size = pop, colour = country)) +
geom_point(alpha = 0.7, show.legend = FALSE) +
scale_colour_manual(values = country_colors) +
scale_size(range = c(2, 12)) +
scale_x_log10() +
# Specific code for the animation
labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'Life Expectancy') +
transition_time(year) +
labs(title = "Year: {frame_time}") +
shadow_wake(wake_length = 0.2, alpha = FALSE)
# ```
# 
# ## Countries Separated by Continent
# 
# ```{r echo=FALSE, message=FALSE, warning=FALSE,  cache=TRUE}
gapminder %>% ggplot(aes(gdpPercap, lifeExp, size = pop, colour = country)) +
geom_point(alpha = 0.7, show.legend = FALSE) +
scale_colour_manual(values = country_colors) +
scale_size(range = c(2, 12)) +
scale_x_log10() +
facet_wrap(~continent) +
# Specific code for the animation
labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'Life Expectancy') +
transition_time(year) +
ease_aes('linear')
# ```
# 
# ## Mapping the US: counties
# 
# ::: {style="font-size: 60%;"}
# Now, let's check the total amount of agricultural subsidies from 2010 to 2019 (in 2019 inflation-adjusted dollars) received by each US county!
# 
# ```{r echo=FALSE, message=FALSE, warning=FALSE,  cache=TRUE, fig.align='center'}
# source: https://rpubs.com/haleyepperlyfox/919270
if (!require(librarian)) {
install.packages("librarian")
library(librarian)
}
librarian::shelf(here, #creates paths relative to the top-level directory
readr, #reads csv
ggplot2, #for plotting data
usmap, #maps US data using FIPS code
transformr, #required to tween polygons
magrittr, #pipe function
dplyr, #data manipulation
gganimate) #add animation to maps

subsidies <- read_csv("https://raw.githubusercontent.com/haleyepperlyfox/ag-subsidies-gganimate/refs/heads/main/2010-19-us-county-total-subsidies-adj-inflation.csv")

# Add missing FIPS codes
data_check <- map_with_data(subsidies, values = "total_subs_adj")
data_check$fips <- as.numeric(data_check$fips)
missing_fips <- setdiff(unique(data_check$fips), unique(subsidies$fips))
subsidies_data_missing_all <- data.frame()
for(fip in missing_fips){
subsidies_data_missing_1 <- data.frame(year = sort(unique(subsidies$year)),
total_subs_adj = 0,
fips = fip)
subsidies_data_missing_all <- rbind(subsidies_data_missing_1, subsidies_data_missing_all)
}
# head(subsidies_data_missing_all)
subsidies_df <- rbind(subsidies, subsidies_data_missing_all)

# adjusting upper and lower cutoff
subsidies_df_wo_outliers <- subsidies_df %>%
mutate(total_subs_adj_cut_off = if_else(total_subs_adj > 50000000, 50000000, total_subs_adj)) %>%
mutate(total_subs_adj_cut_off = if_else(total_subs_adj < 0, 0, total_subs_adj_cut_off))

plot <- plot_usmap(
data = subsidies_df_wo_outliers,
values = "total_subs_adj_cut_off",
size = .1)  +
scale_fill_gradient2(
breaks = c(0, 10000000, 20000000, 30000000, 40000000, 50000000),
labels = c("0-", "10,000,000", "20,000,000", "30,000,000", "40,000,000", "50,000,000+"),
name = "Subsidies (in 2019 $)")  +
theme(
legend.position = "right",
plot.title = element_text(size=14),
legend.title = element_text(size=12)) +
transition_time(year) +
labs(title = 'Total agricultural subsidies received in {as.integer(frame_time)}') +
ease_aes('linear')

animate(plot, height = 4, width = 7.5, units = "in", res = 150, end_pause = 10)

# ```
# 
# **Source**: [Blog post “Animated map of agricultural subsidies by US county (2010-2019)” by Haley Fox, published June 26, 2022.](https://rpubs.com/haleyepperlyfox/919270)
# :::
# 
# ## Datasaurus
# 
# ```{r echo=FALSE, message=FALSE, warning=FALSE,  cache=TRUE}
library(datasauRus)

datasaurus_dozen %>% ggplot(aes(x = x, y = y)) +
geom_point() +
theme_minimal() +
transition_states(dataset, 3, 1) +
ease_aes('cubic-in-out')
# ```
# 
# <center>[Datasaurus](https://cran.r-project.org/web/packages/datasauRus/vignettes/Datasaurus.html){target="_blank"}</center>
# 
# ## Temperatures
# 
# ```{r echo=FALSE, message=FALSE, warning=FALSE,  cache=TRUE}
airq <- airquality
airq$Month <- format(ISOdate(2004,1:12,1),"%B")[airq$Month]

airq %>% ggplot(aes(Day, Temp, group = Month)) +
geom_line() +
geom_segment(aes(xend = 31, yend = Temp), linetype = 2, colour = 'grey') +
geom_point(size = 2) +
geom_text(aes(x = 31.1, label = Month), hjust = 0) +
transition_reveal(Day) +
coord_cartesian(clip = 'off') +
labs(title = 'Temperature in New York', y = 'Temperature (°F)') +
theme_minimal() +
theme(plot.margin = margin(5.5, 40, 5.5, 5.5))
# ```
# 
# # Conclusion {background-color="#cfb991"}
# 
# ## Conclusion
# 
# <br>
# 
# What we've seen is more than just a tool for creating plots. It's a complete syntax that allows you to **think** about the information you want to convey and **produce** practically any type of plot that suits your needs.
# 
# `ggplot()` allows for an infinite number of plot types. It wouldn't be worthwhile to do an extensive survey at this time, as that would be tedious and would end up hindering the absorption of the fundamentals of the grammar of graphics.
# 
# # Summary {background-color="#cfb991"}
# 
# ## Summary
# 
# :::: nonincremental
# ::: {style="font-size: 60%;"}
# Main Takeaways from this lecture:
# 
# -   **Exploratory Data Analysis (EDA)** is a crucial first step in the data mining process.
# 
# -   It involves understanding and summarizing the main characteristics of a dataset.
# 
# -   **Two primary categories** of EDA:
# 
# -   **Data Summarization**: Involves generating descriptive statistics.
# 
# 1.  **Summarizing data**: Providing a concise overview of variables. Summary statistics include **measures of central tendency**, **dispersion**, and **shape**.
# 
# 2.  **Exploring relationships**: Identifying correlations and associations between variables.
# 
# -   **Data Visualization**: Helps in visualizing data patterns and insights.
# 
# -   **R functions** like `summary()`, `mean()`, `median()`, `table()`, `cor()`, and `cov()` are used to explore data and identify key statistics.
# 
# -   **Understanding `ggplot()` and the Grammar of Graphics**: Plots are constructed by creating a base plot and successively adding layers of graphical elements.
# 
# -   **Advanced Plotting Techniques**:
# 
# -   Adding more layers to include additional information (e.g., `geom_smooth()` for trend lines).
# -   Using `facet_wrap()` and `facet_grid()` to create multi-panel plots for different subsets of data.
# -   Transforming plots with coordinate functions like `coord_flip()` for horizontal plots and `coord_polar()` for radial plots.
# 
# -   **Working with Computed Statistics**: Recognize that `ggplot2` can compute statistics automatically (e.g., counts in `geom_bar()`).
# 
# -   **Creating Animations with `gganimate`**: Animations can illustrate changes over time or transitions between states in the data.
# 
# -   **Effective Data Visualization Practices**
# 
# -   Emphasize the importance of choosing the right type of plot for the data and the message.
# -   Understand that effective visualizations are crucial for exploratory data analysis and communicating insights.
# -   Apply the Grammar of Graphics principles to create clear, informative, and aesthetically pleasing plots.
# :::
# ::::
# 
# # Thank you! {background-color="#cfb991"}
