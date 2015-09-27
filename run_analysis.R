#################################################################################
# Coursera: Getting and Cleaning Data
# URL: https://class.coursera.org/exdata-032/
# Course Project
# Dean Draayer
#################################################################################
setwd('UCI HAR Dataset')
library(dplyr)

# Features coding
feature.codes <-
    tbl_df(read.delim('features.txt',
                      header=FALSE, sep=' ', as.is=TRUE,
                      col.names=c('FeatureId', 'Feature')))


# Activities coding
activity.codes <-
    tbl_df(read.delim('activity_labels.txt',
                      header=FALSE, sep=' ',
                      col.names=c('ActivityId', 'Activity')))


### Test dataset ###
test.subjects <-
    tbl_df(read.delim('test/subject_test.txt',
                      header=FALSE, col.names='SubjectId'))

test.activities <-
    tbl_df(read.delim('test/y_test.txt',
                      header=FALSE, col.names='ActivityId')) %>%
    inner_join(activity.codes) %>%
    select(Activity)

test.data <-
    tbl_df(read.table('test/X_test.txt',
                      colClasses='numeric',
                      col.names=feature.codes$Feature))
# Pare down to columns hoving means & standard devs
test.data <- select(test.data, matches('\\.(mean|std|meanFreq)\\.'))

# Combine into our final test dataset
test.data <- bind_cols(test.subjects, test.activities, test.data)
rm(test.subjects, test.activities)


### Train dataset ###
train.subjects <-
    tbl_df(read.delim('train/subject_train.txt',
                      header=FALSE, col.names='SubjectId'))

train.activities <-
    tbl_df(read.delim('train/y_train.txt',
                      header=FALSE, col.names='ActivityId')) %>%
    inner_join(activity.codes) %>%
    select(Activity)

train.data <-
    tbl_df(read.table('train/X_train.txt',
                      colClasses='numeric',
                      col.names=feature.codes$Feature))
# Pare down to columns hoving means & standard devs
train.data <- select(train.data, matches('\\.(mean|std)\\.'))

# Combine into our final train dataset
train.data <- bind_cols(train.subjects, train.activities, train.data)
rm(train.subjects, train.activities)


### Combined test and train dataset ###
combined.data <- bind_rows(train.data, test.data)
rm(train.data, test.data)
# Clean up the column names
names(combined.data) <- gsub('\\.\\.', '', names(combined.data))


### Tidy dataset ###
tidy.data <- combined.data %>%
    group_by(SubjectId, Activity) %>%
    summarize_each(funs(mean))

# Save the tiday datase to a file
setwd('..')
write.table(tidy.data, file='tidy_data.txt', row.names=FALSE, quote=FALSE)
