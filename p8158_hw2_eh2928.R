library(psych)
library(GPArotation)

### Read in the genetic testing data
# Required adjustment since it reads incorrectly, and that ruins the Cronbach's coding
colClasses = c(
  rep("numeric", 20),
  c("numeric"),
  rep("factor", 4))

dat <- read.csv(
  "/Users/emilhafeez/Google Drive/Columbia/Spring 2021/Latent Variables and SEM/Homework 2/p8158_hw2_eh2928/genetictestingrawdata.csv",
  head = TRUE,
  sep = ",",
  na.strings = ".",
  colClasses = colClasses)

### Grab just the financial features
features = dat[,c(2, 4, 5, 6, 15)]

### Write descriptive stats to screen
summary(features)

### Here we use polychoric correlation and do parallel analysis of eigenvalues
#plot.new()
geneticparallel <- fa.parallel(features, cor = "poly", fa = "pc")
geneticparallel$pc.values
geneticparallel$pc.sim

#Cronbach's alpha
geneticalpha<-alpha(features)
geneticalpha
