## Put comments here that give an overall description of what your
## functions do


# This function creates a special matrix which is
# really a list containing a function to
# cache the inverse of a matrix.
# 1.  set the value of the matrix
# 2.  get the value of the matrix
# 3.  set the value of the inverse matrix
# 4.  get the value of the inverse matrix


makeCacheMatrix <- function(x = matrix()) {
  M <- NULL
  set <- function(y){
    x <<- y
    M <<- NULL
  }
  get <- function() x
  setMInv <- function(inverse) M <<- inverse 
  getMInv <- function() M
  list(set = set, get = get, setMInv = setMInv, getMInv = getMInv)
  

}


## The following function calculates the inverse of the special matrix
# created with the above function. It first checks to see if the
# inverse has already been calculated. If so, it will get that inverse
# matrix from the cache and then skips the calculation. 
# Otherwise, it calculates the inverse of the data and sets the value 
# of the inverse matrix in the cache by the setMInv function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  M <- x$getMInv()
  if(!is.null(M)) {
    message("getting cached data")
    return(M)
  }
  data <- x$get()
  M <- solve(data, ...)
  x$setMInv(M)
  return(M)
}
