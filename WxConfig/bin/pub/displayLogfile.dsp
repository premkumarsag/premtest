<html> 

	<head>
		<title>Display Logfile</title>
		%include snippets/htmlHeadDefaults.dsp%
		%include snippets/htmlHeadJquery.dsp%

		<SCRIPT LANGUAGE="JavaScript">
			function buildUrl() {
				var url  = "displayLogfile.dsp?noLines=" + $('#noLines').val()
					+ "&showFatal=" + $('#showFatal').is(':checked')
					+ "&showError=" + $('#showError').is(':checked')
					+ "&showWarn=" + $('#showWarn').is(':checked')
					+ "&showInfo=" + $('#showInfo').is(':checked')
					+ "&showDebug=" + $('#showDebug').is(':checked')
					+ "&showTrace=" + $('#showTrace').is(':checked');
				return url;
			}
			
			function OnChangeInput()
			{
				parent.frames["body"].location.href = buildUrl();
				return true;
			}
			
			window.onkeypress = function(event) {
				if (event.charCode === 114 && event.ctrlKey) {  // CTRL-R pressed
					event.preventDefault();
					parent.frames["body"].location.href = "displayLogfile.dsp?noLines=%value noLines%&showFatal=%value showFatal%";
					return true;
				}
			};
		</SCRIPT>
		<style type='text/css'> pre {display: inline;} </style>
	</head> 

	<body>
	
		
	
		%include snippets/headerUpdates.dsp%
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb">
					Logging &gt; Display Logfile
				</td>
			</tr>
			%ifvar action equals('setDefault')%
				%invoke wx.config.impl.logging:setDefaultsDisplayLogFile%
					%include snippets/successAndMessage.dsp%
					%onerror%
						%include /snippets/error.dsp%
				%endinvoke%
				%invoke wx.config.impl.logging:getDefaultsDisplayLogFile%
				%endinvoke%
			%endifvar%
			
			%ifvar noLines%
			%else%
				%invoke wx.config.impl.logging:getDefaultsDisplayLogFile%
				%endinvoke%
			%endifvar%
		</table>
		
		%invoke wx.config.impl.logging:readLogFileFromEnd%
		%endinvoke%
		
		<!-- action="displayLogfile.dsp?action=setDefault"  -->
	
		<table width=100% class="tableView">
			<tr>
				<td class="heading" colspan=2>
					Log File
				</td>
				
			</tr>
			<tr>
				<td colspan=4>
					<div style="color: black; letter-spacing:1px">
						Number of Lines to Display
						<form method="post" target="_self">
							<input type="hidden" name="action" value="setDefault" />
							<input id="noLines" name="noLines" onchange='OnChangeInput();' 
								value="%value noLines%" type="text" 
								style="width: 60px; padding: 2px; border: 1px solid black; background: white">
							</input>
							
							<noscript><input type="submit" value="Refresh"></noscript>
							<a href="displayLogfile.dsp?noLines=%value noLines%"><img name="refreshButton" border="0" 
									src="/WmRoot/icons/icon_reload.gif" alt='Refresh (or press CTRL-R)' 
									title="Refresh  (or press CTRL-R)" /></a>
							
							<input type="checkbox" value="true" id="showFatal" name="showFatal" %ifvar showFatal equals('true')%checked%endifvar% onchange='OnChangeInput();'>Fatal</input>
							<input type="checkbox" value="true" id="showError" name="showError" %ifvar showError equals('true')%checked%endifvar% onchange='OnChangeInput();'>Error</input>
							<input type="checkbox" value="true" id="showWarn" name="showWarn" %ifvar showWarn equals('true')%checked%endifvar% onchange='OnChangeInput();'>Warn</input>
							<input type="checkbox" value="true" id="showInfo" name="showInfo" %ifvar showInfo equals('true')%checked%endifvar% onchange='OnChangeInput();'>Info</input>
							<input type="checkbox" value="true" id="showDebug" name="showDebug" %ifvar showDebug equals('true')%checked%endifvar% onchange='OnChangeInput();'>Debug</input>
							<input type="checkbox" value="true" id="showTrace" name="showTrace" %ifvar showTrace equals('true')%checked%endifvar% onchange='OnChangeInput();'>Trace</input>
							
							<input type="submit" value="Set as Default"></input>
						</form>
					</div>
				</td>
			</tr>  
			
			<tr class="subheading2">
				<td>
					Level
				</td>
				<td>
					Content
				</td>
			</tr>
			
			%loop lines%
				<tr>
					<script>writeTD('rowdata-l');</script>
						%value level%
					</td>
					<script>writeTD('row-l');</script>
						<pre>%value content%</pre></td>
					<script>swapRows();</script>
				</tr>
			%endloop%
			
		</table>  
	</body>
	<script>document.getElementById("noLines").focus();</script>
</html> 
