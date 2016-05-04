## Two functions are written to cache the inverse of a matrix

## create a special matrix that contains a list of functions to 
## set the matrix, get the value, set the inverse, get the inverse 

makeCacheMatrix<- function(x=matrix()){
	m<-NULL
	set<- function(y){
		## use << to assign a value to an object in an environment that is different from the current environment
		x<<y 
		m<-NULL
	}
	get<- function() x
	setinverse<- function(inverse) m<<-inverse
	getinverse<- function() m
	## return a list of functions that will be used as the input to cacheSolve() function 
	list(set=set,get=get,setinverse=setinvers,getinverse=getinverse)
}


## computes the inverse of the special "matrix" returned by makeCacheMatrix above.

cacheSolve<- function(x,...){
	m<- x$getinverse()
	## check if the inverse has already been calculated
	if(!is.na(m)){
	        ## get the inversed matrix from cache
		message("Getting cached data")
		return(m)
	}
	## if not, calculate the inverse of matrix
	data<-x$get()
	m<- solve(data,....)
	## set the inverser of matrix in the cache
	x$setinverse(m)
	m
}
