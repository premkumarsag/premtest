<HTML>
	<HEAD>
    	<title>Edit File</title> 
		%include snippets/htmlHeadDefaults.dsp%
		%include snippets/htmlHeadAce.dsp%
	</HEAD>

	<BODY>
	%include snippets/headerUpdates.dsp%
		<TABLE WIDTH="100%">
			<TR>
				<TD class="menusection-Settings" colspan="4">
					Encrypted Values - Bulk Import
				</TD>
			</TR>
			<TR/>
			<TR>
				<TD colspan=2>
					<UL>
						<li> <a href="encryptedValues.dsp">Back to Encrypted Values</a></li>
					</UL>
				</TD>
			</TR>
			<TR>
				<TD><IMG SRC="images/blank.gif" height=10 width=10 border=0></TD>
				<TD>
					<FORM name="saveForm" action="encryptedValues.dsp" method="POST" onSubmit="putEditorContentToFileContentVariable();">
						<INPUT type="hidden" name="action" value="bulkImport">
						<input type="hidden" name="fileContent" value=""  >
						<TABLE class="tableForm" width="100%">
							<TR>
								<TD class="heading">Import of encrypted values</TD>
							</TR>
							<TR>
								<TD class="evenrow-l">
								<pre id="editor"></pre>
								</TD>
							</TR>
							<TR>
								<TD class="action">
									<INPUT  type="submit" name="save" value="Import" /> 
								</TD>
							</TR>
					
						</TABLE>
					</form>
				</TD>

			</TR>
	
		<TR>
			<TD><IMG SRC="images/blank.gif" height=10 width=10 border=0></TD>
     		<TD colspan=2></TD>
		</tr>
	
		
		</TABLE>
	</BODY>
</HTML>
