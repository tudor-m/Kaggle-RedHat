library(data.table)
inDataTables = list()
inDataFiles = list()

inDataFiles[[1]] = "../public/0.990953/mod3108Kaggle_01-2.csv"
inDataFiles[[2]] = "../public/0.990949/mod3108Kaggle_01.csv"
inDataFiles[[3]] = "../public/0.990952/mod3108Kaggle_01_TM.csv"
inDataFiles[[4]] = "../public/0.990952_2/mod3108Kaggle_01_4_my_2.csv"

kod = 1 #0.990953
kod = 2 #0.990953
kod = 3 #0.990954 with noise 0.001
kod = 4 #0.990953

if (kod == 1)
  inCoef = c(0.8,0.2)
if (kod == 2)
  inCoef = c(0.5,0.5)
if (kod == 3)
  inCoef = c(0.4,0.4,0.2)
if (kod == 4)
  inCoef = c(0.4,0.4,0.1,0.1)

for (i in 1:length(inDataFiles))
{
  inDataTables[[i]] <- fread(inDataFiles[[i]], header=TRUE)
}

allData = inDataTables[[1]]
for (i in 2:length(inDataTables))
{
  allData = merge(allData,inDataTables[[2]],by="activity_id")
}

# add white noise and combine data
set.seed(100)
#noise = rnorm(nrow(allData),mean=1,sd=0.0001) # noise 0.990954
#noise = rnorm(nrow(allData),mean=1,sd=0.001)# noise2 0.990954 best so far
#noise = rnorm(nrow(allData),mean=1,sd=0.01)# noise3 0.990952
noise = rnorm(nrow(allData),mean=1,sd=0)# noise 0 
combinedData = 0
for (i in 1:length(inCoef))
{
  combinedData = combinedData + noise*inCoef[i]*allData[[1+i]]
}

submitData = as.data.table(cbind(allData$activity_id,combinedData))
setnames(submitData,c("activity_id","outcome"))
options(scipen = 999)

subFileName = paste(c("submit.LoadAndCombine.kod.",kod,".noise0.csv"),sep = "",collapse = "")
write.csv(submitData[,.(activity_id,outcome)],subFileName, row.names = FALSE)

options(scipen = 0)
