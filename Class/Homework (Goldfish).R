#Dataset download link: https://www.kaggle.com/datasets/stealthtechnologies/predict-lifespan-of-a-comet-goldfish
#The downloaded dataset was saved on dedicated folder- C:\\Users\\AFSS-Student\\Documents\\R\\Dataset

# Loading the Dataset into R 
##header=1: signal that the column name as indicated in the dataset be applied to the imported dataset 
###for header can also be T,TRUE
Goldfish <- read.csv("C:\\Users\\AFSS-Student\\Documents\\R\\Dataset\\fish_data.csv", header=1)

class(Goldfish) #class of the dataset
dim(Goldfish)   #dimension of the dataset
str(Goldfish)   #Structure of the dataset