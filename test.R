setwd("/Users/jinhwang/School/Coursera/rprog/ProgrammingAssignment2")

# test basic functionality
nz <- 1000
z <- matrix(array(rnorm(nz*nz)),nrow=nz)

x <- makeCacheMatrix(z)
invz <- cacheSolve(x)

# this should now retrieve the cache
invz <- cacheSolve(x)

# test if it's the same as solving directly
invz.raw <- solve(z)
max(abs(invz.raw-invz))

# try resetting the matrix, which should delete the inverse
z <- matrix(array(rnorm(nz*nz)),nrow=nz)
x$set(z)

# retreive the inverse.. this should recalculate it
invz <- cacheSolve(x)

# see if there is now an error with the raw solve (should be)
max(abs(invz.raw-invz))

# try resolving and test again
invz.raw <- solve(z)
max(abs(invz.raw-invz))