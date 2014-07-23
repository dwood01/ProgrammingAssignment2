## These functions are submitted as part of Assignment 2
## of the R Programming Course on Coursera.

## The following two functions are supposed to help 
## the user cache potentially time-consuming 
## computations involving taking the inverse
## of a matrix.  
## PLEAE NOTE: these functions assume 
## that the matrix supplied is always invertible.

## !!!  DISCLAIMER  !!!!
## This is basically a re-write of the sample 
## code given and it's accompanying description.
## What I have added is minimal, so please don't 
## accuse me of plagiarism - I'm telling you I didn't 
## do much, it's all from the course materials.

makeCacheMatrix <- function(x = matrix()) {

	## This function creates a special "matrix" object 
	## that can cache the inverse of a matrix.  The 
	## object is actually a list containing 
	## a function to:	##	1. set the value of the matrix	##	2. get the value of the matrix	##	3. set the value of the inverse matrix	##	4. get the value of the inverse matrix

        s <- NULL
	set <- function(y) {                x <<- y                s <<- NULL        }
	get <- function() x        setsolve <- function(solve) s <<- solve        getsolve <- function() s        list(set = set, get = get,             setsolve = setsolve,             getsolve = getsolve)
}

cacheSolve <- function(x, ...) {

	## This function returns a matrix that is 
	## the inverse of 'x' argument, just as "solve(x)" 
	## would.  However, it first checks to see if the inverse has 
	## already been calculated. If so, it gets the inverse 
	## from the cache and skips the computation. 

	## It does this by computing the inverse of the 
	## special "matrix" returned by makeCacheMatrix above. 
	## Otherwise, it calculates the inverse of the matrix 
	## and sets the value of the inverse in the cache via 
	## the setsolve function.

 	s <- x$getsolve()        if(!is.null(s)) {                message("getting cached data")                return(s)        }        data <- x$get()        s <- solve(data, ...)        x$setsolve(s)        s
}