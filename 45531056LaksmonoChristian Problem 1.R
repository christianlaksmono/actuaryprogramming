#Question1 - 45531056 Christian Laksmono 

#time-unit=halfyearly   

#use input as input for (Total Coupon, Face Value, Interest at Following Half Years, Last Payment )

input <- function (coupon,face,y,tn) 
  
{ 
  
  int <- c(1:tn) #unit time for interest 

  Price = (sum(coupon*exp(-y*int))) + (face*exp(-y[tn]*tn)) #Price of a Bond formula 
  
  return(Price)

}

#TestCase 

#interest at y time is varies, therefore we need to store those interest
interest <- c(0.01,0.02,0.03,0.04,0.05) #assume tn=5 #and a[] the value of interest at that halfyear   
input(1000,5000,interest,5)

#Code by: Christian Laksmono 45531056

  
  