<html> 

	<head>
		<title>Add Configuration Value to Flow Service (Step 1 of 2)</title>
		%include snippets/htmlHeadDefaults.dsp%
	</head> 

<body>
	%include snippets/headerUpdates.dsp%
   

	<table width=100%>
		<tr>
			<td class="breadcrumb" colspan=6>
				Development &gt; Update Flow Service with Configuration Values (Step 1 of 2)
			</td>
		</tr>
		<tr>
			<td>
				<img src="images/blank.gif" height=10 width=10>
	        </td>
      	</tr>
	</table>
	
	 %ifvar actionMode equals('SAVE')%
    	%invoke wx.config.impl.ui:createSvcWithCfgValues%
			%ifvar errorMessage%
				<table width=100%>
					<tr>
						<td class="success">%value errorMessage%</td>
					</tr>
				</table>
			%else%
				<script>parent.menu.treeRefreshButton.click();</script>
			 %endifvar%   
				%onerror%
					%include snippets/error.dsp%
		%endinvoke%
		<!-- % invoke wx.config.ui:reloadPackageCfg%
		% endinvoke wx.config.ui:reloadPackageCfg% -->
		<table width=100% cellspacing=0 cellpadding=0>
			<TR>
				<TD colspan=2>
					<UL class="listitemsplain">
						<li> <a href="showValues.dsp?showPkg=%value package%">Show values of package %value package%</a></li>
						<li> <a href="listFiles.dsp?showPkg=%value package%">Show files of package %value package%</a></li>
						<li> <a href="configFlowServiceAddValues.dsp?serviceName=%value serviceName%&editMode=NEW&actionMode=VIEW">Add more values to %value serviceName%</a></li>
					</UL>
				</TD>
			</TR>
		</table>
    %endifvar%

  
	<form method="post" action="configFlowServiceAddValues.dsp" target="_self"> 
		<input type="hidden" name="editMode" value="NEW">           
		<input type="hidden" name="actionMode" value="VIEW">        
   
		<table width="100%" class="tableView">
			<tr>
				<td class="heading" colspan=2>Specify Service</td>
			</tr>

			<tr>
				<script>writeTD('row');</script>
					Service Name
				</td>
				<script>writeTD('rowdata-l');writeInputFieldWithId("service-name", "serviceName", "", 70, "%value /editMode%");</script>
					(Service Name with full Namespace)
				</td>
				<script>swapRows();</script>
			</tr>
    
  
			<tr>
				<td class="action" colspan="2">
				   <input type="submit" value="Next">
				</td>
			</tr>   
		</table>
	</form>
  

	<table>
		<tr>
			<td>
				<img src="images/blank.gif" height=10 width=10>
	        </td>
      	</tr>
				
		<tr>
			<td>
				This dialogue allows you to specify a Flow serive (with full namespace), 
				to which you want to add configuration values. Once you press "Next",
				all available values will be shown and you can choose which ones are
				to be added. Values already available to the service will show a green
				check mark on the left.
				<p>
				What happens is that a Flow Sequence with a certain name is created at
				the top of the Flow service, leaving existing logic untouched. If needed,
				this Sequence can be moved around (e.g. for services calles from an 
				Email port).
				Within this Sequence the individual values are retrieved and added
				to a single document. Its default name is "config" and can be changed
				in the "Settings / Main" dialogue.
				<p>
				You can add values as often as you want, existing Flow code will
				never be affected. The only requirement is, that no unsaved
				changes must exist in Designer; those would be lost.
	        </td>
      	</tr>
		
		
    </table>
	<script>document.getElementById("service-name").focus();</script>
  </body> 
</html> 
