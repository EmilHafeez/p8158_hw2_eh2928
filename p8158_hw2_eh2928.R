library(psych)
library(GPArotation)

### Read in the genetic testing data
dat <- read.csv("/Users/emilhafeez/Google Drive/Columbia/Spring 2021/Latent Variables and SEM/Homework 2/p8158_hw2_eh2928/genetictestingrawdata.csv",head = TRUE,sep = ",")

### Grab just the financial features
features = dat[,c(2, 4, 5, 6, 15)]

### Write descriptive stats to screen
summary(features)

### Here we use polychoric correlation and do parallel analysis of eigenvalues
geneticparallel <- fa.parallel(features, cor = "poly", fa = "pa")
geneticparallel$pc.values
geneticparallel$pc.sim
