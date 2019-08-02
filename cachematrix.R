## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Functions to set matrix, get matrix, set_inverse_matrix, get_inverse_matrix
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  set_inverse_matrix <- function(solve) m <<- solve
  get_inverse_matrix <- function() m
  list(set = set, get = get,
       set_inverse_matrix = set_inverse_matrix,
       get_inverse_matrix = get_inverse_matrix)
}

## Write a short comment describing this function
## Function that will pull cached inverse matrix from makeCacheMatrix and if it is not cached, set inverse matrix to cache
cacheSolve <- function(x) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$get_inverse_matrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()
  m <- solve(data)
  x$set_inverse_matrix(m)
  m
}
