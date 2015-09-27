## Getting and Cleaning Data: Course Project

```
Coursera: Getting and Cleaning Data
URL: <https://class.coursera.org/exdata-032/>
Course Project
Dean Draayer
```

* Original study and source of data: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
* `README.md`: This file
* `CodeBook.md`:
* `tidy_data.txt`: The tidy dataset, which can be read into R via `read.table('tidy_data.txt', header=TRUE)`


### Data Cleaning

The following procedure was used to assemble and clean the original data into a cleaner, more appropriate form for the purposes of this project.

* Assemble the test dataset:
    * Read in the feature code table from `test/features.txt`. This is used for supplying column names to the measurements data.
    * Read in the measurements data from `test/X_test.txt`. Treat all columns as numeric, and use the feature names from the feature code table as column names. Note that this results in some name mangling (parentheses get replaced with periods); the column names will get cleaned up later once the combined test and train dataset has been assembled.
    * Drop columns that do not represent means and standard deviations (keep only those whose names contain `.mean.`, `.std.`, or `.meanFreq.`).
    * Combine the subject IDs and activity codes from `test/subject_test.txt` and `test/y_test.txt`, line by line, with the measurements data (using `bind_cols`).

* Assemble the train dataset:
    * Repeat the same procedure used for assembling the test dataset, but use the files in the `train` directory instead of the `test` directory.

* Assemble the combined dataset:
    * Combine the test and train datasets into a single dataset (using `bind_rows`).
    * Clean up the column names (delete the `..` substrings introduced by name mangling).

### Construction of the tidy dataset

* This is formed from the combined dataset by grouping by subject ID and activity and computing the mean for each measurement variable for each resulting group.
* The tidy dataset was then written out to `tidy_data.txt`. It can be read back in via `read.table('tidy_data.txt', header=TRUE)`.
