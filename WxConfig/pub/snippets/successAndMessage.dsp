%ifvar message%
	<tr>
		<td colspan="4">&nbsp;</td>
	</tr>
	<TR>
		%ifvar success equals('true')%
			<TD class="success" colspan="4">
		%else%
			<TD class="error" colspan="4">
		%endifvar%
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<pre>%value message%</pre>
		</TD>
	</TR>
%endifvar%


<!-- myversions plugin : Show set of messages -->
%ifvar messages%
	
		<tr>
			%ifvar success equals('true')%
				<td class="success">
			%else%
				<td class="error">
			%endifvar%<pre>%loop messages%%value messages%<br>%endloop%</pre></td>
				
		</tr>
%endifvar%