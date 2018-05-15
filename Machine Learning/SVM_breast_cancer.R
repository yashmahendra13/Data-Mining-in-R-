
rm(list=ls())

 

bc<-
  read.csv("C://AIMS/Stevens_/2018_DataMining/Raw_Data/breast-cancer-wisconsin.data.csv",
           na.strings = "?")

bc2<-na.omit(bc)

index <- seq (1,nrow(bc2),by=5)
test<-bc2[index,]
training<-bc2[-index,]
library(e1071)
?svm
 ## svm
svm.model <- svm( factor(Class)~ ., data =training[,-1] )
 svm.pred <- predict(svm.model,  test[,-1] )
 
 table(actual=test[,11],svm.pred )
 SVM_wrong<- (test$Class!=svm.pred)
 rate<-sum(SVM_wrong)/length(SVM_wrong)
  