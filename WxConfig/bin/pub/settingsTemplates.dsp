<html> 
  <head>
	<title>Settings - Templates</title>
	%include snippets/htmlHeadDefaults.dsp%
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<style type="text/css" media="screen">
		.ace_editor {
			position: relative !important;
			border: 1px solid lightgray;
			margin: auto;
			height: 180px;
			width: 90%;
		}
	</style>
	<script src="ace/ace.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		window.onload = function() {
			editor = ace.edit("editor");
			editor.setTheme("ace/theme/eclipse");
			editor.getSession().setMode("ace/mode/text");
			
			editor2 = ace.edit("editor2");
			editor2.setTheme("ace/theme/eclipse");
			editor2.getSession().setMode("ace/mode/xml");
		};

		function putEditorContentsToFileContentVariables() {
			var form = document.saveForm;
			var content = form.newFileContentProperties;
			content.value = editor.getSession().getValue();
			var content2 = form.newFileContentXML;
			content2.value = editor2.getSession().getValue();
		};
	</script>
	
	</head> 

	<body>
		%ifvar actionMode equals('SAVE')%
			%invoke wx.config.impl.ui:settingsTemplatesSave%
				%ifvar message%
					<table width=100%>
						%ifvar success equals('true')%
							<tr>
								<td class="success"><pre>%value message%</pre></td>
							</tr>							
						%else%
							<tr>
								<td class="error"><pre>%value message%</pre></td>
							</tr>
						%endifvar%
					</table>
				%endifvar%   
					%onerror%
						%include snippets/error.dsp%
			%endinvoke%
		%endifvar%

		%invoke wx.config.impl.ui:settingsTemplatesGet%
		%endinvoke%
	
		%include snippets/headerUpdates.dsp%
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb" colspan=6>
					Settings &gt; Templates
				</td>
			</tr>
			<tr>
				<td>
					<img src="images/blank.gif" height=10 width=10>
				</td>
			</tr>
		</table>
		<form name="saveForm" method="post" action="settingsTemplates.dsp" 
			onSubmit="putEditorContentsToFileContentVariables();" target="_self"> 
			<input type="hidden" name="editMode" value="NEW" />
			<input type="hidden" name="actionMode" value="SAVE" />
			<input type="hidden" name="newFileContentProperties" value=""  >
			<input type="hidden" name="newFileContentXML" value=""  >
	   
			<table width="100%" class="tableView">
				<tr>
					<td style="border: none;">
					</td>
					<td width="80%" style="border: none;">  <!-- Required so that the editor shows up, 
											otherwise the editor column will be so
											small that no text is visible at all -->
					</td>
					<td style="border: none;">
					</td>
				</tr>
				
				<tr>
					<td class="heading" colspan=3>New File Templates</td>
				</tr>
			 
				<tr>
					<script>writeTD('row');</script>
						Properties
					</td>
					<script>writeTD('row-l');</script>
						<pre id="editor">%value newFileContentProperties%</pre>
					</td>
					<script>writeTD('row-l');</script>
						Starting content for non-XML files
					</td>
					<script>swapRows();</script>
				</tr>
				
				<tr>
					<script>writeTD('row');</script>
						XML
					</td>
					<script>writeTD('row-l');</script>
						<pre id="editor2">%value newFileContentXML%</pre>
					</td>
					<script>writeTD('row-l');</script>
						Starting content for XML files
					</td>
					<script>swapRows();</script>
				</tr>
				<tr>
					<td class="action" colspan="3">
						<input type="submit" value="Save">
					</td>
				</tr>   
			</table>
		</form>
	</body> 
</html> 

