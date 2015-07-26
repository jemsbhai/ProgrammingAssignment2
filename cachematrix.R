## Put comments here that give an overall description of what your
## functions do

##the inverse of a matrix is found in R using the ginv() function
## to access this function we need the MASS package


## hello all you happy people

## Write a short comment describing this function
## this function will cacche a matrix
## we use the same example like shown for a vector, except now the function is
## not mean, its ginv

makeCacheMatrix <- function(x = matrix()) {
  ##first, load MASS package
  install.packages("MASS")
  library("MASS")
  
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(ginv) inv <<- ginv
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## Write a short comment describing this function
## same method as shown in example, but use the variables described above



cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- ginv(data, ...)
  x$setinverse(inv)
  inv
}
