## These functions will take a matrix as input, check whether the inverse
## has been calculated. If it is, it will retrieve it from the cache. If not,
## it will calculate the inverse, assign it, and make available to the parent
## environment. The last function will return the inverse of the matrix.

## makeCacheMatrix function will generate 4 functions, set(), get(),
## setinverse(), getinverse(), and initialize 2 data objects x and inv
## available to the parent environment.


makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
set <- function(y) {
        x <<- y
        inv <<- NULL
}
get <- function() {x}
setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list (set = set, get = get,
        setinverse = setinverse,
        getinverse = getinverse)
}

## cacheSolve will return a matrix that is the inverse of x. If it
## has already been calculated, it will retrieve it from the cache.

cacheSolve <- function(x, ...) {
      inv <- x$getinverse()
      if (!is.null(inv)) {
      message ("getting cached data")
      return (inv)
}
data <- x$get()
  inv <- solve(data,...)
  x$setinverse(inv)
        inv
}
