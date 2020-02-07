%ifvar stage/type%
	<IMG SRC="
	%switch stage/type%
		%case 'GLOBAL'%
			images/globalValues.gif
		%case 'ENVIRONMENT'%
			images/hosts.gif
		%case 'HOST'%
			images/computer.gif
		%case 'HOST_PORT'%
			images/number.gif
		%case 'INACTIVE'%
			images/blank.gif
	%end%
	" border="0" height=13 width=13 title="%value stage/type%">
%endifvar%