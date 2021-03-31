install.packages("ggplot2")
library(ggplot2)
library(gapminder)
library(dplyr)

##### ggplot2 #####

ggplot(gapminder, aes(x=gdpPercap, y=lifeExp, col=continent, size=pop)) +
  geom_point() + scale_x_log10()

gapminder %>% 
  filter(year == 1952 & continent == "Asia") %>%
  ggplot(aes(reorder(country, pop), pop)) + geom_bar(stat = "identity") + coord_flip() # Switch X and Y

gapminder %>% filter(country == "Korea, Rep.") %>% ggplot(aes(year, lifeExp, col = country)) +
  geom_point() + geom_line()

# Make dataframe

df <- data.frame(gp = factor(rep(letters[1:3], each = 10)), y=rnorm(30))
glimpse(df)

# summarize

ds <- df %>% group_by(gp) %>% summarize(mean = mean(y), sd = sd(y))
ds

ggplot() +
  geom_point(data = df, aes(x = gp, y =y)) +
  geom_point(data = ds, aes(x=gp, y=mean), colour = 'red', size=3) +
  geom_errorbar(data = ds, aes(x=gp, ymin = mean - sd, ymax = mean + sd), colour = 'red', width = 0.4)

gapminder %>% ggplot(aes(lifeExp)) +geom_histogram()

# Freauency ploygon

gapminder %>% ggplot(aes(x = gdpPercap)) + geom_freqpoly() +scale_x_log10()

# Kernal density

gapminder %>% ggplot(aes(x = gdpPercap)) + geom_density() +scale_x_log10()

# Facet_

gapminder %>%
  ggplot(aes(year, lifeExp, group = country)) +
  geom_line() +
  facet_wrap(~continent)

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, col=continent, size = pop)) +
  geom_point(alpha = 0.5) + scale_x_log10() + facet_wrap(~year)

##### Categorical Variables #####

# Frequency
table(diamonds$cut)

# Relative frequency
prop.table(table(diamonds$cut))

# Percent
round(prop.table(table(diamonds$cut))* 100, 1)

# Summary using 'dplyr'

diamonds %>%
  group_by(cut) %>%
  tally() %>%
  mutate(pct = round(n/sum(n)* 100, 1))

# Scatter plot

p1 <- diamonds %>%
  ggplot(aes(cut, price)) + geom_point(alpha=0.1)


p2 <- diamonds %>%
  ggplot(aes(cut, price)) + geom_jitter()

install.packages("gridExtra")
library(gridExtra)

grid.arrange(p1, p2, ncol=1)

# Boxplot

diamonds %>%
  ggplot(aes(cut, price)) + geom_boxplot()

##### Titanic datasets #####

glimpse(data.frame(Titanic))

xtabs(Freq ~ Class + Sex + Age + Survived, data.frame(Titanic))

addmargins(apply(Titanic, c(1,4),sum))

mosaicplot(Titanic, main = "Survivial on Titanic", color = TRUE)
mosaicplot(Titanic, main = "Survivial on Titanic", color = c("red", "blue"), off =1)

# Comparison of survival rates

# Male vs Female
apply(Titanic, c(2,4), sum)
round(prop.table(apply(Titanic, c(2,4), sum), margin = 1), 3)


data.frame(Titanic) %>%
  group_by(Sex) %>%
  summarize(n = sum(Freq),
            survivors = sum(ifelse(Survived == "Yes", Freq, 0))) %>%
  mutate(rate_survival = survivors/n)
 
# Child vs Adult
apply(Titanic, c(3,4), sum)
round(prop.table(apply(Titanic, c(3,4), sum), margin = 1), 3)
