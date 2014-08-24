# We need this packetes to call methods later

library(reshape2)

# It will throw us the next message, but its ok to work with it
Warning message:
package ‘reshape2’ was built under R version 3.1.1 

# Load the datasets required. Used read.table to read them and make them a table

test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test.x <- read.table("./UCI HAR Dataset/test/X_test.txt")
test.y <- read.table("./UCI HAR Dataset/test/y_test.txt")
train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train.x <- read.table("./UCI HAR Dataset/train/X_train.txt")
train.y <- read.table("./UCI HAR Dataset/train/y_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Combine the test and train subject datasets

subject <- rbind(test.subject, train.subject)
colnames(subject) <- "subject"

# Combine the test and train labels
label <- rbind(test.y, train.y)
label <- merge(label, activity.labels, by=1)[,2]

# Combine the test and train main dataset

data <- rbind(test.x, train.x)
colnames(data) <- features[, 2]

# Merge all datasets (3 before)

data <- cbind(subject, label, data)

# Create a smaller dataset containing only the mean and std variables

search <- grep("-mean|-std", colnames(data))
data.mean.std <- data[,c(1,2,search)]

# Calculate the means, grouped by subject/label

melted = melt(data.mean.std, id.var = c("subject", "label"))
means = dcast(melted , subject + label ~ variable, mean)

# Save the resulting dataset

write.table(means, file="TidyData.txt", row.names=FALSE)
