<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
	
<link rel="stylesheet" type="text/css" href="/WmRoot/webMethods.css" />
<script src="/WmRoot/webMethods.js.txt"></script>


%invoke wx.config.impl.ui:getConfigValuesForUI%
	%onerror%
		%include snippets/error.dsp%
%endinvoke%

%ifvar ui/isNewFormat equals('true')%
	<link rel="stylesheet" type="text/css" href="webMethods-additions-new.css" />
	<link rel="stylesheet" type="text/css" href="/WmRoot/home.css" />
	<link rel="stylesheet" type="text/css" href="/WmRoot/common.css" />
	
%else%
	<link rel="stylesheet" type="text/css" href="webMethods-additions-old.css" />
	<style>
      body { border-top: 1px solid black; }
</style>

%endifvar%

<link rel="stylesheet" type="text/css" href="webMethods-additions.css" />
<link rel="stylesheet" type="text/css" href="tablesort.css" />
<link rel="stylesheet" type="text/css" href="messages.css" />

<script src="tablesort.js"></script>
<script src="form.js"></script>
