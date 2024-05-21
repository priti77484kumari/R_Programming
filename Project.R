project<-read.csv(file.choose())
View(project)

library(dplyr)
library(ggplot2)
library(flexdashboard)
library(xlsx)
library(scales)
library(plotly)

sapply(project,class)

#first and last elements
head(project)
tail(project)
#checking no of rows and col
nrow(project)
ncol(project)
##
summary(project)

##
library(dplyr)
project %>% filter(Franchise =="DC")->DC
View(DC)
project %>% filter(Franchise =="Marvel")->Marvel
View(Marvel)


### 
ggplot(data=Marvel,aes(x=Minutes))+ geom_histogram(fill="red",col="Yellow",binwidth =10)

ggplot(data=Marvel,aes(x=,Male.Female.led,fill=Male.Female.led))+geom_bar()

ggplot(data=Marvel,aes(x=Minutes))+ geom_histogram(fill="Green",col="Yellow",binwidth =10)

ggplot(data=Marvel,aes(x=,Male.Female.led,fill=Male.Female.led))+geom_bar()

ggplot(data=project,aes(x=Minutes))+ geom_histogram(fill="blue",col="Yellow",binwidth =10)

ggplot(data=project,aes(x=,Male.Female.led,fill=Male.Female.led))+geom_bar()+geom_text(stat = "count", aes(label = ..count..), vjust = -0.5) +
  labs(x = "Lead Gender", y = "Count", title = "Number of Films by Lead Gender") 

top5_ratings<-head(project[order(project$Rotten.Tomatoes.Critic.Score, decreasing = TRUE), ], 5)
View(top5_ratings)
ggplot(data=top5_ratings, aes(x=reorder(Film, Rotten.Tomatoes.Critic.Score), y=Rotten.Tomatoes.Critic.Score,fill=Film)) +
  geom_bar(stat="identity") +
  labs(x="Film", y="Rating", title="Top 5 Films by Rating", fill="Film") 
  


top5_gross <-head(project[order(project$Box.office.gross.Worldwide,decreasing = TRUE),],5) 
ggplot(data=top5_gross, aes(x=Film, y=Box.office.gross.Worldwide, fill=Franchise)) +
  geom_bar(stat="identity") +
  labs(x="Film", y="Worldwide Box Office Gross", title="Top 10 Films by Worldwide Box Office Gross", fill="Franchise") 
 
