aa <- function  (C,F,y,n) #use aa as input for (Total Coupon, Face Value, Interest at Following Half Years, Last Payment )
  {
  v <- c(1:n) #matrix for [interest at 1st half year, Intrest at 2nd Half year, ..., Interest at nth Half year]
  P = (sum(C*exp(-y*v))) + (F*exp(-y[n]*n)) #Price of Bond Formula
  return(P)     
}

#input 
a <- c(0.05,0.07,0.01) #assuming there's only 3 half years, and a[] the value of interest at that halfyear
aa(5000, 7000, a, 3) #input for the set parameter c,f,y,n

