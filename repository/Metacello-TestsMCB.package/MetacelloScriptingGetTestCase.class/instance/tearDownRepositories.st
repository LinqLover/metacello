running
tearDownRepositories
  super tearDownRepositories.
  MCRepositoryGroup default
    removeIdenticalRepository:
      (Smalltalk globals at: #'Metacello_XXX_Test_Repository' ifAbsent: [  ]).
  Smalltalk globals removeKey: #'Metacello_Config_Test_Repository' ifAbsent: [  ].
  Smalltalk globals removeKey: #'Metacello_XXX_Test_Repository' ifAbsent: [  ]