library(readr)
day2 <- read_table2("GitHub/Advent-Of-Code-2020/day2.txt", 
                    col_names = FALSE)
View(day2)
library(tidyr)
library(dplyr)
library(stringr)

# the prompt: https://adventofcode.com/2020/day/2

## making the columns easier to work with
day2new <- day2 %>% separate(X1, c("min", "max")) %>% separate(X2, "letter")
day2new$min <- as.numeric(day2new$min)
day2new$max <- as.numeric(day2new$max)


## Part 1 - counting # letters in passwords

sum <- 0 # create a sum variable set at 0 to sum up the not valid passwords
complete <- 0
# now doing a for loop to check each password
for(row in 1:nrow(day2new)) {
  letter <- day2new[row, "letter"]
  pass  <- day2new[row, "X3"]
  min  <- day2new[row, "min"]
  max <- day2new[row, "max"]
  
  count <- str_count(as.character(pass),as.character(letter)) # this outputs the # of times letter occurs in pass
  
  if(count >= min && count <= max) {
    sum <- sum + 1
  }
  complete <- complete + 1
}
print(sum)
print(complete) # this is to verify it processed them all

## Part 2 - position of letters in passwords

View(day2new)

valid <- 0 #summing the valid passwords
notvalid <-0 #summing the not valid passwords
complete <- 0 #summing the total proccessed rows

for(row in 1:nrow(day2new)) {
  letter <- unname(unlist(day2new[,3])) # I don't know if this is all necessary but it works
  pass  <- unname(unlist(day2new[,4]))
  min  <- day2new[row, "min"]
  max <- day2new[row, "max"]
  
  positions <- unlist(str_locate_all(pass[row], letter[row]))
  if(min %in% positions == TRUE && max  %in% positions == FALSE) {
    valid <- valid + 1
  }
  if(min %in% positions == FALSE && max  %in% positions == TRUE) {
    valid <- valid + 1
  }
  if(min %in% positions == FALSE && max  %in% positions == FALSE) {
    notvalid <- notvalid + 1
  }
  if(min %in% positions == TRUE && max  %in% positions == TRUE) {
    notvalid <- notvalid + 1
  }
  complete <- complete + 1
}
print(valid)
print(notvalid)
print(complete)