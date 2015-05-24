## Put comments here that give an overall description of what your
## functions do
################################################################################
################################################################################
##
##  makeCacheMatrix() creates an advanced matrix structure that has the capacity
##      to store both a matrix and the inverse of that matrix.
##
##  cacheSolve() takes in a makeCacheMatrix object and returns the inverse of
##      the matrix variable of the makeCacheMatrix object provided.
##
################################################################################
################################################################################




## Write a short comment describing this function
################################################################################
#  makeCacheMatrix() creates an advanced matrix structure that has the capacity
#      to store two local variables in its environment:
#      - 'matrix'   : a 2 dimentional array, containing numeric values.
#      - 'inverse'  : the inversion of the matrix/2d array.
#
#  * We assume that the matrix supplied to makeCacheMatrix is contains    *
#  *  numeric values only.                                                *
#  * We assume that the matrix supplied to makeCacheMatrix is invertiable.*
#  * Hence, the absense of error checking for non-zero determinant.       * 
################################################################################

# The function parameter has been renamed from 'x' to 'matrix' for clarity.
makeCacheMatrix <- function(matrix = matrix()) {
  
        # 'matrix' is local to the environment of a makeCacheMatrix object.
  
        # 'inverse' is local to the environment of a makeCacheMatrix object.
        # It stores the value of the given matrix's inverse, initiall unknown.
        inverse <- NULL
      
        # Assigns the given parameter 'newMatrix' to the local variable,
        # 'matrix', inside a makeCacheMatrix object.
        set <- function(newMatrix) {
                matrix  <<- newMatrix
                # When the 'matrix' variable is (re)set, the 'inverse' variable
                # becomes unknown, i.e. set to NULL.
                inverse <<- NULL
        }
        
        # Returns the 'matrix' variable of a makeCacheMatrix object.
        get <- function() {
                matrix
        }
        
        # Assigns the given parameter 'calculatedInverse' to the local variable,
        # 'inverse', inside a makeCacheMatrix object.
        setInverse <- function(calculatedInverse) {
                inverse <<- calculatedInverse
                inverse <<- solve(matrix)
        }

        # Returns the 'inverse' variable of a makeCacheMatrix object.
        getInverse <- function() {
                inverse
        }

        # When makeCacheMatrix() is called it returns the following list of
        # functions, which are defined above.
        # The list contains a mapping between the name by which the function is
        # called/envoked, and the name by which the function is defined.
        #       I.e.,   'calling name' = 'defining name'
        #       E.g.,    setInverse    =  setInverse
        list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}




## Write a short comment describing this function
################################################################################
#  cacheSolve() takes in a makeCacheMatrix object and returns the inverse of the
#      matrix provided. There are two possible routes taken:
#      - 'cached'     : the makeCacheMatrix object has the value of inverse
#                       already stored.
#      - 'calculated' : the makeCacheMatrix object has the value NULL for the
#                       inverse. The solve() function is finds the inverse of
#                       matrix. This inverse is assigned to makeCacheMatrix
#                       object, and the inverse is returned.
################################################################################

# The function parameter has been renamed from 'x' to 'makeCacheMatrix' for clarity.
cacheSolve <- function(makeCacheMatrix, ...) {
  
        # 'makeCacheMatrix' is local to the environment of a cacheSolve object.
        
        # 'makeCacheMatrix' contains a 'matrix' variable.
        # The current value of the inverse of 'matrix' is stored.
        inverse <- makeCacheMatrix$getInverse()
        
        # Cached route - If the 'inverse' value is not NULL
        if(!is.null(inverse)) {
                message("getting cached data")
                # The value 'inverse' is returned from the function early.
                # Function call ends here.
                return(inverse)
        }
        
        # Calculated route - If the 'inverse' value is NULL
        matrix <- makeCacheMatrix$get()
        inverse <- solve(data, ...)
        makeCacheMatrix$setInverse(inverse)

        ## Returns a matrix that is the (Calculated) inverse of 'matrix'
        inverse
}
