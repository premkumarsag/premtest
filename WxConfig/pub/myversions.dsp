<HTML>
	<HEAD>
		<title>Plugin : MyVersions</title>
		%include snippets/htmlHeadDefaults.dsp%
	</HEAD>
	
	%ifvar actionMode equals('CHECKSVN')%
		%invoke wx.config.plugins.myversion.impl.ui:isSvnReady%
			%ifvar message%
				%ifvar success equals('true')%
					<table width=100%>
						<tr>
							<td class="success">%value message%<br>%value svnVersionInfo%</td>
						</tr>
					</table>
				%else%
					<table width=100%>
						<tr>
							<td class="error"><pre>%value message%</pre></td>
						</tr>
					</table>
				%endifvar%
			%else%
				<script>parent.menu.treeRefreshButton.click();</script>
			%endifvar%   
				%onerror%
					%include snippets/error.dsp%
			%endifvar%
		%endinvoke%
	
		%invoke wx.config.plugins.myversion.impl.ui:getMyVersionsActivated%
		%endinvoke%

	%ifvar actionMode equals('SAVE')%
		%invoke wx.config.plugins.myversion.impl.ui:setMyVersionsActivated%
			%ifvar message%
				%ifvar success equals('true')%
					<table width=100%>
						<tr>
							<td class="success">%value message%<br>%value svnVersionInfo%</td>
						</tr>
					</table>
				%else%
					<table width=100%>
						<tr>
							<td class="error"><pre>%value message%</pre></td>
						</tr>
					</table>
				%endifvar%
			%else%
				<script>parent.menu.treeRefreshButton.click();</script>
			%endifvar%   
				%onerror%
					%include snippets/error.dsp%
			%endifvar%
		%endinvoke%
	
		%invoke wx.config.plugins.myversion.impl.ui:getMyVersionsActivated%
		%endinvoke%
	<BODY>
		
	
	<TABLE WIDTH="100%">
		<TR>
			<TD class="breadcrumb" colspan="4">
				Plugins &gt; MyVersions
			</TD>
		</TR>
		<TR/>
		
		<TR>
			<TD><IMG SRC="images/blank.gif" height=2 width=10 border=0></TD>
     		<TD colspan=2></TD>
		</tr>
	</table>
	<table width="100%" class="tableView">
		<tr>
			<td class="heading" colspan=2 >MyVersions</td>
		</tr>

		<script>resetRows();</script>
		<form name="saveForm" method="post" action="myversions.dsp" target="_self">
			<input type="hidden" name="actionMode" value="SAVE" />
			<tr>
				<script>writeTD('row');</script>
					Activate Plugin
				</td>
				<script>writeTD('row-l');</script>
					Activate this plugin. Ensure that you have performed the steps above before activating the plugin.
					
					<br>	<br>
						
						%switch myVersionsActivated%
						%case 'true'%
							<input id="myVersionsActivated-false" type="radio" name="newMyVersionsActivated" value="false" >No</input>
							<input id="myVersionsActivated-true" type="radio" name="newMyVersionsActivated" value="true" checked>Yes</input>
						%case 'false'%
							<input id="myVersionsActivated-false" type="radio" name="newMyVersionsActivated" value="false" checked>No</input>
							<input id="myVersionsActivated-true" type="radio" name="newMyVersionsActivated" value="true" >Yes</input>
						%case%
							<input id="myVersionsActivated-false" type="radio" name="newMyVersionsActivated" value="false" checked >No</input>
							<input id="myVersionsActivated-true" type="radio" name="newMyVersionsActivated" value="true" >Yes</input>
						%end%
						<br><br>
					<input type="submit" value="Save" />
				</td>
						
			</tr>
			<script>swapRows();</script>
		</form>
		
	
		<tr>
			<script>writeTD('row');</script>
					Supported Versions
			</td>
			<script>writeTD('row-l');</script>
				Integration with the following VCS systems are supported: 
				<ul class="listitemsplain">
					<li><b>SVN</b> : This is achieved using WxSvn package, which is a wrapper implementation which makes native  SVN command line calls. 
						This has been tested using Slik SVN binary.
					<li>Versions tested are:
						<ul class="listitemsplain">
							<li>Windows 2008 R2 - SVN, version 1.8.3-SlikSvn-1.8.3-X64 (SlikSvn/1.8.3) X64
						</ul>
					</li>
				</ul>
				
		</tr>
		<script>swapRows();</script>
		<tr>
			<script>writeTD('row');</script>
				Install Dependent Packages
			</td>
			<script>writeTD('row-l');</script>
				<form action="myVersionsDependentInstall.dsp">
					<input type="submit" value = "Install Dependent Packages" >
				</form>
			</td>
		</tr>
		<script>swapRows();</script>
		<tr>
			<script>writeTD('row');</script>
				Check SVN Available
			</td>
			<script>writeTD('row-l');</script>
				Click on the link below to confirm if SVN is available on your system and is configured to work with MyVersions.
			<p>
			Note that this will only work if WxSvn Package has been installed on your IS (via "Install Dependent Packages").
			<p>
				<form action="myversions.dsp">
					<input type="hidden" name="actionMode" value="CHECKSVN"/>
					<input type="submit" value = "Test SVN Available" >
				</form>
			</p>
			</td>
		</tr>
		<script>swapRows();</script>
		<tr>
			<script>writeTD('row');</script>
				Documentation
			</td>
			<script>writeTD('row-l');</script>
				Documentation covers the following topics:
				<ul class="listitemsplain">
					<li>Introduction
					<li>Initial Setup
					<li>Architecture (Deployment)
					<li>Feature List
					<li>Usage					
				</ul>
				<a href="myversionsDocumentation.dsp">Refer Detailed Documentation here.</a> 
				</p>
			</td>
		</tr>
		<script>swapRows();</script>
		<tr>
			<script>writeTD('row');</script>
				Plugin Author
			</td>
			<script>writeTD('row-l');</script>
				Dilish Kuruppath (Date: 25-Oct-2013)
				</p>
			</td>
		</tr>
  	</TABLE>
</BODY>