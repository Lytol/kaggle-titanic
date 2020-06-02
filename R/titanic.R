library(readr)
library(dplyr)
library(here)

train_data <- read_csv(here("data/raw/train.csv"),
  col_types = cols(
    PassengerId = col_integer(), 
    Survived = col_logical(),
    Pclass = col_factor(levels = c(1, 2, 3)),
    Sex = col_factor(levels = c("male", "female")),
    Age = col_double(),
    SibSp = col_integer(),
    Parch = col_integer(), 
    Embarked = col_factor(levels = c("C", "Q", "S"))
  )
)

test_data <- read_csv(here("data/raw/test.csv"),
  col_types = cols(
   PassengerId = col_integer(), 
   Pclass = col_factor(levels = c(1, 2, 3)),
   Sex = col_factor(levels = c("male", "female")),
   Age = col_double(),
   SibSp = col_integer(),
   Parch = col_integer(), 
   Embarked = col_factor(levels = c("C", "Q", "S"))
  )
)

write_predictions <- function(df, path) {
  df %>%
    select(PassengerId, Survived) %>%
    write_csv(path)
}