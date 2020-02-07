<HTML>
	<HEAD>
		<title>Plugin : MyVersions</title>
		%include snippets/htmlHeadDefaults.dsp%
	</HEAD>

	<BODY>		
	
	<TABLE WIDTH="100%">
		<TR>
			<TD class="breadcrumb" colspan="4">
				Plugins &gt; MyVersions &gt; Documentation
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
			<td class="heading" colspan=2 >MyVersions - Documentation</td>
		</tr>
		<tr class="subheading2">
			<td>Topic</td>
			<td>Content</td>
		</tr>
		<tr>
			<script>swapRows();writeTD('row');swapRows();</script> 
				Introduction
			</td>
			<script>writeTD('row-l');</script>
				<p>			
					MyVersions is the integration with a version control system for configuration files generated within WxConfig. 
					This enables versioning of configuration files and helps keep track of changes to configuration across different environments.  
					<br><br><b>
					NOTE:</b> This is not a replacement for version control in Development environment, but to 'manage' configuration changes in 
					Non-Dev environments. Refer Primary Use Case below for more details.
					
				</p>
				<p>
					<br>
					<h4>Primary Usecase</h4>
					This plugin extends WxConfig by introducing version control to the configurations, primarily for the ones placed 
					outside the package/config path. All configurations residing in the package are expected to be version controlled by 
					standard code version control mechanism. However, if the IS/packages/package path is versioned on the disk, MyVersions
					would perform the versioning for package configs as well.
					<br><br>
					Primary driver for this plugin is to enable "Testers" to make changes to configurations in "Test Environments" 
					without involving developers to make configuration changes and triggering a re-deployment / re-release of the interface.
					<br><br>
					This plugin currently - enables - config versioning across all the environments (including production).
					The level to which you wish to perform configuration management depends on your local environment and process.
					<br><br>
					It should be well understood that a change of configuration files in the test environment, nullifies the "tagging" 
					process performed as part of the original release of interface. Hence, management of configuration and its impact 
					on build tagging should be taken into consideration while designing the release process. 
					<br><br>
					<h4>What MyVersions is NOT ?</h4>
					<ul class="listitemsplain">
						<li>MyVersions is not a runtime component, but only a process enabler, and ensures that all configuration files 
							(other than the ones which reside inside the package) are version controlled at all times (post development).
						
						<li>As a general recommendation, the availabilty of this feature SHOULD NOT be considered as a license to make 
							changes to configurations in non-prod environments, bypassing release and code control procedures. This feature 
							is only available to ensure greater control of the configuration changes in Testing environments.
						<li>Also, it is to be noted that, although, the architecture mentioned below, does suggest a connection between 
							production environments and VCS, this need not always be possible / recommended. In such cases, direct configuration 
							changes to Non_VCS enabled configuration environment should be strictly avoided.
					</ul>
					<br>Check the "Architecture" section below to understand a typical lifecycle of configuration files between environments.
				</p>		
			</td>
			
		</tr>
		<tr>
			<script>swapRows();writeTD('row');swapRows();</script> 
				Initial Setup
			</td>
			<script>writeTD('row-l');</script>
		
				<p>
				To activate the plugin, perform the following steps: 
				<ol>
					<li>Install SVN on IS host. The versions of SVN install with which this was tested is mentioned under <A HREF="myversions.dsp">MyVersions home page > Supported Versions page.</A><br><b>Note:</b>SVN should be installed on all integration servers from which configuration changes will be performed. SVN should be available on the command line post installation for the user with which webMethods IS process is started. </li>
					
					<li>Install WxSvn package on Intetegration Server WxSvn is distributed along with MyVersions plugin. Go to MyVersions page > Install Dependent packages link for installing this.<br><b>Note:</b> This package should be installed on all integration servers from which configuration changes will be performed. </li>
					
					<li>Click on "Test SVN Available" to confirm is the system has SVN available.
					
					<li>Create a 'Global' configuration file - <b>wxconfig.cnf</b> with below content and place it under the WxSvn package config dir from WxConfig UI.
					<br><br>
						<textarea rows="12" cols="120">
#
# ==== Configurable Area ====

# Set a SVN - Username / Password per user in each environment, where they need to access SVN
# - replace <<IS_USERNAME>> with the name of the user logging in into the IS, who would make the update to cnf files
# - replace <<svn_username>> with svn name of this user
# - add the svn password to the key. 
myversions.svn.username.<<IS_USERNAME>>=<<svn_username>>
myversions.svn.password.<<IS_USERNAME>>=[[encrypted:SVN_<<IS_USERNAME>>_PASSWORD]]

						</textarea>
					</li>	
					<li>Add entries for username and password in this config file, as per instructions mentioned.</li>
					<li>Ensure password is entered for the above key under WxConfig > Encrypted Values.</li>
					<li>Configure a 'File Location Alias' under WxConfig > File Locations Aliases - and point it to the network shared location. For e.g. SHARED_CONFIG_DIR pointing to \\networkdrive\SharedConfigDir\DEV etc. </li>
					<li>Checkout your code to the above File Location Alias. All code added / committed will be commited to the same repository from which the code is checked out.</li>
				</ol>	
				
				Now you are ready to use MyVersions plugin. Use the "Alias" functionality while creating a new file to use common file location aliases.
				</p>
				<!-- <script>swapRows();</script> -->
			</td>
			
		</tr>
		
		<tr>
			<script>swapRows();writeTD('row');swapRows();</script> 
				Deployment Architecture
			</td>
			<script>writeTD('row-l');</script>
		
				<p>
					A typical architecture for the SVN enabled configuration file management is detailed in the below diagram.
					<br><br>
					<img src="./images/SvnKit1.jpg" />
				</p>
				<p>
				Notes:
				<ol>
					<li>There is a shared disk for all configurations
					<li>Each environment could have a shared disk for itself. The above is the example of an optimized setup which is divided into Non_prod and Prod environments.
				</ol>
				</p>
			</td>
			
		</tr>
		
		<tr>
			<script>swapRows();writeTD('row');swapRows();</script> 
				Features
			</td>
			<script>writeTD('row-l');</script>
		
				<H4>Supported</H4>	
				<ol>
					<li>New Config file add in WxConfig: If using 'File location alias', adds config file to version control. If the package folder doesnt exist, adds this folder also to version control. If either of commit fails, the new file is deleted (transactionality for add feature).
					<li>Config file update in WxConfig: Updates the config file to version control.
					<li>Check if SVN is installed and available in host for use
					<li>Update File Location Alias from version control.
				</ol>
				
				<H4>Not Supported</H4>	
				<ol>
					<li>Checkout from Version control. It is expected to be done manually on the File location alias disk - once in the lifetime with environment set-up. Refer Install steps above.
					<li>Deletion of files does not delete the files from Version control. This was considered too risky a feature and hence all deletions of config files from version control should be done manually.
				</ol>
				</p>
			</td>
			
		</tr>

		<tr>
			<script>swapRows();writeTD('row');swapRows();</script> 
				Usage
			</td>
			<script>writeTD('row-l');</script>
				<ol>
					<li>MyVersions uses underlying version control facility to ensure that all configuration files are always versioned / change controlled.
					<li>A typical usage is for every package to have two types of config files - 1 within the package, which holds configs which do not change across environments and 2, a config file holding configurations - which change between environments. MyVersions plugin is specifically built to handle configurations which come under #2 category.
					<li>Use "File Location" > "Alias" functionality to create configuration files across differnt environments
					<li>It is a good practice to enter commit messages every time a change is performed on the config file. In most cases, this will be mandated by the version control manager.
				</ol>
				
				
				</p>
			</td>
			
		</tr>
		

  	</TABLE>
</BODY>



