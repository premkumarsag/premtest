<html> 
	<head>
		<title>Clear Encrypted Value</title>
		%include snippets/htmlHeadDefaults.dsp%
	</head> 

	<body>   
		%include snippets/headerUpdates.dsp%

		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb" colspan=6>
					Remove Encrypted Value from Password Store
				</td>
			</tr>
			<tr>
				<td>
					<ul>
						<li> <a href="encryptedValues.dsp?calledFromEncryptedValues=true&targetPage=encryptedValues.dsp">Return to list of encrypted values</a></li>
					</ul>
				</td>
			</tr>
			
		</table>  
		
		
		  <FORM action="encryptedValues.dsp" method="POST">
			<INPUT type="hidden" name="action" value="clearValue">
			<INPUT type="hidden" name="pkgID" value="%value pkgID%">
			<INPUT type="hidden" name="showPkg" value="%value showPkg%">
			<INPUT type="hidden" name="id" value="%value id%">
			<INPUT type="hidden" name="calledFromEncryptedValues" value="true">
			<INPUT type="hidden" name="targetPage" value="encryptedValues.dsp">
			<INPUT type="hidden" name="isInPassmanFilter" value="%value isInPassmanFilter%">

			<table class="tableView">
				<TR>
					<TD class="heading" colspan=3>Clear Encrypted Value&nbsp;</TD>
				</TR>
				<TR class="subheading2">
					<td>Package</td>
					<TD>Key</TD>
					<TD>Description</TD>
				</TR>
				<TR>
					<td>
						%value pkgID%
					</TD>
				
					<TD>
						%value id%
					</TD>
					<TD>
						%value description%
					</TD>
				</TR>
				<TR>
					<TD class="action" colspan="2">
						<INPUT type="submit" name="submit" value="Remove">
					</TD>
				</TR>
			</TABLE>
				
			

			
		</FORM>
		
		
		
		
	</body> 
</html> 
