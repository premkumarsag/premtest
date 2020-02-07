%invoke wx.config.impl.ui:reloadAllCfgs%
	%ifvar message%
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
		<TR>
			<TD class="info" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<pre>%value message%</pre></TD>
		</TR>
		
	%endif%
%endinvoke wx.config.impl.ui:reloadAllCfgs%
