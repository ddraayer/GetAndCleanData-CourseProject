## Getting and Cleaning Data: Course Project

```
Coursera: Getting and Cleaning Data
URL: <https://class.coursera.org/exdata-032/>
Course Project
Dean Draayer
```

### Structure of the Dataset
* The data file `tidy_data.txt` is a space-separated UTF-8 encoded text file with Unix-style (LF) line endings. The first line is a header row. Each of the remaining lines represents one observation. [It can be read in to R via `read.table('tidy_data.txt', header=TRUE)`.]
* The dataset has 81 variables (columns) and 180 observations (rows).
* Each of the 180 observations is identified by a `SubjectId` (integer) and `Activity` (factor) pair.
    * There are 30 subjects, identified by integers `1,2,...,30`.
    * There are 6 activities: `WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`.
* The remaining 79 columns (dbl) each hold the means of all the measurements taken for that subject and activity for the quantity represented by that column. The values are normalized to lie between -1 and 1.
* See `README.txt` from the UCI HAR dataset for more background information.

### Variable Names
Variable naming parallels that used in the UCI HAR dataset.

* A substring of `.mean`, `.std`, or `.meanFreq` indicates the type of aggregate variable from the UCI HAR study.
* A prefix of `t` indicates a time variable, wherase an `f` prefix indicates a frequency variable.
* A suffix of `.X`, `.Y`, or `.Z` indicates the coordinate represented in a measurement of a 3-dimensional quantity.
* The remaining part of the variable name identifies the physical quantity that is represented. See the `features_info.txt` file from the UCI HAR dataset for details.

#### Column Names and Indices

```
 1 SubjectId (int)
 2 Activity (factor)
 3 tBodyAcc.mean.X (dbl)
 4 tBodyAcc.mean.Y (dbl)
 5 tBodyAcc.mean.Z (dbl)
 6 tBodyAcc.std.X (dbl)
 7 tBodyAcc.std.Y (dbl)
 8 tBodyAcc.std.Z (dbl)
 9 tGravityAcc.mean.X (dbl)
10 tGravityAcc.mean.Y (dbl)
11 tGravityAcc.mean.Z (dbl)
12 tGravityAcc.std.X (dbl)
13 tGravityAcc.std.Y (dbl)
14 tGravityAcc.std.Z (dbl)
15 tBodyAccJerk.mean.X (dbl)
16 tBodyAccJerk.mean.Y (dbl)
17 tBodyAccJerk.mean.Z (dbl)
18 tBodyAccJerk.std.X (dbl)
19 tBodyAccJerk.std.Y (dbl)
20 tBodyAccJerk.std.Z (dbl)
21 tBodyGyro.mean.X (dbl)
22 tBodyGyro.mean.Y (dbl)
23 tBodyGyro.mean.Z (dbl)
24 tBodyGyro.std.X (dbl)
25 tBodyGyro.std.Y (dbl)
26 tBodyGyro.std.Z (dbl)
27 tBodyGyroJerk.mean.X (dbl)
28 tBodyGyroJerk.mean.Y (dbl)
29 tBodyGyroJerk.mean.Z (dbl)
30 tBodyGyroJerk.std.X (dbl)
31 tBodyGyroJerk.std.Y (dbl)
32 tBodyGyroJerk.std.Z (dbl)
33 tBodyAccMag.mean (dbl)
34 tBodyAccMag.std (dbl)
35 tGravityAccMag.mean (dbl)
36 tGravityAccMag.std (dbl)
37 tBodyAccJerkMag.mean (dbl)
38 tBodyAccJerkMag.std (dbl)
39 tBodyGyroMag.mean (dbl)
40 tBodyGyroMag.std (dbl)
41 tBodyGyroJerkMag.mean (dbl)
42 tBodyGyroJerkMag.std (dbl)
43 fBodyAcc.mean.X (dbl)
44 fBodyAcc.mean.Y (dbl)
45 fBodyAcc.mean.Z (dbl)
46 fBodyAcc.std.X (dbl)
47 fBodyAcc.std.Y (dbl)
48 fBodyAcc.std.Z (dbl)
49 fBodyAccJerk.mean.X (dbl)
50 fBodyAccJerk.mean.Y (dbl)
51 fBodyAccJerk.mean.Z (dbl)
52 fBodyAccJerk.std.X (dbl)
53 fBodyAccJerk.std.Y (dbl)
54 fBodyAccJerk.std.Z (dbl)
55 fBodyGyro.mean.X (dbl)
56 fBodyGyro.mean.Y (dbl)
57 fBodyGyro.mean.Z (dbl)
58 fBodyGyro.std.X (dbl)
59 fBodyGyro.std.Y (dbl)
60 fBodyGyro.std.Z (dbl)
61 fBodyAccMag.mean (dbl)
62 fBodyAccMag.std (dbl)
63 fBodyBodyAccJerkMag.mean (dbl)
64 fBodyBodyAccJerkMag.std (dbl)
65 fBodyBodyGyroMag.mean (dbl)
66 fBodyBodyGyroMag.std (dbl)
67 fBodyBodyGyroJerkMag.mean (dbl)
68 fBodyBodyGyroJerkMag.std (dbl)
69 fBodyAcc.meanFreq.X (dbl)
70 fBodyAcc.meanFreq.Y (dbl)
71 fBodyAcc.meanFreq.Z (dbl)
72 fBodyAccJerk.meanFreq.X (dbl)
73 fBodyAccJerk.meanFreq.Y (dbl)
74 fBodyAccJerk.meanFreq.Z (dbl)
75 fBodyGyro.meanFreq.X (dbl)
76 fBodyGyro.meanFreq.Y (dbl)
77 fBodyGyro.meanFreq.Z (dbl)
78 fBodyAccMag.meanFreq (dbl)
79 fBodyBodyAccJerkMag.meanFreq (dbl)
80 fBodyBodyGyroMag.meanFreq (dbl)
81 fBodyBodyGyroJerkMag.meanFreq (dbl)
```
