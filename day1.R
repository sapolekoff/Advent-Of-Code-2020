library(readr)
day1 <- read_csv("GitHub/Advent-Of-Code-2020/day1.csv")
View(day1)

# clone column
day1$col2 <- day1$col1

# for loop that sums each value with each other value 
for(i in day1$col1) {
  
  for(j in day1$col2) {
    
  if(i + j == 2020) {
   
    print(i) # value 1
    print(j) # value 2
    print(i*j) # what I get if I multiply them together
      }
    }
}