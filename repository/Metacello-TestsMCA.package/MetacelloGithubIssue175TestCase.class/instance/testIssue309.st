sunit
testIssue309
  "
  Same as Issue 175, but use cacheDirectoryPath and cacheDirectoryPath: instead.

  1. specify a different github cache directory
  2. create repository referencing github://dalehenrich/external:master/repository
  3. verify that BaselineOfExternal is in repo
  4. delete the github cache directory to simulate image move
  5. verify that BaselineOfExternal can be seen
"

  | oldCacheDirPath fileUtils workingDir newCacheDir |
  oldCacheDirPath := MCGitHubRepository cacheDirectoryPath.
  fileUtils := MCFileTreeFileUtils current.
  workingDir := fileUtils default.
  newCacheDir := fileUtils directoryFromPath: 'tempCache' relativeTo: workingDir.
  [ 
  | externalRepo |
  fileUtils ensureDirectoryExists: newCacheDir.
  MCGitHubRepository
    cacheDirectoryPath: (fileUtils directoryPathString: newCacheDir).
  externalRepo := MCGitHubRepository
    location: 'github://dalehenrich/external:master/repository'.
  externalRepo allFileNames
    detect: [ :filename | filename beginsWith: 'BaselineOfExternal' ]
    ifNone: [ 
      "fail if BaselineOfExternal not arround"
      self assert: false ].
  fileUtils deleteAll: newCacheDir.
  externalRepo allFileNames
    detect: [ :filename | filename beginsWith: 'BaselineOfExternal' ]
    ifNone: [ 
      "fail if BaselineOfExternal not arround"
      self assert: false ] ]
    ensure: [ 
      MCGitHubRepository cacheDirectoryPath: oldCacheDirPath.
      (fileUtils directoryExists: newCacheDir)
        ifTrue: [ fileUtils deleteAll: newCacheDir ] ]