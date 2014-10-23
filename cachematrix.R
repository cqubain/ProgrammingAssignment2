## These two functions store an object in the form of a matrix and cache the inverse of the matrix. 

## The first function creates a list of functions.  The list defines methods to cache the data within a different scope. 

makeCacheMatrix <- function(x = matrix()) {
		i <- NULL
		set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## The second function calculates the inverse of the matrix created in the first function.  It checks if the inverse has already been solved.  If yes, it uses the cached matrix inverse.  If no, it calculates the matrix inverse.

cacheSolve <- function(x, ...) {
        i <- x$getinverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)
        i
}

        

