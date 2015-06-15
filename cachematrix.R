## These functions behaves the same as the makevector and cachemean functions
## given in this assignment as examples, except that, instead of alowing the 
## user to avoid repeatedly calculating the mean of a numeric set, these allow
## the user to avoid repeatedly calculating the inverse of a (square) matrix.



## Running makeCacheMatrix on an input matrix saves that matrix in a special
## object form that the second function (cacheSolve) can understand, namely a 
## list of 'set', 'get', 'setinverse', and 'getinverse' functions that will be 
## called by the second function.

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL ## 'reinitializes' the value of i to NULL
        set <- function(y) {
                x <<- y
                i <<- NULL ## i becomes NULL on run of set() even if it is 
        }                   ## defined elsewhere (i.e. in another matrix)
        get <- function() x
        setinverse <- function(solve) i <<- solve
        getinverse <- function() i
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}



## This is where the inverse of matrix x is actually calculated.  If this has 
## already been done (if i is not NULL), the inverse "i" is simply returned. 

cacheSolve <- function(x, ...) {
        i <- x$getinverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data)
        x$setinverse(i)
        i
}
