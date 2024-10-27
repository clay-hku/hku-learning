###########################################################
#################### MSBA R Boot Camp #####################
####################   Summer 2024   ######################
####################     R Basics     #####################
###########################################################

#####################################################
### R interactive tutorial using swirl
#####################################################
install.packages("swirl")
library(swirl)
swirl() #start swirl course
bye() # leave swirl tutorial
###Then just follow the directions
###explore more swirl at https://swirlstats.com/students.html

#####################################################
### Arithmetic Operators
#####################################################

2 + 3   # Addition
2 - 3   # Substraction
2 * 3   # Multiplication
2 / 3   # Division
2 ^ 3   # Exponential
2 ** 3  # also exponential
2 %% 3  # Modulo (remainder)
2 %/% 3 # Integer division

## Relational and logical Operators
3 < 2  # less than
3 <= 2 # less than or equal to
3 > 0  # greater than
3 >= 0 # greater than or equal to
3 == 0 # equal to
3 != 0 # not equal to
!0     # not
!3     # not
3 | 0  # or
3 & 0  # and

## Quiz1
3 / 2
3 | 0
5 %/% 2
-2 & 5.0
7 %% 2
!!-9
TRUE | FALSE
3 - TRUE

#####################################################
### variables and assignment operator
#####################################################

x <- 5 # assign number 5 to x
x
x + 1  # 6
X + 1  # error:
2xyz <- 10 # error
$xyz <- 10 # error
_count <-10 # error

xyz = 10 # = is also assignment operator, but only works at the top level.

mean(x <- 1:5) # x's value is replaced with x<- 1:5
x
## operator : creates a number sequence
### NOTE: here we can use x inside because x is a parameter of function mean.
### try command "?mean"
mean(x = 2:6) # x's value is not replaced with x = 2:6


### Data types
a <- 111
class(a)

b <- 4L
class(b)

c <- "hello R!"
class(c)

### complex data type, or data structures
#####################################################
### Vector
#####################################################
### Vector with same data type
num_vector <- c(1, 2, 3) # c() is a function to combine its argument
num_vector
class(num_vector)
is.vector(num_vector)
is.numeric(num_vector)

### Vector with different data types
new_vec <- c(1, "2", FALSE)
new_vec
new_vec <- c(7, NA, FALSE)
new_vec
is.logical(c(7, NA, FALSE))
is.numeric(c(7, NA, FALSE))
is.logical(c(NA, FALSE))

### coercion of data types
as.logical(2.3) # 0 to INTO FALSE, non 0 INTO TRUE.
as.character(2)

as.numeric(TRUE) # TRUE into 1, FALSE into 0.
as.character(TRUE)

c(1, "a", TRUE) # if a character presents in a vector, R converts every other element into a charactar string
c(3, TRUE, FALSE) # if a vector only contains numbers and logicals, R converts logicals to numbers. 


### initialize a vector using vector()
## try ?vector to find more details
?vector
vector(length = 5)  # by default is to create a logical vector
## unless you explicitly indicate a data type with argument mode
num_vector <- vector(mode = "numeric", length = 10)
num_vector
##get the length of a vector
length(num_vector)


## name elements in a vector with names()
price <- c(5.3, 3.5, 6.7, 11.9)
price
fruits <- c("apple", "orange", "banana", "mongo")
names(price) <- fruits
price
## names() can also return the names
names(price)

## assign names to a vector
price <- c(apple = 5.3, orange = 3.5, banana = 6.7, mongo = 11.9)
price
price <- c(apple <- 5.3, orange <- 3.5, banana <- 6.7, mongo <- 11.9)
price <- c("apple" = 5.3, "orange" = 3.5, "banana" = 6.7, "mongo" = 11.9) # same as price <- c(apple = 5.3, orange = 3.5, banana = 6.7, mongo = 11.9)

### element-wise computation on vectors
# A vector and a single value
daily_income <- c(Tom = 10, Jimmy = 23, Lucy = 17)
monthly_income <- daily_income * 30
monthly_income

## A vector and a vector
monthly_expenses <- c(200, 700, 350)
monthly_savings <- monthly_income - monthly_expenses
monthly_savings 

## Compare two vectors
c(1, 2, 3) > c(TRUE, NA, 0)
c(0, 1, 2) & c(7, 8, 9)
!c(0, 1, 2)


## vector subset
set.seed(1234)
vec <- sample(1:100, size = 10, replace=FALSE)
vec
name <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")
names(vec) <- name
vec

#Subsetting by indices
vec[1]
vec[c(3, 4, 5)]
vec[3:5] #same as vec[c(3,4,5)]
vec[-1]  # all but the first element

# Subsetting by names
vec["a"] 
vec[c("c", "d", "e")] 
vec[-"a"] # error, - doesn't work on names

## Subsetting by a logical vector
# The logical vector and vec have the same length
vec[c(T, F, F, F, T, T, F, T, F, F)]
# The logical vector is shorter than vec - Recycling
vec[c(T, F)] # equivalent to vec[c(T, F, T, F, T, F, T, F, T, F)]
# The logical vector is longer than vec, and the exceeding digits contain TRUE – Appending NA
vec[c(T, F, F, F, T, T, F, T, F, F, T, T)]
vec[c(T, F, F, F, T, T, F, T, F, F, F, F)]

vec[name > "e"]
vec[vec > 50]


# exercise vector recycling
# When two vectors of unequal lengths, R repeats the shorter vector until it is as long as the longer vector, and then do the calculation
vec + c(1:10)
vec + c(1:2) #equivalent to (a, b..., j) + (1, 2, 1, 2, 1, 2, 1, 2, 1, 2)
vec + c(1:15) #equivalent to (a, b, ..., j, a, b, c, d, e) + (1, 2, ..., 15)
# vec is written as (a, b, ...j) for explanation.
# no worries about the "warning message" which only gives you alert to pay attention
# in case the underlying recycling is not you want.

##########################################################
## Matrix
##########################################################
## Create a matrix using 
m1 <- matrix(1:6, nrow = 2) # by default, it fills by columns
m1
matrix(1:6, ncol = 3)
m2 <- matrix(1:6, nrow = 2, byrow = T) # byrow = T, it fills by rows
m2
matrix(1:3, nrow = 2, ncol = 3) # recycling

## Combine matrices using rbind() and cbind()
mr12 <- rbind(m1, m2) # binding vectors or matrices as rows
mr12
mc12 <- cbind(m1, m2) # cbind(): binding vectors or matrices as columns
mc12
# not just bind matrices, but also bind vectors
rbind(1:3, 2:4) 
m <- matrix(1:6, nrow = 2) 
cbind(m, 98:99)

## retrieve or set the dimension
m <- 1:10
m
dim(m) <- c(2, 5)
m
dim(m)

x <- 1:10
attr(x,"dim")<- c(2, 5) # attr() get or set specific attributes of an R object
x

## get or set row names and column names
m <- matrix(1:6, nrow = 2)
m
rownames(m) <- c('row1','row2')
colnames(m) <- c('col1', 'col2', 'col3')
m

n <- matrix(1:6, nrow = 2,
            dimnames = list(c('row1', 'row2'),
                            c('col1', 'col2', 'col3')))

## matrix indexing
m <- matrix(sample(20, 12), nrow = 3)
m
#retrieve the specific element using row and column indices
m[1,2]
# alternatively, you can use the vector index 
m[1*3+1]
## retreat a subset of the matrix
m[1:2,1:2] # get the elements of the first two rows and first two columns
m[1,] # get the first row
m[,2] # get the second column

## Quiz
m[c(1, 3), 2]
m[,c(4, 3)]

# matrix algorithm - element-wise
m * m
m ^ 2
m / 10 + (m + 1)

# summation of rows and columns
rowSums(m)
colSums(m)
rowMeans(m)
colMeans(m)

# matrix multiplication
m %*% m
t(m) %*% m # t() transpose of a matrix

# inverse of a matrix
solve(m)
solve( m[1:3, 1:3] )
solve(m[1:3, 1:3]) %*% m[1:3, 1:3]  
solve(matrix(c(2, 0, 0, 2), ncol = 2)) %*% matrix(c(2, 0, 0, 2), ncol = 2)


##########################################################
## Factor: for categorical variables
##########################################################
blood <- c('AB', 'A', 'A', 'O', 'B', 'O')
class(blood)

blood_factor <-  factor(blood) #encode a vector as a factor
blood_factor
class(blood_factor)
as.numeric(blood_factor)
attr(blood_factor, "levels") #attr() gets or sets specific attributes of an object

### structure of factors
str(blood_factor)
as.numeric(blood_factor) # levels are stored as numeric

# reorder factors
blood_factor <- factor(blood, levels = c('O', 'A','B', 'AB')) # use attribute 'levels' to explicitly encode factor order
str(blood_factor)
levels(blood_factor)
#set or get levels
levels(blood_factor) <- c('BT_O', 'BT_A', 'BT_B', 'BT_AB') # rename the levels
blood_factor

# labels
factor(blood, labels = c('BT_A', 'BT_AB', 'BT_B', 'BT_O')) #add labels for the levels
factor(blood, levels = c('O', 'A', 'B', 'AB'), labels = c('BT_O', 'BT_A', 'BT_B', 'BT_AB'))


## ordered factor
tshirt <- c("M", "S", "M", "L", "L", "S")
tshirt_factor <- factor(tshirt, ordered = T, levels = c('S', 'M', 'L')) # ordered = TRUE sepcifies that the levels follow ascending order
tshirt_factor
tshirt_factor[2] > tshirt_factor[1]

##########################################################
## List
##########################################################
grade <- list('A+', 4.3, 'A', 3.9)
grade
list('A+', 4.3, c(4.3, '4'))

# we can even have nested lists
list1 <- list(100:130, "R", list(TRUE, FALSE))

list1[2] #single bracket indexes tell which element (list) of the list is being displayed
list1[[1]] # double-bracketed indexes tell which element(content) of the list is being displayed. 
list1[[1]][1] #The single-bracket indexes tell which subelement of an element is being displayed.


###? Quiz
x <- seq(1, 10, by = 3) # seq creates a sequence from 1 to 10 with step 3
y <- rep(4,3) # rep replicates the (first parameter) value by (the second parameter) times
z <- list(x, y)
z[c(1)]
z[c(1,3)]
z[[c(1,3)]]
z[[c(1)]][3]


### lists have attribute names
names(grade) <- c('MSBA7001','MSBA7002','MSBA7003','MSBA7004')
grade
grade <- list('MSBA7001' = 'A+', 'MSBA7002' = 4.3, 'MSBA7003' = 'A', 'MSBA7004' = 3.9)
grade[[2]]
grade$MSBA7002
names(grade)

grade$comment <- 'This student is doing very well'
grade[['certificate']] <- 'First Honor'
grade[[8]] <- "4.0"
str(grade) #display the structure of an object
grade

## Partial matching of name is allowed for $ and [[]]
grade[['co']] 
grade[['co', exact=FALSE]]
grade$co




##########################################################
## dataframe
##########################################################
name <- c('Lucy', 'Helen', 'Johnny', 'Jimmy', 'Victor', 'Hilda', 'Anthony')
age <- c(21, 23, 24, 22, 25, 21, 25)
attendance <- c(T, F, T, F, F, T, F)
df <- data.frame(name, age, attendance) # create a dataframe df with the previous three vectors as the three columns
df
str(df)
summary(df)
dim(df)
nrow(df)
ncol(df)
## 
head(df) # by default it returns first 6 rows. check ?head
tail(df)
names(df)
colnames(df)
rownames(df)

### subsetting a data frame 
##Data frame is essentially a list
## Therefore, subsetting a list also works in subsetting a data frame
## use single index to return columns
df[3]
df[3][2]
df[[3]][2] ## the way to access list also works
df[[c(1,2)]] ## the second record of the first variable
df[[1,2]] ## equivalent to df[1,2], to retrieve the first record of the second variable

## However, more often we use double index to access the row or column similar as a matrix
## double index specify rows and columns
df[3, ] # return the third row
df[, 3] # return the thrid column
df[3, 'age'] # return the third row of column (variable) "age"
df[3, 2]
df[c(1,3), c(1,2)]

class(df[,3])
class(df[3,])
is.list(df[3,])

## logical index
df[attendance, c('age', 'name')] # returns records when attendance is true
df[attendance, c(2, 1)]
df[attendance,]
## different from df[,'attendance']
df[,'attendance']
df[age > 23, ] #display the records who is elder than 23

## get or add a single columns or variable using $
df$name
df$age
df$height <- c(178, 189, 185, 165, 176, 167, 164)
df

## some operations on matrix also work
## add new columns
weight <- c(78, 89, 85, 65, 76, 67, 64)
cbind(df, weight)
df <- cbind(df, weight)

## add new records
charlie <- c("Charlie", 21, T, 183, 83)
rbind(df, charlie)

## save and load data
write.csv(df, file = "bootcamp_df.csv", row.names = FALSE) # data is saved in your work space directory
## load data
bootcamp_df <- read.csv(file = "bootcamp_df.csv", header = T, sep = ",")
head(bootcamp_df)
