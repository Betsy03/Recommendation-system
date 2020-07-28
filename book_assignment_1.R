library('recommenderlab')
library(caTools)
library(Matrix)

book<-read.csv("A:/Data Science/assignments/Recommendation system/assignment/book.csv")
View(book)

--EDA-----------------------------------------------------
book<-book[2:4]
hist(book$Book.Rating)
str(book)

-----------------------------------------------------------------------------------------

book_matrix<-as(book,"realRatingMatrix")
inspect(book_matrix[1])
class(book_matrix)

#Popularity based
book_recoomend_popular<-Recommender(book_matrix,method='POPULAR')
reccomed_list<-predict(book_recoomend_popular,book_matrix[25:26],n=3)
as(reccomed_list,'list')

#User based collaborating method
book_recoomend_collab<-Recommender(book_matrix,method='UBCF')
reccomed_list2<-predict(book_recoomend_collab,book_matrix[25:28],n=9) 
as(reccomed_list2,'list')

#User based collaborating method
book_recoomend_IBCF<-Recommender(book_matrix,method='IBCF')
reccomed_list3<-predict(book_recoomend_collab,book_matrix[25:28],n=9) 
as(reccomed_list3,'list')

