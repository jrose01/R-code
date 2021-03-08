  # import data
  layers <- read.csv("jrose.csv")
  n <- nrow(layers)
  
  # vector of variable names 
  vars <- paste("layer", 1:5, sep="")
  
  # what are the possible values?
  values <- apply(layers[vars], MARGIN=1, FUN=paste, collapse=" ")
  values <- unique(unlist(strsplit(values, " ")))
  values <- values[values != ""]
  nv <- length(values)
  
  
  # create new variables
  dummies <- as.data.frame(matrix(0, nrow=n, ncol=nv))
  names(dummies) <- paste(values, "_present", sep="")
  
  # tabulate present absent for each row
  for (i in 1:n){                  
    for (j in vars){               
      for (k in 1:nv){             
        if(!is.na(layers[i, j]) & layers[i, j] == values[k])
            dummies[i, k] <- 1
      }
    }
  }

layers <- merge(layers, dummies)
