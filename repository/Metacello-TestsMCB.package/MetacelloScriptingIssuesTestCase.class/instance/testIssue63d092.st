tests
testIssue63d092
  "https://github.com/dalehenrich/metacello-work/issues/63"

  Metacello new
    configuration: 'Issue63';
    version: '0.9.2';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    silently;
    load: 'Core'.
  self
    verify: 'External-Core'
    loadedFrom:
      'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
        , '/repository'.
  self
    verifyPackageNotLoaded: 'External-Tests';
    verifyPackageNotLoaded: 'GoferFoo';
    verifyPackageNotLoaded: 'GoferBar'.
  self
    validate: 'ConfigurationOfIssue63'
    expConfigVersion: '0.9.2'
    expConfigRepo: 'dictionary://Metacello_Configuration_Test_Repository'
    expBaselineClassName: 'BaselineOfExternal'
    expBaselineVersion: 'baseline'
    expBaselineRepo:
      'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA
        , '/repository'