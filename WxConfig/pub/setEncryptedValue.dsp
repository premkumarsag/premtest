<html> 
	<head>
		<title>Set Encrypted Value</title>
		%include snippets/htmlHeadDefaults.dsp%
	</head> 

	<body>   
		%include snippets/headerUpdates.dsp%

		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb" colspan=6>
					Create Or Update Encrypted Value
				</td>
			</tr>
			<tr>
				<td colspan=3>
					<ul>
						<li> <a href="encryptedValues.dsp">Return to list of encrypted values</a></li>
					</ul>
				</td>
			</tr>
			
		</table>  
		
		
		  <FORM action="encryptedValues.dsp" method="POST">
			<INPUT type="hidden" name="action" value="setValue">
			<INPUT type="hidden" name="pkgID" value="%value pkgID%">
			<INPUT type="hidden" name="showPkg" value="%value showPkg%">
			<INPUT type="hidden" name="id" value="%value id%">
			<INPUT type="hidden" name="calledFromEncryptedValues" value="true">
			<INPUT type="hidden" name="targetPage" value="encryptedValues.dsp">
			<INPUT type="hidden" name="isInPassmanFilter" value="%value isInPassmanFilter%">
				
				<table class="tableView">
				<TR>
					<TD class="heading" colspan=2>Create or Update Encrypted Value</TD>
      	</TR>
				<TR>
					<td>Package</td>
					<TD class="evenrow-l">
						%value pkgID%
					</TD>
				</TR>
				<TR>
					<td>Key</td>
					<TD class="evenrow-l">
						%value id%
					</TD>
				</TR>
				<TR>
					<td>Description</td>
					<TD class="evenrow-l">
						%value description%
					</TD>
				</TR>
				<TR>
					<td>New Value</td>
					<TD class="evenrow-l">
						<INPUT NAME="value" TYPE="password" VALUE="" SIZE="60">
					</TD>
				</TR>
				<TR>
					<td>Repeat New Value</td>
					<TD class="evenrow-l">
						<INPUT NAME="valueRepeat" TYPE="password" VALUE="" SIZE="60">
					</TD>
				</TR>
				<TR>
					<TD class="action" colspan="2">
						<INPUT type="submit" name="submit" value="Apply Changes">
					</TD>
				</TR>
			</TABLE>
				
			

			
		</FORM>
		
		
		
		
	</body> 
</html> 
