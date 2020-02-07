%ifvar inclusionDirectives/inclusionDirectiveDetails%
	%loop inclusionDirectives/inclusionDirectiveDetails%
		%switch type%
			%case 'OS'%
				%switch parameterList%
					%case 'windows'%
						<img src="images/Windows-icon.png" alt="Windows" title="Windows" border="0" />
					%case 'linux'%
						<img src="images/Linux-icon.png" alt="Linux" title="Linux" border="0" />
					%case 'unix'%
						<img src="images/Unix-icon.png" alt="Unix/Linux" title="Unix/Linux" border="0" height=16 width=16/>
				%end%
			%case 'wmVersion'%
				%value parameterList%
			%case 'dateTime'%
				<img src="images/calendar.gif" alt="Date/Time Values" title="Date/Time" border="0" />
		%end%
	%endloop%
%endifvar%