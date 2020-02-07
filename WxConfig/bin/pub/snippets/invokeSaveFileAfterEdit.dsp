%ifvar action equals('change')%
	<!-- myversions plugin : Start -->
	%ifvar myVersionsActivated equals('true')%
		%invoke wx.config.plugins.myversion.impl.ui:saveFileEdit%
			%include snippets/successAndMessage.dsp%
			%onerror%
				%include snippets/error.dsp%
		%endinvoke wx.config.plugins.myversion.impl.ui:saveFileEdit%
	%else%
		%invoke wx.config.impl.util.file:saveFile%
			%include snippets/successAndMessage.dsp%
			%onerror%
				%include /snippets/error.dsp%
		%endinvoke wx.config.impl.util.file:saveFile%
	%endifvar% 
	<!-- myversions plugin : End -->
	
	%invoke wx.config.impl.ui:reloadPackageCfg%
		%ifvar message%
			<tr>
				<td colspan="4">&nbsp;</td>
			</tr>
			<TR>
				<TD class="info" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<pre>%value message%</pre></TD>
			</TR>
		%endif%
	%endinvoke wx.config.impl.ui:reloadPackageCfg%
%endif%
