tests - valid
testGithubRefIV
  | repo |
  repo := MetacelloScriptingResource current externalRepository.
  Gofer new
    repository: repo;
    package: 'BaselineOfGithubRefIV';
    load.
  self validateBaseline: (Smalltalk at: #'BaselineOfGithubRefIV')