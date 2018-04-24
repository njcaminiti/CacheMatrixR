## Caching the Inverse of a Matrix to reduce redundant computation

Matrix inversion in R a relatively costly computation so there may be 
some benefit to caching the inverse of a matrix rather than computing 
it repeatedly. 


### CacheMatrix.R Contains the following functions:

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
    
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` should retrieve the inverse from the cache.
