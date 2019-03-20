#Question3 - 45531056 Christian Laksmono 

#3a Read the data set into R and name it dataset
plot(dataset)

dataset

#3b Exclude all data contain NA 
omitplot <- na.omit(dataset)
na.omit(dataset) #remove all the na data 

#3c Plot Singapore GDP against Time ; x axis = Time ; y axis= GDP(%) ; Title = Singapore GDP Growth

x <-omitplot[,c(1,3)] #taking column 1 and 3 as data 
plot(x,main="Singapore GDP Growth",xlab="Time",ylab="GDP(%)") 

#3d #read how to data with subset  
omitplot[,c(1,3)]
omitplot[36:40,c(1,2,3)] #checker: last data with period 1 is data 36

period <- omitplot[,c(2)] #c(2) is period data with no NA data
x <-omitplot[,c(3)] #x is gdp and time data that we want to observe 
gdp1 <- subset(x,period==1) #gdp1 = select gdp with period=1 at c(2)
gdp2 <- subset(x,period==2) #gdp2 = select gdp with period=2 at c(2)
gdp3 <- subset(x,period==3) #gdp3 = select gdp with period=3 at c(2)

#mean for gpd in each period
meangdp1<-colMeans(gdp1, na.rm=FALSE, dims=1) 
meangdp2<-colMeans(gdp2, na.rm=FALSE, dims=1)
meangdp3<-colMeans(gdp3, na.rm=FALSE, dims=1)

#standard deviation for each period
sdgdp1<-apply(gdp1,2,sd)
sdgdp2<-apply(gdp2,2,sd)
sdgdp3<-apply(gdp3,2,sd)

stat.table <- matrix(c(meangdp1,meangdp2,meangdp3,sdgdp1,sdgdp2,sdgdp3),ncol=3,byrow=TRUE)
rownames(stat.table) <- c("Mean","Standard Deviation")
colnames(stat.table) <- c("Period 1","Period 2","Period 3")

c(meangdp1,meangdp2,meangdp3)
c(sdgdp1,sdgdp2,sdgdp3)

stat.table

#3e #Scatterplot for everything except time & period 

pairs(~gdp+exp+epg+hpr+gdpus+oil+crd+bci,data=omitplot,main="Scatterplot")

#3f #use linear regression modelling 

linmodel <- lm(gdp ~ exp, data=omitplot) #exp~gpd x-y linear modelling 
linmodel
summary (linmodel)

#3G #use multiple regression modelling 

mulmodel <- lm(gdp ~ exp + epg + hpr + oil + gdpus + crd, data=omitplot) #multiple-regression-model
summary(mulmodel)

#3H Calculate 5% Quantile, Create factor vector for economy state, Vector using dataset naming 

gdpdata<- (omitplot$gdp) #omitplot$gdp = data of gdp in omitplot
gdpdata
a <- quantile(omitplot$gdp,0.05) #calculate gdp data for quantile = 0.05
a


cond1 <- (gdpdata<a) #state = condition when gdp < 0.05 quantile 
cond1
state <-factor(cond1,labels=c("Normal","Crisis")) # change true/false into normal/crisis 
state

omitplot2=data.frame(omitplot,state) #put vector in dataset 
omitplot2 


#regressionmodelling 

year <- omitplot2[,c(1)]
year

omitplot2007 <- subset(omitplot2,year<2008) #remove data after 2007
omitplot2007

trainbci<-omitplot2007[,c(10,11)] #compare data for bci and state 
trainbci

glmmodel <- glm(state ~ bci, data=omitplot2007,family="binomial") #logistic-regression-modelling 
summary(glmmodel)

coef(glmmodel) #in order to access coefficient only 
summary(glmmodel)$coef

glmprobs <- predict(glmmodel,type="response") #make a prediction from model
glmprobs

statec<- contrasts(state) #simplify the result to 0 & 1 

glmpred <- rep("Normal",1000) #assume 1000 event happen, probability <= 50% normal 
glmpred[glmprobs>.5] <- "Crisis" #probability >50% crisis

table1 <- table(glmpred)#number of crisis & normal in Prediction state
table2 <- table(state) #number of crisis & normal in data 

table3 <- data.frame(table1,table2) #comparison in predictor and real data
table3

normal <- table1[(2)] + table2[(1)]#number of normal

crisis <- table1[(1:1)] + table2[(2:2)] #number of crisis 

total <- normal + crisis #number of data 

confmatrix <- normal/total #confirmation matrix formula

confmatrix #confirmation matrix 

#Code by: Christian Laksmono 45531056
