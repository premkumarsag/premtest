%ifvar isActive%
	%ifvar isActive equals('true')%
		<img src="images/blank.gif" border="0" height=9 width=9>
	%else%
		<IMG SRC="/WmRoot/icons/red-ball.gif" border="0" height=9 width=9 alt="File inactive" title="File inactive">
	%endifvar%
%endifvar%
%ifvar path%
	%ifvar isMissing%
		%ifvar isMissing equals('true')%
			<IMG SRC="images/dependency.gif" border="0" height=14 width=14 alt="File missing" title="File missing">
		%else%
			<span style="font-size: 100%;font-weight: normal;">
			[<a href="viewFile.dsp?fileNameWithPath=%value canonicalPath encode(url)%&package=
				%include snippets/configFileOptionalParams.dsp%
			">view</a> | 
			<a href="editFile.dsp?fileNameWithPath=%value canonicalPath encode(url)%&package=
				%include snippets/configFileOptionalParams.dsp%
			">edit</a>]
			</span>
		%endifvar%
	%endifvar%
	
	%ifvar location/type equals('ALIAS')%
		%value fileName% <span style="font-size: 100%;font-weight: normal;">(%value location/value%)</span>
	%else%
		%value path%
	%endifvar%
%endifvar%