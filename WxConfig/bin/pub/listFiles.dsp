<html> 

  <!-- Copyright (c) Software AG  All Rights Reserved. -->

	<head>
		<title>List Files</title>
		%include snippets/htmlHeadDefaults.dsp%
		%include snippets/htmlHeadJquery.dsp%
		<SCRIPT LANGUAGE="JavaScript">
		
				</SCRIPT>
	</head> 

	<body>   
		%include snippets/headerUpdates.dsp%
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb" colspan=2>Configuration &gt; Files</TD>
			</tr>
		
		<!-- Delete operation? -->
		%include snippets/invokeDeleteConfigFile.dsp%
		
		%include snippets/invokeSaveFileAfterEdit.dsp%
		
		%ifvar action equals('rename')%
			<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
	      		<TR>
      				<TD class="info" colspan="4">Rename %value fileNameWithPath% to %value newFileName%</TD>
	      		</TR>
			%invoke wx.config.impl.ui:renameCfgFile%
			%ifvar errorMessage%
				<tr>
					<td colspan="4">&nbsp;</td>
				</tr>
	      		<TR>
      				<TD class="error" colspan="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value errorMessage%</TD>
	      		</TR>
			%endif%
  			%endinvoke wx.config.impl.ui:renameCfgFile%
		%endif%
		
		%ifvar action equals('reload')%
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
		
		
		%ifvar action equals('rescan')%
			%include snippets/invokeReloadAllCfgs.dsp%
		%endif%
		
		%ifvar action equals('clearFavoritePackage')%
			%invoke wx.config.impl.ui:clearFavoritePackage%
				%include snippets/successAndMessage.dsp%
			%endinvoke%
		%endifvar%
		
		%ifvar action equals('setFavoritePackage')%
			%invoke wx.config.impl.ui:setFavoritePackage%
				
			%endinvoke%
			%include snippets/successAndMessage.dsp%
		%endifvar%

		%ifvar action equals('clearFavoriteStage')%
			%invoke wx.config.impl.ui:clearFavoriteStage%
				%include snippets/successAndMessage.dsp%
			%endinvoke%
		%endifvar%
		
		%ifvar action equals('setFavoriteStage')%
			%invoke wx.config.impl.ui:setFavoriteStage%
				
			%endinvoke%
			%include snippets/successAndMessage.dsp%
		%endifvar%
	
		
		
		%invoke wx.config.impl.ui:getFavoritePackage%
		%endinvoke%
		
		%invoke wx.config.impl.ui:getFavoriteStage%
		%endinvoke%
    
		
			<tr>
				<td colspan=3>
					<ul class="listitemsplain">
						<li> <a href="createConfigFile.dsp?configFileName=(new configuration file)&editMode=NEW&actionMode=VIEW
						%ifvar showPkg -notempty%
							&showPkg=%value showPkg%
						%endifvar%
						">Create new Configuration File</a></li>
						<li> <a href="listFiles.dsp?action=rescan">Re-scan all active packages</a> (e.g. after package import or activation)</li>
						%ifvar showPkg -notempty%
							<li><a href="showValues.dsp?showPkg=%value showPkg%">Show package values</a></li>
						%endifvar%
					</ul>
				</td>
			</tr>
			<tr>
				<td>
					<img src="/WmRoot/images/blank.gif" height=10 width=10>
				</td>
			</tr>
		</table>
		<table width=100% class=tableView>
			%include snippets/fileFilter.dsp%
			
					%include snippets/tableWithFiles.dsp%
		</table>  
	</body> 
</html> 
