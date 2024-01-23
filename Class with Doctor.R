car <- read.csv("C:\\Users\\AFSS-Student\\Documents\\R\\Dataset\\car.data.csv",header = T)

class(car)

#from the website 
Bank <- read.table(paste('http://archive.ics.uci.edu/ml/','machine-learning-databases/statlog/german/german.data',
                      sep=''),stringsAsFactors=F,header=F)

print(Bank[1:3,])

banks <- read.table("C:\\Users\\AFSS-Student\\Documents\\R\\Dataset\\Bank\\german.data-numeric",
                    sep='',stringsAsFactors=F,header=F)
