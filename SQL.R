# SQL in R

install.packages("sqldf")
library(sqldf)

sqldf("select * from iris")

# Join examples

install.packages("dplyr")
library(dplyr)

df1 <- data_frame(x = c(1, 2), y = 2:1)
df1

df2 <- data_frame(x = c(1, 3), a = 10, b = "a")
df2

sqldf("select *
      from df1 inner join df2
      on df1.x=df2.x")

sqldf("select *
      from df1 left join df2
      on df1.x = df2.x")
