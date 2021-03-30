##### Dplyr function #####

install.packages("dplyr")
library(dplyr)

# tbl_df class

i2 <- as_tibble(iris)
class(i2)
i2

# Glimpse

glimpse(i2)

# Pipe operator

iris %>% head(10)

# Filter()
gapminder %>% filter(country == 'Korea, Rep.' & year == 2007)

# Arrange()

gapminder %>% arrange(year, country) # Sort in ascending order

# Select()

gapminder %>% select(pop, gdpPercap)

# Mutate()

gapminder %>% 
  mutate(total_gdp = pop * gdpPercap,
         le_gdp_ratio = lifeExp/gdpPercap,
         lgrk = le_gdp_ratio * 100)

# Summarize()

gapminder %>%
  summarize(n_obs = n(), 
            n_countries = n_distinct(country),
            n_year = n_distinct(year),
            med_gdpc = median(gdpPercap),
            max_gdpc = max(gdpPercap))

# Sampling

sample_n(gapminder, 10)
sample_frac(gapminder, 0.01)

# Distinct()

gapminder %>% select(country) %>% distinct()

# Group by()
# Median life expectancy for each continent.

gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(median(lifeExp))
