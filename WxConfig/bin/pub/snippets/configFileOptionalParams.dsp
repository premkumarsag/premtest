%ifvar cfgId%
	%value cfgId%
%else%
	%value /showPkg%
%endifvar%
%ifvar /calledFromAutoSetup%
	%ifvar /calledFromAutoSetup equals('true')%
		&calledFromAutoSetup=true	
	%endifvar%
%endifvar%
%ifvar /calledFromEncryptedValues%
	%ifvar /calledFromEncryptedValues equals('true')%
		&calledFromEncryptedValues=true	
	%endifvar%
%endifvar%
%ifvar /targetPage%
	&targetPage=%value /targetPage%
%endifvar%
%ifvar linkBack%
	&linkBack=%value linkBack%
%endifvar%
%ifvar showPkg%
	&showPkg=%value showPkg%
%endifvar%
%ifvar fileNameFilter%
	&fileNameFilter=%value fileNameFilter%
%endifvar%
%ifvar stageDetailFilter%
	&stageDetailFilter=%value stageDetailFilter%
%endifvar%
&type=%value type%

