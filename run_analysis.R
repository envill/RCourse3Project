> library(reshape2)
Warning message:
package ‘reshape2’ was built under R version 3.1.1 
> test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
> test.x <- read.table("./UCI HAR Dataset/test/X_test.txt")
> test.y <- read.table("./UCI HAR Dataset/test/y_test.txt")
> train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
> train.x <- read.table("./UCI HAR Dataset/train/X_train.txt")
> train.y <- read.table("./UCI HAR Dataset/train/y_train.txt")
> features <- read.table("./UCI HAR Dataset/features.txt")
> activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
> subject <- rbind(test.subject, train.subject)
> colnames(subject) <- "subject"
> label <- rbind(test.y, train.y)
> label <- merge(label, activity.labels, by=1)[,2]
> data <- rbind(test.x, train.x)
> colnames(data) <- features[, 2]
> data <- cbind(subject, label, data)
> search <- grep("-mean|-std", colnames(data))
> data.mean.std <- data[,c(1,2,search)]
> melted = melt(data.mean.std, id.var = c("subject", "label"))
> means = dcast(melted , subject + label ~ variable, mean)
> write.table(means, file="TidyData.txt", row.names=FALSE)
