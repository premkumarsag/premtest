	
		<tr class="subheading2">
			<td>Topic</td>
			<td>Content</td>
		</tr>
		<tr>
			<script>writeTD('row');</script>
				Overview
			</td>
			<script>writeTD('row-l');</script>
				Quite often a package relies on the existence of configuration 
				settings that are maintained outside the package for the 
				entire Integration Server (e.g. JMS connection alias). 
				When such a package is then moved to another server instance, 
				normally all those settings need to be re-applied manually.
				<p>
				Apart from people often not documenting those things at all, 
				it is cumbersome and error-prone. The approach WxConfig takes, 
				is to have those things in a special configuration file within 
				the package. Using a startup service the custom package can 
				then ensure that whatever is needed gets set up automatically. 
				The approach is defensive here, i.e. if something already 
				exists it will not be changed.
			</td>
			<script>swapRows();</script>
		</tr>
		
		<tr>
			<script>writeTD('row');</script>
				Settings
			</td>
			<script>writeTD('row-l');</script>
				The following settings are supported:
				<ul class="listitemsplain">
					%invoke wx.config.impl.autoSetup.util:getAreas%
						%loop autoSetupArea%
							<li>%value autoSetupArea%</li>
						%endloop%
					%endinvoke%
				</ul>
			</td>
			<script>swapRows();</script>
		</tr>
		
		<tr>
			<script>writeTD('row');</script>
				Steps
			</td>
			<script>writeTD('row-l');</script>
				Perform the following activities
				<ul class="listitemsplain">
					<li>Go to menu "Auto Setup / Overview"</li>
					<li>Enable auto-setup for your package, if required. If you do that, a custom package-listener
						will trigger the execution automatically. Othwerwise a you have to create a startup service
						and trigger things manually. In most cases the automatic execution will be easiest way.
						Manual execution via a custom startup service may be needed if e.g. a special order
						is required; the package listener executes the service <code>wx.config.pub.autoSetup:_all</code>,
						no customization is possible here.</li>
					<li>Click the <img src="/WmRoot/icons/addspec.gif"/> icon to create a new config file</li>
					<li>One the following page choose the area for auto-setup by selecting the appropriate template.</li>
					<li>The temnplate selection will set the filename to a default; adjust if required. This is usually the case for
						settings that are environment- or host-sepcific. In that case you also need
						to specify for which stage or host your new file shall be applicable</li>
					<li>Click the "Create" button. The new file will be created andy
						ou will be taken back to the menu "Auto Setup / Overview"</li>
					<li>Adjust file contents to your needs and removed unneeded things</li>
				</ul>
				<p>
				If you don't want to activate automatic execution of auto-setup, you also
				need to perform the following steps.
				<p>
				<ul class="listitemsplain">
					<li>Create Flow service (e.g. "myPackage.startup:autoSetup") 
						in your package and 
						add the required (this depends on the contents of your file) 
						invocations of services from the folder 
						"wx.config.pub.autoSetup:*".</li>
					<li>For each of those invocations set the input "wxConfigPkgName"
						to the name of your package.</li>
					<li>Make the "myPackage.startup:autoSetup" Flow service a 
						startup service for your package.</li>
				</ul>
			</td>
			<script>swapRows();</script>
		</tr>
		
	</table>
		