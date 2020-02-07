%ifvar action equals('delete')%
	%invoke wx.config.impl.ui:deleteCfgFile%
	%ifvar errorMessage%
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
		<TR>
			<TD class="error" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value errorMessage%</TD>
		</TR>
	%endif%
	%endinvoke wx.config.impl.ui:deleteCfgFile%
%endif%