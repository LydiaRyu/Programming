
install.packages("gapminder")
library(gapminder)

# Choose row and column

gapminder[gapminder$country == 'Korea, Rep.', c('pop', 'gdpPercap')]
gapminder[gapminder$country == 'Korea, Rep.' & gapminder$year == 2007, ]

# Choose rows
gapminder[1:10,]

# Ordering

gapminder[order(gapminder$year, gapminder$country),]

# Choose variables

gapminder[,c('pop', 'gdpPercap')]
gapminder[, 1:3]

# Change variable names

new = gapminder
names(new)

names(new)[6] = 'gdp_per_cap'
names(new)

# Create new variable

new$total_gdp = new$pop * new$gdp_per_cap

# Summary statistics

median(gapminder$gdpPercap)
apply(gapminder[,4:6],2,mean) # 2 indicates columns

summary(gapminder)


