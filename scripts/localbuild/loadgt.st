SourceFileArray compile: 'deferFlushDuring: aBlock	
	flushChanges ifFalse: [ ^ aBlock value ].
	"flushChanges := false."
	^ [ aBlock value ] ensure: [
		flushChanges := true.
		self flushChangesFile ]'.

EpMonitor disableDuring: [
	Metacello new	
		githubUser: 'pharo-vcs' project: 'Iceberg' commitish: 'dev-1.6' path: '';	
		baseline: 'Iceberg';	
		load.
    Metacello new 
		baseline: 'GToolkitReleaser'; 
		githubUser: 'feenkcom' project: 'gtoolkit-releaser' commitish: 'master' path: ''; 
		load.
    GtRlRepositoriesCloner loadProject: 'GToolkit' fromRepository: 'github://feenkcom/gtoolkit/src'.
].


PharoLightTheme beCurrent.
#GtImageSetup asClass performLocalSetup.
World closeAllWindowsDiscardingChanges.
Smalltalk snapshot: true andQuit: false.
