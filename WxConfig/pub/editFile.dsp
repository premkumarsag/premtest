<HTML>
	<HEAD>
    	<title>Edit File</title> 
		%include snippets/htmlHeadDefaults.dsp%
		%include snippets/htmlHeadAce.dsp%
		<script>
			 window.onkeypress = function(event) {
				if (event.charCode === 115 && event.ctrlKey) {
					event.preventDefault();
					submit();
				}
				
				function submit(){
					putEditorContentToFileContentVariable();
					document.saveForm.submit();
				}
			};
		</script>
	</HEAD>
	<!-- Check if MyVersions plugin is activated -->
	%include snippets/plugins/myversions/checkMyVersionsPluginStatus.dsp%

	<BODY>
			<TABLE WIDTH="100%">
				<TR>
					<TD class="breadcrumb" colspan="4">
						Edit Configuration File
					</TD>
				</TR>
				<TR>
     				<TD colspan=2>
						<UL class="listitemsplain">
							%invoke wx.config.impl.ui:getParamsEditFileDsp%
								%ifvar showLinksPkgFilesAndValues equals('true')%
									<li> <a href="showValues.dsp?showPkg=%value package%">Show values of package %value package%</a></li>
									<li> <a href="listFiles.dsp?package=%include snippets/configFileOptionalParams.dsp%">Cancel Edit and Show files of package %value package%</a></li>
								%endifvar%
								<li> <a href="%value link%">%value description%</a></li>
							%endinvoke%
						</UL>
					</TD>
				</TR>
				<TR>
					<TD><IMG SRC="images/blank.gif" height=10 width=10 border=0></TD>
					<TD>
						<FORM name="saveForm" action=
						%ifvar targetPage%
							"%value targetPage%"
						%else%
							"listFiles.dsp"
						%endifvar%
						
						method="POST" onSubmit="putEditorContentToFileContentVariable();">
							<INPUT type="hidden" name="action" value="change">
							<INPUT type="hidden" name="fileNameWithPath" value="%value fileNameWithPath%">
							<input type="hidden" name="package" value="%value package%">
							<input type="hidden" name="cfgId" value="%value package%">
							<input type="hidden" name="fileContent" value=""  >
							%ifvar /showPkg%
								<input type="hidden" name="showPkg" value="%value /showPkg%"  >
							%endifvar%
							%ifvar /fileNameFilter%
								<input type="hidden" name="fileNameFilter" value="%value /fileNameFilter%"  >
							%endifvar%
							%ifvar /stageDetailFilter%
								<input type="hidden" name="stageDetailFilter" value="%value /stageDetailFilter%"  >
							%endifvar%
							%ifvar targetPage%
								<input type="hidden" name="targetPage" value="%value targetPage%"  >
							%endifvar%
							%ifvar /calledFromAutoSetup%
								%ifvar /calledFromAutoSetup equals('true')%
									<input type="hidden" name="calledFromAutoSetup" value="true">
								%endifvar%
							%endifvar%
							%ifvar /calledFromEncryptedValues%
								%ifvar /calledFromEncryptedValues equals('true')%
									<input type="hidden" name="calledFromEncryptedValues" value="true">
								%endifvar%
							%endifvar%
							<TABLE class="tableForm" width="100%">
%invoke wx.config.impl.util.file:getFile%
							<TR>
								<TD class="heading">%value fileNameWithPath%</TD>
							</TR>
							
							%rename package cfgId -copy%
								%invoke wx.config.impl.admin:getFileDetails%
									%scope file% <!-- "scope file" required for snippets to work -->
							
									<!-- Display stage -->
									<TR>
										<TD class="evenrow-l">
										
												Stage:  %value stage/type%
												%ifvar stage/type equals('GLOBAL')%
													<!-- do not display anything else for "GLOBAL" -->
												%else%
													= %include snippets/displayStageDetail.dsp%
												%endifvar%
												%ifvar inclusionDirectives%
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Conditions :
													%include snippets/displayConditions.dsp%
												%endifvar%
											
										
										
										</TD>
									</TR>
							
									<!-- Display issues if needed -->
									%ifvar issues%
										<TR>
											<TD class="evenrow-l">
												<img width=20 height=20 src="images/error.png" />
												%loop issues%
													%value type% : %value description% %nl%
												%endloop%
											</TD>
										</TR>
									%endifvar%
								%endscope%
							%endinvoke%
							
							<TR>
								<TD class="evenrow-l">
								<pre id="editor">%value fileContent%</pre>
								<div id="statusBar">Cursor  </div>
								</TD>
							</TR>
							%ifvar myVersionsActivated equals('true')%
								%invoke wx.config.plugins.myversion.impl.ui:checkMyVersionsApplicable%
									%ifvar myversionApplicableToDir equals('true')%
										%invoke wx.config.plugins.myversion.impl.ui:getCommitMessageTemplate%
										%endinvoke%
										<tr>
											<TD class="evenrow-l">
											<b>Add Comment to commit <br> file to Version Control <font color="red">*</font></b>
											<script>writeTextField("myversions_commentToCommit", "%value myVersionsCommitMessageTemplate%", 100,0, 'enabled');</script> 
											 </td>
										</tr>
										%else%
										<tr>
											<TD class="evenrow-l">
												<b>Directory not under version control, therefore commit message/comment is not applicable.</b>
											 </td>
										</tr>
									%endifvar%
								%endinvoke%
							%endifvar%      
							<TR>
								<TD class="action">
									<INPUT  type="submit" name="save" value="Save Changes" /> <span style="letter-spacing:1px;color:#000000">(or press CTRL-S to save)</span>
								</TD>
							</TR>
						
%endinvoke%
					
				
				</TABLE>
				</form>
			</TD>
			
			</TR>
			<TR>
				<TD><IMG SRC="images/blank.gif" height=10 width=10 border=0></TD>
				<TD colspan=2>%include snippets/displayHostAndPort.dsp%</TD>
			</tr>
		<table>

		
		
			%ifvar hideConfigFileInfo equals('true')%
			%else%
				<p>
				(The information below is also available from the menu "Info / Config File")
				<p>
				
				%include snippets/infoConfigFileContent.dsp%
				
			%endifvar%
			

	</BODY>
</html>
