library(gapminder)
library(dplyr)

# Filter

gapminder %>%
  filter( country == "Korea, Rep." | country == "China" | country =="Japan") %>%
  select(country, gdpPercap, lifeExp)


gapminder %>%
  filter(year == 1952 & continent == "Asia" & gdpPercap >= 10000)

# Summarize

gapminder %>%
  filter(year == 2007 & continent == "Asia") %>% 
  summarize(Total_pop=sum(pop))

# A comparison that meets the conditions

A<-gapminder %>%
  filter(continent == "Africa") %>%
  group_by(year) %>%
  summarize(total_pop = sum(pop))

E<-gapminder %>%
  filter(continent == "Europe") %>%
  group_by(year) %>%
  summarize(total_pop = sum(pop))

subset(A, A$total_pop > E$total_pop)

# Plot

library(ggplot2)

gapminder %>%
  filter(country == "Kuwait" & year >= 1952) %>%
  ggplot(aes(x=year, y=gdpPercap)) +
  geom_point(alpha = 0.5) +scale_y_log10()

