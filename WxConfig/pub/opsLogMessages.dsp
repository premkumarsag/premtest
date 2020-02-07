<HTML>
	<HEAD>
    	<titleLog Messages</title> 
		%include snippets/htmlHeadDefaults.dsp%
		%include snippets/htmlHeadAce.dsp%
	</HEAD>

	<BODY>
	%include snippets/headerUpdates.dsp%
		<TABLE WIDTH="100%">
			<TR>
				<TD class="breadcrumb" colspan="4">
					Logging &gt; Message Catalog
				</TD>
			</TR>
			<TR>
				<TD><IMG SRC="images/blank.gif" height=10 width=10 border=0></TD>
			</tr>
			<TR>
				<TD>Below is an XML representation of all log messages of WxConfig. It is provided 
					for operations staff to know up-front what messages may come up. 
					This kind of information is usually used to set	up things like log file monitoring 
					and respective procedures.</TD>
			</tr>
			<TR>
				<TD><IMG SRC="images/blank.gif" height=10 width=10 border=0></TD>
				<TD colspan=2></TD>
			</tr>
		</table>
		<FORM name="saveForm" action="/invoke/wx.config.impl.logging/getMessageCatalogToHttp" method="GET" onSubmit="">
			<TABLE class="tableForm" width="100%">
				%invoke wx.config.impl.logging:getMessageCatalogToString%
					<TR>
						<TD class="heading">Log Messages Catalog</TD>
					</TR>
					<TR>
						<TD class="evenrow-l">
						<pre id="editor">%value wxConfigMessageCatalogXml%</pre>
						<script>setReadOnly();editor.getSession().setMode("ace/mode/xml");</script>
						</TD>
					</TR>
					<TR>
						<TD class="action">
							<INPUT  type="submit" name="save" value="Download	" /> 
						</TD>
					</TR>
				%endinvoke%
			</TABLE>
		</form>
	</BODY>
</html>