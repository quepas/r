Stage 1 - Downloading
=====================

### Download an OpenML task
Each OpenML task is a bundle of a data set, a target feature, an estimation procedure (e.g.,
10-fold CV), data splits fitting this estimation procedure and, finally, one or more evaluation measures. Every task has a type, e.g., Supervised Classification or Supervised Regression. A user can download such a task from the OpenML server, compute predictions with an algorithm (called "flow" or "implementation") and upload this algorithm as well as the predictions. The server will then calculate many different measures and add them to the data base.

To download a certain task from the OpenML server, you need to know the task's ID. See
[section 3](3-Stage-0-Listing.md) to learn how to retrieve a list of all available tasks in R.

The following call returns an OpenML task object: 


```r
task = getOMLTask(task.id = 1L)
task
```

```
## 
## OpenML Task 1 :: (Data ID = 1)
##   Task Type            : Supervised Classification
##   Data Set             : anneal :: (Version = 2, OpenML ID = 1)
##   Target Feature(s)    : class
##   Estimation Procedure : Stratified crossvalidation (1 x 10 folds)
```

The corresponding `OMLDataSet` can be accessed by


```r
task$input$data.set
```

```
## 
## Data Set "anneal" :: (Version = 2, OpenML ID = 1)
##   Default Target Attribute: class
```

### Download an OpenML data set only
OpenML tasks have predefined estimation procedures and measures. Sometimes you might want to deviate
from these fixings. Of course, it is possible to define new tasks that match your desires, but this
will not always be the means of choice -- e.g., when you want to run a few preliminary experiments.
For this matter, you can use the function `getOMLDataSet`, which accepts not only tasks (as seen in the section above) but also a data set ID as input and returns the corresponding `OMLDataSet`:


```r
anneal.data = getOMLDataSet(x = 1L)  # the anneal data set has the data set ID (did = 1, see also previous section)
anneal.data
```

```
## 
## Data Set "anneal" :: (Version = 2, OpenML ID = 1)
##   Default Target Attribute: class
```

```r
anneal.data = getOMLDataSet(x = task)  # the task defined above (with task.id = 1) uses the anneal data
anneal.data
```

```
## 
## Data Set "anneal" :: (Version = 2, OpenML ID = 1)
##   Default Target Attribute: class
```

### Download an OpenML run
To download the results of one run including all server and user computed metrics, you have to know the corresponding run ID. You can download a single OpenML run with the `getOMLRun` function:


```r
run = getOMLRun(run.id = 1L)  # see ?OMLRun for each slot of the OMLRun object
```

Some important slots for the `OMLRun` object are:


```r
run$parameter.setting  # A list containing information on the parameter settings.

run$input.data  # All data that served as input for the run, including the URL to the data.

run$output.data$evaluations
```

To retrieve predictions of an uploaded run, you can set the parameter `get.predictions = TRUE` to store the
predictions in the `$predictions` slot or use the function `getOMLPredictions(run)`:


```r
run.pred = getOMLRun(run.id = 1L, get.predictions = TRUE)
all.equal(run.pred$predictions, getOMLPredictions(run))
```

```
## [1] TRUE
```

### Download an OpenML flow

Flows are implementations of single algorithms, workflows, or scripts. You can download a flow by specifying the `implementation.id` parameter in the `getOMLFlow` function:


```r
flow = getOMLFlow(implementation.id = 1248L)
flow
```

```
## 
## Flow "classif.randomForest" :: (Version = 1, Implementation ID = 1248)
## 	External Version         : 4.6-10
## 	Dependencies             : mlr_2.3, randomForest_4.6.10
## 	Number of Flow Parameters: 12
## 	Number of Flow Components: 0
```

----------------------------------------------------------------------------------------------------
Jump to:   
[Introduction](1-Introduction.md)  
[Configuration](2-Configuration.md)  
[Stage 0 - Listing](3-Stage-0-Listing.md)  
Stage 1 - Downloading  
[Stage 2 - Running models on tasks](5-Stage-2-Running.md)  
[Stage 3 - Uploading](6-Stage-3-Uploading.md)  
[8 Example workflow with mlr](8-Example-workflow-with-mlr.md)
