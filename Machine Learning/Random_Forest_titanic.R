#  Course          : CS 513
#  First Name      : Yash
#  Last Name       : Mahendra


## Step 0 clean up!!!

library()
rm(list=ls())

install.packages('randomForest')

library(randomForest)
 
?randomForest()
?importance()
?tuneRF()
dsn<-
  read.csv("E:/Semester 2/KDD/R Programs Professor/Titanic_rows.csv")

?read.csv()
set.seed(123)
dsn2<-na.omit(dsn)
set.seed(123)
?ifelse


index<-sort(sample(nrow(dsn2),round(.25*nrow(dsn2))))
View(index)
training<-dsn[-index,]
test<-dsn[index,]

#importance means to measure importance of the values
fit <- randomForest( Survived~., data=training, importance=TRUE, ntree=1000)
importance(fit)
varImpPlot(fit)
Prediction <- predict(fit, test)
table(actual=test[,4],Prediction)


wrong<- (test[,4]!=Prediction )
error_rate<-sum(wrong)/length(wrong)
error_rate 

 
