library(classInt)
library(Hmisc)
library(pROC)
library(ggplot2)

#An auxiliar function used by entropy to help put numbers in consecutive order

consecutivize <-function(x){
  result<-cumsum(c(0, diff(x)) != 0) + 1
  return(result)
}

######################################Metric Calculation##################################

#'variance
#'
#' @description calculates the variance of a given variable
#' @param x is the variable in a vector form from which the variance will be calculated
#' @return the variance in decimal form

variance <- function(x){
  return(var(x))
}

numberCol<-runif(10, min=0, max=1)
variance(numberCol)


#'entropy
#'
#' @description given an array x it calculates the entropy
#' @param x an array
#' @return a single number being the entropy

entropy <- function (x){
  arrayOfFrequencies<-c()
  x<-consecutivize(x)
  for (i in min(x):max(x)){
    #numero de apariciones de i
    appearances<-sum(x == i)
    #probabilidad de aparicion
    probability<-appearances/length(x)
    arrayOfFrequencies <- c(arrayOfFrequencies, probability)
  }

  total<-0
  for (i in arrayOfFrequencies){
    total<-(total-i*log2(i))
  }

  return(total)
}

#TEST
numberCol<-runif(10, min=0, max=1)
entropy(numberCol)

#'auc
#'
#' @description calculates the AUC of a given variable
#' @param predictor is variable to predict from (a vector of numbers)
#' @param response is a boolean array which describes whether the respones in each case is true or false
#' @return Area under the curve is returned

auc<-function(predictor,response){
  rocObj<-roc(response, predictor, auc=TRUE, plot=TRUE)
  return(rocObj$auc[1])
}

#Test
numberCol<-runif(10, min=0, max=1)
numberCol
numberCol<-sort(numberCol, decreasing = TRUE)

boolCol<-sample(c(TRUE,FALSE), 10, TRUE)
boolCol

data<-as.data.frame(matrix(c(numberCol,boolCol),ncol=2))
data
mat<-data.matrix(data)
auc(numberCol,boolCol)




######################################DATASET VARIANCE AND ENTROPY###################################

#AUXILIAR FUNCTION datasetVariance
datasetVariance <- function(data){
  mat<-as.matrix(data)

  vector<-c()
  numberOfCol<-length(mat[1,])
  for (i in 1:numberOfCol)
    vector[i]<-var(mat[,i])

  return(vector)
}
#TEST
mat<-matrix(sample(1:20,100,replace=TRUE),ncol=10)
data<-as.data.frame(mat)
datasetVariance(data)


#AUXILIAR FUNCTION datasetEntropy calculates entropy of every column in a given dataset
datasetEntropy <- function (data){
  mat<-data.matrix(data)
  vector<-c()
  numberOfCol<-length(mat[1,])
  for (i in 1:numberOfCol){
    vector[i]<-entropy(mat[,i])
  }
  return(vector)
}
res<-datasetEntropy(data)
res



######################################Filtering based on Metrics##################################

#'filterDataset (UPDATE CONTENT)
#'
#' @description delete variables with the threshold higher than "threshold" on the selected filter type (entropy or variance)
#' @param data which is any given dataframe
#' @param threshold which is the threshold to delete a variable r not (if variance is selected all the columns variances are calculated and the ones above the threshold are erased. In the case of the entropy the same is done, the entropy is calculated and everything above is erased.)
#' @return returns the dataset with the filtering done
#
filterDataset<-function(data, threshold, filterType="entropy"){
  #Filtering by variance############################
  if(filterType=="variance"){
    #getting vector of variancess
    vec<-datasetVariance(data)
    columnsToDelete<-c()
    for (i in 1:length(vec)){
      if(threshold>=vec[i]){
        columnsToDelete<-c(columnsToDelete,1)
      }
      else{
        columnsToDelete<-c(columnsToDelete,0)
      }
    }

    print(vec)
    #deleting columns
    for (i in length(vec):1){
      print(data)
      print(i)
      if(var(columnsToDelete) == 0 && columnsToDelete[i]==1){
        data<-data.frame()
      }
      else if(columnsToDelete[i]==1){
        data<-data[,-i]
      }
    }
    return(data)
  }

  #Filtering by entropy############################
  if(filterType=="entropy"){
    #getting vector of variancess
    vec<-datasetEntropy(data)
    columnsToDelete<-c()
    for (i in 1:length(vec)){
      if(threshold>=vec[i]){
        columnsToDelete<-c(columnsToDelete,1)
      }
      else{
        columnsToDelete<-c(columnsToDelete,0)
      }
    }

    print(vec)
    #deleting columns
    for (i in length(vec):1){
      print(data)
      print(i)
      if(var(columnsToDelete) == 0 && columnsToDelete[i]==1){
        data<-data.frame()
      }
      else if(columnsToDelete[i]==1){
        data<-data[,-i]
      }
    }
    return(data)
  }

}

#TEST
 numberCol1<-runif(10, min=0, max=10)
 numberCol1
 numberCol2<-runif(10, min=0, max=10)
 numberCol2
 data<-as.data.frame(matrix(c(numberCol1,numberCol2),ncol=2))
 data
 datasetVariance(data)
 dataset<-filterDataset(data,10,"entropy")
 print(dataset)

