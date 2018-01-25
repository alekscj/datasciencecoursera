makeCacheMatrix <- function(A = numeric){
    mat <- NULL
    set <- function(y){
        A <<- y
        mat <<- NULL
    }
    get <- function() A
    setinv <- function(solve) mat <<- solve
    getinv <- function() mat
    list(set = set, get = get, 
         setinv = setinv, 
         getinv = getinv) 
}

cacheSolve <- function(A, ...){
    mat <- A$getinv()
    if(!is.null(mat)){
        message("Getting chached matrix")
        return(mat)
    }
    data <- A$get
    mat <- solve(data, ...)
    A$setinv(mat)
    mat
}