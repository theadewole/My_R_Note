A list in R allows you to gather a variety of objects under one name (that is, the name of the list) in an ordered way. 
These objects can be matrices, vectors, data frames, even other lists, etc. 
It is not even required that these objects are related to each other in any way.
You could say that a list is some kind super data type: you can store practically any piece of information in it!
```my_list <- list(comp1, comp2 ...)```
```
~ Vector with numerics from 1 up to 10
my_vector <- 1:10 
~ Matrix with numerics from 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)
~ First 10 elements of the built-in data frame mtcars
my_df <- mtcars[1:10,]
~ Construct list with these different elements:
my_list <- list(my_vector,my_matrix,my_df)
```
## names ()
If you want to name your lists after you've created them, you can use the names() function as you did with vectors.
```
my_list <- list(your_comp1, your_comp2)
names(my_list) <- c("name1", "name2")
```
```
~ Adapt list() call to give the components names
my_list <- list(my_vector, my_matrix, my_df)
names(my_list)<-c("vec","mat","df")
~ Print out my_list
print(my_list)

~ The variables mov, act and rev are available
mov
act
rev
~ Finish the code to build shining_list
shining_list <- list(moviename = mov,actors=act,reviews=rev)
```
## Selecting elements from a list
One way to select a component is using the numbered position of that component
```shining_list[[1]]``` <br>
You can also refer to the names of the components, with [[ ]] or with the $ sign.
```shining_list[["reviews"]]``` <br>
```shining_list$reviews``` <br>
Besides selecting components, you often need to select specific elements out of these components. 
For example, with ```shining_list[[2]][1]``` you select from the second component, actors ```(shining_list[[2]])```, 
the first element ([1]). 
When you type this in the console, you will see the answer is Jack Nicholson.
```
~ Print out the vector representing the actors
shining_list[["actors"]]
~ Print the second element of the vector representing the actors
shining_list$actors[[2]]
```


```
~ Use the table from the exercise to define the comments and scores vectors
scores <- c(4.6, 5, 4.8, 5, 4.2)
comments <- c("I would watch it again", "Amazing!", "I liked it",
 "One of the best movies", "Fascinating plot")
~ Save the average of the scores vector as avg_review
avg_review<-mean(scores)
~ Combine scores and comments into the reviews_df data frame
reviews_df <- data.frame(scores,comments)
~ Create and print out a list, called departed_list
departed_list <- list(movie_title,movie_actors,
reviews_df,avg_review)
print(departed_list)
```
