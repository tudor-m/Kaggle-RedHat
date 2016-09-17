library(data.table)

inDataSubs = list()
inDataFiles = list()

inDataFiles[[1]] = "../public/0.990953/mod3108Kaggle_01-2.csv"
inDataFiles[[2]] = "../public/0.990949/mod3108Kaggle_01.csv"
inDataFiles[[3]] = "../public/0.990970/mod3108Kaggle_01.csv"
inDataFiles[[4]] = "../public/0.990971/mod3108Kaggle_01.csv"
inDataFiles[[5]] = "../public/0.991647/mod3108Kaggle_01.csv"
inDataFiles[[6]] = "../public/0.991676/mod3108Kaggle_01.csv"
inDataFiles[[7]] = "../public/0.990971/mod3108Kaggle_01_TM_2.csv"
inDataFiles[[8]] = "../R/submit.LoadAndCombine.kod.6.noise5.2.csv" #0.991715
inDataFiles[[9]] = "../R/submit.LoadAndCombine.kod.6.noise5.1.csv" #0.991712
inDataFiles[[10]] = "../R/submit.LoadAndCombine.kod.7.noise4.2.csv" #0.991702
inDataFiles[[11]] = "../R/submit.LoadAndCombine.kod.7.noise4.1.csv" #0.991713
inDataFiles[[12]] = "../R/submit.LoadAndCombine.kod.8.noise5.1.csv" #0.991708
inDataFiles[[13]] = "../R/submit.LoadAndCombine.kod.8.noise4.1.csv" #0.991714
inDataFiles[[14]] = "../R/submit.LoadAndCombine.kod.8.noise4.2.csv" #0.991689
inDataFiles[[15]] = "../R/submit.LoadAndCombine.kod.8.noise4.3.csv" #0.991708
inDataFiles[[16]] = "../R/submit.LoadAndCombine.kod.8.noise4.4.csv" #0.991711
inDataFiles[[17]] = "../R/submit.LoadAndCombine.kod.8.noise4.5.csv" #0.991714
inDataFiles[[18]] = "../R/submit.LoadAndCombine.kod.9.noise4.1.csv" #0.991731
inDataFiles[[19]] = "../R/submit.LoadAndCombine.kod.10.noise4.1.csv" #0.991732
inDataFiles[[20]] = "../R/submit.LoadAndCombine.kod.11.noise4.1.csv" #0.991732
inDataFiles[[21]] = "../public/0.991678/mod3108Kaggle_01.csv"
inDataFiles[[22]] = "../public/0.991680/mod3108Kaggle_01.csv"
inDataFiles[[23]] = "../public/0.991685/mod3108Kaggle_01.csv"


for (i in 1:length(inDataFiles))
{
  tmp <- fread(inDataFiles[[i]], header=TRUE)
  inDataSubs[[i]] <- as.numeric(tmp$outcome)
  rm(tmp)
}

meanSubs=0; for (i in 1:length(inDataSubs)) meanSubs = meanSubs + inDataSubs[[i]]; meanSubs = meanSubs/length(inDataSubs)


errMess <- function(a1,a2)
{
  a1 = as.numeric(a1)
  a2 = as.numeric(a2)
  return((sqrt(sum((a1-a2)^2)))/200)
}

m = errMess(inDataSubs[[8]],inDataSubs[[11]])
print(m)
m = errMess(inDataSubs[[11]],inDataSubs[[9]])
print(m)
m = errMess(inDataSubs[[9]],inDataSubs[[10]])
print(m)

m = errMess(inDataSubs[[8]],inDataSubs[[9]])
print(m)
m = errMess(inDataSubs[[8]],inDataSubs[[10]])
print(m)



