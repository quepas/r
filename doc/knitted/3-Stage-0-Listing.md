Stage 0 - Listing
=================

In this stage, we want to list basic information, e.g., about all [data sets, tasks, flows, runs](http://openml.org/guide#g_start), run results, available evaluation measures or task types. For each of these purposes we have a function beginning with "listOML", where all of them return a data.frame, even when the result has only one column. 

### Get a valid session hash
To download a task and for most other functions, you will need a so-called session hash. If you created a configuration file containing username and password of your OpenML account, this is very simple:



```r
session.hash = authenticateUser()
```

Else, you have to pass your username und password here. **Your password will appear in plain text in your script/console!**


```r
session.hash = authenticateUser(username = "openml.rteam@gmail.com", password = "testpassword")
```

### Listing
Let's have a look at some examples. Most of the listing-functions do not have any parameters that change the output:


```r
flows = listOMLFlows()
head(flows)

measures = listOMLEvaluationMeasures()
head(measures)

tasktypes = listOMLTaskTypes()
tasktypes
```

To browse the OpenML data base for appropriate data sets, you can use `listOMLDataSets()` 
in order to get basic data characteristics (number of features/instances/classes/missing values etc.)
for each data set. By default, `listOMLDataSets()` returns only data sets that have an active 
status on OpenML. If you need data sets that are either `"in_preparation"` or `"deactivated"`,
you can change the `status` parameter:


```r
datasets = listOMLDataSets()  # returns active data sets
head(datasets)

inactive.data = listOMLDataSets(status = "deactivated")  # returns deactivated data sets
head(inactive.data)
```

Other listing-functions list only those entities that match one or more criteria.
For some data sets, there may be one or more tasks available at the OpenML server. 
For example, you can look for `Supervised Classification` task IDs that are available for a specific data set as follows:


```r
type.id = with(tasktypes, id[name == "Supervised Classification"]) # lookup id for "Supervised Classification" tasks
tasks = listOMLTasks(type = type.id)  # list all "Supervised Classification" tasks 
head(subset(tasks, did == 1L))  # lists tasks for the data set with did == 1 (see: http://openml.org/d/1)
```

Similarly, you can also list runs and run results for a specific task, setup or implementation:


```r
runs = listOMLRuns(task.id = 1L)  # must be restricted to a task, setup and/or implementation ID
head(runs)

runresults = listOMLRunResults(task.id = 1L)  # a task ID must be supplied
colnames(runresults)
```


----------------------------------------------------------------------------------------------------
Jump to:   
[Introduction](1-Introduction.md)  
[Configuration](2-Configuration.md)  
Stage 0 - Listing  
[Stage 1 - Downloading](4-Stage-1-Downloading.md)  
[Stage 2 - Running models on tasks](5-Stage-2-Running.md)  
[Stage 3 - Uploading](6-Stage-3-Uploading.md)  
[8 Example workflow with mlr](8-Example-workflow-with-mlr.md)
