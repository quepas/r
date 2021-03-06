##### creating stuff on init
createDir = function(dir, verbosity = NULL) {
  if (!file.exists(dir)) {
    if (dir.create(dir, recursive = TRUE))
      showInfo(verbosity, "Created dir: %s", dir)
    else
      stopf("Error creating dir: %s", dir)
  }
}

createCacheSubDirs = function(verbosity = NULL) {
  conf = getOMLConfig()
  cd = conf$cachedir
  createDir(file.path(cd, "datasets"), verbosity)
  createDir(file.path(cd, "tasks"), verbosity)
  createDir(file.path(cd, "runs"), verbosity)
  createDir(file.path(cd, "flows"), verbosity)
}

getCacheURI = function(subdir, id, elements) {
  path = file.path(getOMLConfig()$cachedir, subdir, id)
  if (!isDirectory(path) && !dir.create(path, recursive = TRUE))
    stopf("Unable to create directory '%s'", path)
  path = file.path(path, elements)
  found = file.exists(path)
  setNames(Map(list, path = path, found = found), elements)
}

findCachedDataset = function(id) {
  getCacheURI("datasets", id,
    elements = c("dataset.arff", "description.xml"))
}

findCachedTask = function(id) {
  getCacheURI("tasks", id,
    elements = c("datasplits.arff", "task.xml"))
}

findCachedRun = function(id) {
  getCacheURI("runs", id,
    elements = "predictions.arff")
}

findCachedFlow = function(id, elements) {
  getCacheURI("flows", id, elements)
}

clearOMLCache = function() {
  conf = getOMLConfig()
  cd = conf$cachedir
  unlink(cd, recursive = TRUE)
  createDir(cd)
  createCacheSubDirs()
}
