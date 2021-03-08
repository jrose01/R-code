data1<-workshop
names(data1)
data1$workshop.type<-data1$Please.indicate.which.of.the.following.sessions.you.would.be.most.likely.to.join.
remove_if = c("Moodle")

m1<-subset(data1, grepl(paste(remove_if, collapse="|"), 
                    "Please.indicate.which.of.the.following.sessions.you.would.be.most.likely.to.join."))

library(tidyverse)
library(dplyr)
library(stringr)
library(descr)
# create a dataframe witg only the string column of interest
data2a<-subset(data2, select="workshop.type")
# count occurences of a substring for each row & sum the count
data2a$Moodle_workshop <- str_count(data2a$workshop.type, "Moodle")
data2a$Moodle_workshop=sum(data2a$Moodle_workshop)
data2a$Perusall_workshop <- str_count(data2a$workshop.type, "Perusall")
data2a$Perusall_workshop=sum(data2a$Perusall_workshop)
data2a$Zoom_workshop <- str_count(data2a$workshop.type, "Zoom")
data2a$Zoom_workshop=sum(data2a$Zoom_workshop)
data2a$Faculty_led_engage_students_small_online_classes <- str_count(data2a$workshop.type, "ways to engage")
data2a$Faculty_led_engage_students_small_online_classes=sum(data2a$Faculty_led_engage_students_small_online_classes)
data2a$Faculty_led_manage_large_online_lectures <- str_count(data2a$workshop.type, "ways to manage")
data2a$Faculty_led_manage_large_online_lectures=sum(data2a$Faculty_led_manage_large_online_lectures)
data2a$Faculty_led_successful_strategies_hybrid_classes <- str_count(data2a$workshop.type, "successful strategies")
data2a$Faculty_led_successful_strategies_hybrid_classes=sum(data2a$Faculty_led_successful_strategies_hybrid_classes)
data2a$Project_based_and_labs_online_workshop <- str_count(data2a$workshop.type, "project-based")
data2a$Project_based_and_labs_online_workshop=sum(data2a$Project_based_and_labs_online_workshop)
data2a$Teaching_language_classes_workshop <- str_count(data2a$workshop.type, "language classes")
data2a$Teaching_language_classes_workshop=sum(data2a$Teaching_language_classes_workshop)
data2a$Teaching_in_person__with_remote_students_workshop <- str_count(data2a$workshop.type, "remote students")
data2a$Teaching_in_person__with_remote_students_workshop=sum(data2a$Teaching_in_person__with_remote_students_workshop)
data2b<-data2a[-1]

data_long <- gather(data2b, factor_key=TRUE)
data_long
final <- data_long[!duplicated(data_long$key),]

write.csv(final, "/Users/jrose01-21/Documents/January workshop results.csv")
