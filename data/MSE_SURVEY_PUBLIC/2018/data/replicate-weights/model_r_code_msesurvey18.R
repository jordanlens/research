######### SAMPLE CODE - MSE SURVEY 2018 ##########

# load packages
library(survey)
library(openxlsx)

# read-in data
msedata    <- read.xlsx("~/filepath/mse18.xlsx")
repweights <- read.csv("~/filpath/replicate_weights.csv", 
                       stringsAsFactors = FALSE)

# define survey design
stopifnot(all.equal(msedata$instance, repweights$instance))
bootdsg    <- svrepdesign(data = msedata, 
                          type = "bootstrap", 
                          repweights = repweights[, -1],
                          weights = ~propwt,
                          combined.weights = FALSE)

# estimate quantity of interest
svymean(~Q007, bootdsg)
