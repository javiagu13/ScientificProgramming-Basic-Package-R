library(ScientificProgramming)
##################################################
########### WELCOME TO THE TEST FILE #############
## JUST RUN THE FILE TO SEE EVERYTHING WORKING! ##
##################################################


######################################Discretization##################################
#in vector and it discretizes it equal frequency

#'atributeDiscretizeEF
#'
#' @description given an atribute vector it separates the values with equal frequency by giving a
#' number of steps.
#'
#' As an example an vector like the following "bek<-c(2,13,1,18,3,8,4,20,7,5)" and a number "5" for instance will slice it in different ranges.
#' @param atribute is the atribute
#' @param n_bins is the number of steps
#' @return a list of two vectors, the first the actual interval each value belongs to, and the second with the set of intervals


#Test
bek<-c(2,13,1,18,3,8,4,20,7,5)
result<-atributeDiscretizeEF(bek, 5)
result



#'datasetDiscretizeEF
#'
#' @description in dataset and it discretizes it equal frequency
#'
#' As an example, a given numeric dataframe of any size is inputed and a number like "5" for instance will slice the whole dataset in different ranges.
#'
#' @param data is the actual dataset that is going to be discretizised
#' @param num.bins is the amount of steps to be applied
#' @details it does the same as discretizeEF function but with each column of the dataset
#' @return discretizised dataset
#'

#Test
mat<-matrix(sample(1:20,100,replace=TRUE),ncol=10)
data<-as.data.frame(mat)
data
datasetDiscretizeEF(data,5)



#'atributeDiscretizeEW
#'
#' @description given an atribute vector it separates the values with equal width by giving a
#' number of steps.
#'
#' As an example an vector like the following "bek<-c(2,13,1,18,3,8,4,20,7,5)" and a number "5" for instance will slice it in different ranges.
#'
#' @param atribute is the atribute
#' @param n_bins is the number of steps
#' @return a list of two vectors, the first the actual interval each value belongs to, and the second with the set of intervals

#Test
result<-atributeDiscretizeEW(1:10, 5)
result

#'datasetDiscretizeEW
#'
#' @description in dataset and it discretizes it equal width
#'
#' As an example, a given numeric dataframe of any size is inputed and a number like "5" for instance will slice the whole dataset in different ranges.
#'
#' @param data is the actual dataset that is going to be discretizised
#' @param num.bins is the amount of steps to be applied
#' @details it does the same as discretizeEF function but with each column of the dataset
#' @return discretizised dataset
#'

#Test
mat<-matrix(sample(1:20,100,replace=TRUE),ncol=10)
data<-as.data.frame(mat)
data
datasetDiscretizeEW(data,5)

######################################Correlation calculus by pairs##################################

#'atributesCorrelation
#'
#' @description it uses spearman's method to calculate the correlation of the variables in a given dataframe
#' @param data is the dataset of two variables
#' @return returns the correlation based on spearman's method


#TEST
numberCol1<-runif(10, min=0, max=10)
numberCol1
numberCol2<-runif(10, min=0, max=10)
numberCol2
numberCol3<-runif(10, min=0, max=10)
numberCol2
data<-as.data.frame(matrix(c(numberCol1,numberCol2,numberCol3),ncol=3))

atributesCorrelation(data)

######################################Plots for AUC and Mutual Information##################################

#'plotAUC
#'
#' @description it plots the area under the curve given a dataset of numbers and classes using a threshold as
#' in the previous AUC calculus.
#' @param data has two columns, the first of numbers where a threshold will be applied and the second
#' one of actual classes
#' @param threshold is the threshold to make true or false the values on the first column
#' @return AUC curve and AUC value
#'

#Test
numberCol<-runif(10, min=0, max=1)
numberCol
numberCol<-sort(numberCol, decreasing = TRUE)

boolCol<-sample(c(TRUE,FALSE), 10, TRUE)
boolCol

data<-as.data.frame(matrix(c(numberCol,boolCol),ncol=2))
data
mat<-data.matrix(data)
plotAUC(numberCol,boolCol)


#'plotMutualInformation
#'
#' @description plots mutual information correlation. Given a dataset of numbers it plots the percentage of each of the variables of the dataframe of having mutual information with the rest of the dataset.
#' @param data the dataset to be plotted
#' @param xVar x variable
#' @param yVar y variable
#' @return it returns the plot
#'


#TEST
numberCol1<-runif(10, min=0, max=1)
numberCol1
numberCol2<-runif(10, min=0, max=1)
numberCol2
data<-as.data.frame(matrix(c(numberCol1,numberCol2),ncol=2))
data
mat<-data.matrix(data)
atributesMutualInformation(data)

######################################Metric Calculation##################################

#'variance
#'
#' @description calculates the variance of a given variable
#' @param x is the variable in a vector form from which the variance will be calculated
#' @return the variance in decimal form

numberCol<-runif(10, min=0, max=1)
variance(numberCol)


#'entropy
#'
#' @description given an array x it calculates the entropy
#' @param x an array
#' @return a single number being the entropy

#TEST
numberCol<-runif(10, min=0, max=1)
entropy(numberCol)

#'auc
#'
#' @description calculates the AUC of a given variable
#' @param predictor is variable to predict from (a vector of numbers)
#' @param response is a boolean array which describes whether the respones in each case is true or false
#' @return Area under the curve is returned

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

#TEST
mat<-matrix(sample(1:20,100,replace=TRUE),ncol=10)
data<-as.data.frame(mat)
datasetVariance(data)

#TEST
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


######################################Normalization and Estandarization##################################

#'variableNormalization
#'
#' @description normalizes the vector v (it reduces the numbers to 0-1 interval)
#' @param v the vector
#' @return returns a vector normalizeda and its maximum and minumum


#test
numberCol1<-runif(10, min=0, max=10)
numberCol1
variableNormalization(numberCol1)


#'variableEstandarization
#'
#' @description it estandarizes a vector
#' @param v is the vector
#' @return returns and estandarized vector

#TEST
numberCol1<-runif(10, min=0, max=10)
numberCol1
variableEstandarization(numberCol1)


#'datasetNormalization
#'
#' @description it normalizes a whole dataset column by column
#' @param data the data
#' @return returns the dataset normalized


#TEST
numberCol1<-runif(10, min=0, max=10)
numberCol1
numberCol2<-runif(10, min=0, max=10)
numberCol2
data<-as.data.frame(matrix(c(numberCol1,numberCol2),ncol=2))
data
normalized<-datasetNormalization(data)
normalized

#'datasetEstandarization
#'
#' @description it estandarizes a whole dataset column by column
#' @param data
#' @return returns the dataset estandarized

#TEST
data
numberCol1<-runif(10, min=0, max=10)
numberCol1
numberCol2<-runif(10, min=0, max=10)
numberCol2
data<-as.data.frame(matrix(c(numberCol1,numberCol2),ncol=2))
estandarized<-datasetEstandarization(data)
estandarized


######################################Write and read datasets##################################

#'datasetReadRetyping
#'
#' @description it retypes the dataset from any kind of numbers to integer, factor or numeric
#'
#' each of the columns of the dataset will be converted to one of the mentioned types depending on its construction. If there are less than 5 values it would consider it as factor, it it has decimals as numeric, otherwise integer.
#'
#' @param data is the dataset
#' @return returns the actual retyped data
#'

#TEST
data <- read.csv("C:\\Users\\Javi\\Documents\\UNI\\SME\\myCSV.csv",header=FALSE)
newData<-datasetReadRetyping(data)
class(newData[1,1])
class(newData[1,2])
class(newData[1,3])

#'writeDatasetCSV
#'
#' @description given a dataset and a root it creates the csv
#' @param data is the dataset
#' @param root is the root
#' @return creates a csv in the root directory
#'


#TEST
numberCol1<-runif(10, min=0, max=1)
numberCol1
numberCol2<-runif(10, min=0, max=1)
numberCol2
data<-as.data.frame(matrix(c(numberCol1,numberCol2),ncol=2))
data
writeDatasetCSV(data, "C:\\Users\\Javi\\Documents\\UNI\\SME\\myCSV2.csv")


