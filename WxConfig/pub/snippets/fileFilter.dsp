<tr>
	<td class="heading" colspan=10>Filter</td>
</tr>


<tr>
	<td class="action" colspan=10>
		<select  id="showPkg" name="showPkg" onchange='OnChange();' 
				title="Set filter for package">
			<option value="-all-">-All Packages-</option>
				
			%invoke wx.config.impl.ui:getPackagesWithConfig%
				%onerror%
				  %include /snippets/error.dsp%
			%endinvoke%
			%loop packageList%
				%ifvar packageList vequals(showPkg)%
					<option value="%value packageList%" selected>%value packageList%</option>
				%else%
					<option value="%value packageList%">%value packageList%</option>
				%endifvar%
			%endloop%
		</select>

		%ifvar isFavoritePkgDefined equals('true')%
			<a id="clearFavoritePackage" href="#">
				<img src="images/pin-enabled.gif" title="Click to disable favorite package"/></a>
		%else%
			%ifvar showPkg -notempty%
				%ifvar showPkg equals('-all-')%
				%else%
					<a id="setFavoritePackage" href="#">
						<img src="images/pin-disabled.gif" title="Click to set %value showPkg% as favorite package"/></a>
				%endifvar%
			%endifvar%
		%endifvar%
		
		<span style="color: black;letter-spacing:1px">File Name: </span>
		<input id="fileNameFilter" type="text" name="fileNameFilter" value="%value fileNameFilter%" size=30 
			style="background-color: #FFFFFF" onchange="OnChange();"
			title="Set filter for file name (supported wildcards: * and ?)"/>
			
		
		<select  id="stageDetailFilter" name="stageDetailFilter" onchange='OnChange();' 
				title="Set filter for stage (-current- = all files for current system)">
			<option value="-all-">-All Stages-</option>
				
			%invoke wx.config.impl.ui:getFilterValuesStageDetail%
				%onerror%
				  %include /snippets/error.dsp%
			%endinvoke%
			%loop stageDetails%
				%ifvar stageDetails vequals(stageDetailFilter)%
					<option value="%value stageDetails%" selected>%value stageDetails%</option>
				%else%
					<option value="%value stageDetails%">%value stageDetails%</option>
				%endifvar%
			%endloop%
		</select>
		
		%ifvar isFavoriteStageDetailFilterDefined equals('true')%
			<a id="clearFavoriteStage" href="#">
				<img src="images/pin-enabled.gif" title="Click to disable favorite stage"/></a>
		%else%
			%ifvar stageDetailFilter -notempty%
				%ifvar stageDetailFilter equals('-all-')%
				%else%
					<a id="setFavoriteStage" href="#">
						<img src="images/pin-disabled.gif" title="Click to set %value stageDetailFilter% as favorite stage"/></a>
				%endifvar%
			%endifvar%
		%endifvar%
		
		<a id="refresh" href="#"><img name="refreshButton" border="0" 
				src="/WmRoot/icons/icon_reload.gif" alt='Refresh (or press CTRL-R)' 
				title="Refresh  (or press CTRL-R)"></a>
		<script>
			$.urlParam = function(name){
				var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
				if (results==null){
				   return null;
				}
				else{
				   return results[1] || 0;
				}
			}
		
			function buildUrl() {
				var url  = "%value targetUrl%";
				
				var params = new Array(
						new Array("showPkg", $('#showPkg').val()), 
						new Array("fileNameFilter", $('#fileNameFilter').val() ),
						new Array("stageDetailFilter", $('#stageDetailFilter').val() )
					);
				var urlAppend;
				
				for (var i = 0; i < params.length; ++i) {
					if (params[i][1]) {
						var paramStr = params[i][0] + "=" + params[i][1];
						if (urlAppend) {
							urlAppend = urlAppend + "&" + paramStr;
						} else {
							urlAppend = paramStr;
						}
					}
				}
				
				if (urlAppend) {
					url = url + "?" + urlAppend;
				}
				
				return url;
			}
		
			function OnChange(addUrl)
			{
				var url = buildUrl();
				if (addUrl) {
					url = url + addUrl;
				}
				parent.frames["body"].location.href = url;
				return true;
			}

			window.onkeypress = function(event) {
				if (event.charCode === 114 && event.ctrlKey) {  // CTRL-R pressed
					event.preventDefault();
					parent.frames["body"].location.href = buildUrl();
					return true;
				}
			};

			$('#clearFavoritePackage').click(function(){ OnChange("&action=clearFavoritePackage"); return false; });
			$('#setFavoritePackage').click(function(){ OnChange("&action=setFavoritePackage"); return false; });
			$('#clearFavoriteStage').click(function(){ OnChange("&action=clearFavoriteStage"); return false; });
			$('#setFavoriteStage').click(function(){ OnChange("&action=setFavoriteStage"); return false; });
			$('#refresh').click(function(){ OnChange(); return false; });
			$('#fileNameFilter').focus();$('#fileNameFilter').select();
		</script>
		
	</td>
</tr>  