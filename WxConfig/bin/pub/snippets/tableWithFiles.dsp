<table width="100%" class=tableView onclick="sortColumn(event)">

							%invoke wx.config.impl.ui:settingsMainGet%
							%endinvoke%
						
							<tr>
								<!-- There is another dynamic setting of colspan at the end of this file.
									     Do not forget to update this, too! -->
								<td class="heading" colspan=
									%ifvar showFileLastChangeDateTime equals('true')%
										14
									%else%
										13
									%endifvar%
									>Configuration Files</td>
							</tr>
							<tr class="subheading2">
								<td class="oddcol-l" tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;" id=defaultsort>&nbsp;Package&nbsp;</td>
								<td class="oddcol"   width="4%" tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Location&nbsp;</td>
								<td class="oddcol-l" tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;File&nbsp;</td>
								<td class="oddcol"   width="4%" tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Stage&nbsp;</td>
								<td class="oddcol"   tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Stage Detail&nbsp;</td>
								<td class="oddcol"   width="4%" tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Conditions&nbsp;</td>
								<td class="oddcol"   width="4%" tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Reload [ms]&nbsp;</td>
								<td class="oddcol"   width="4%" tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Delete&nbsp;</td>
								<td class="oddcol"   width="4%" tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Rename&nbsp;</td>
								<td class="oddcol"   width="4%" tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Valid&nbsp;</td>
								<td class="oddcol"   width="4%" tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Interpolators&nbsp;</td>
								<td class="oddcol"   width="4%" tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Encrypted&nbsp;</td>
								<td class="oddcol"   width="4%" tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Reload&nbsp;</td>
								%ifvar showFileLastChangeDateTime equals('true')%
									<td class="oddcol"   tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Last Save Date&nbsp;</td>
								%endifvar%
							</tr>
						
				         <script>resetRows();</script>

						 
						%ifvar ui/license/isLicenseValid equals('false')%
							<tr>
								<td class="error" colspan=13>No valid license found, therefore no config files are available. Run-time errors will most likely occur!
								</td>
							</tr>
							
						%else%
							%invoke wx.config.impl.ui:getConfigFiles%
							%endinvoke%
							%ifvar configFiles%
								%loop configFiles%
									<tr>
										<script>writeTD('rowdata-l');</script>
											%value cfgId%
										</td>
										<script>writeTD('rowdata');</script>
											%ifvar location/exists equals('false')%
												%ifvar location/type equals('ALIAS')%
													<a href="settingsFileLocations.dsp">
														<IMG SRC="images/configure.gif" border="0" height=14 width=14 alt="Edit Aliases" title="Edit Aliases" /></a>
												%endifvar%
												<IMG SRC="images/dependency.gif" border="0" height=14 width=14 alt="Location missing" title="Location missing" />
											%endifvar%
											<IMG SRC="
													%switch location/type%
														%case 'PATH'%
															/WmRoot/icons/dir.gif
														%case 'ALIAS'%
															images/alias.gif
														%case 'PACKAGE'%
															images/package.gif
													%end%
												" border="0" height=13 width=13 title="Location type = %value location/type%" />
										
											%ifvar location/isRescanEnabled equals('true')%
												<img name="treeRefreshButton" border="0" height=12 width=12
													src="/WmRoot/icons/icon_reload.gif" alt='Rescan Enabled' title="Rescan Enabled" />
											%else%
												<IMG SRC="images/blank.gif" height=12 width=12 border=0 />
											%endifvar%
											
										</td>
										<script>writeTD('rowdata-l');</script>
											%rename /showPkg showPkg -copy%
											%rename /fileNameFilter fileNameFilter -copy%
											%rename /stageDetailFilter stageDetailFilter -copy%
										
											%include snippets/configFileWithLink.dsp%
											
											%ifvar inclusionDirectives/containsGlobalValues%
												%ifvar inclusionDirectives/containsGlobalValues equals('true')%
													<img src="images/globalValues.gif" alt="Global Values" title="Global Values" border="0" />
												%endifvar%
											%endifvar%
											%ifvar inclusionDirectives/overridesDefaults%
												%ifvar inclusionDirectives/overridesDefaults equals('true')%
													<img src="images/overridesDefaults.gif" alt="Overrides Defaults" title="Overrides Defaults" border="0" height=14 width=14/>
												%endifvar%
											%endifvar%
											
											%switch content%
												%case 'AUDIT'%
													<img src="images/contentAudit.gif" alt="Audit Settings" title="Audit Settings" border="0" height=14 width=14 />
												%case 'AUTO_SETUP'%
													<img src="images/contentAutoSetup.gif" alt="Auto-Setup Settings" title="Auto-Setup Settings" border="0" height=14 width=14 />
												%case 'DB_SOURCE'%
													<img src="images/contentDbSource.gif" alt="Database Source" title="Database Source" border="0" height=14 width=14 />
												%case 'PUBLISH'%	
													<img src="images/contentPublish.gif" alt="Publish Settings" title="Publish Settings" border="0" height=14 width=14 />
											%end%
											
												
												
										</td>
										<script>writeTD('rowdata');</script>
											%include snippets/displayStageType.dsp%
										</td>
										<script>writeTD('rowdata');</script>
											%include snippets/displayStageDetail.dsp%
										</td>
										<script>writeTD('rowdata');</script>
											%include snippets/displayConditions.dsp%
										</td>
										<script>writeTD('rowdata');</script>
											%ifvar reloadStrategy/type equals('ON_CHANGE')%
												%value reloadStrategy/refreshDelay%
											%endifvar%
											%ifvar reloadStrategy/type equals('NONE')%
												<IMG SRC="images/reloadNone.gif" title="Reloading Strategy = NONE" border="0" height=13 width=13 />
											%endifvar%
											%ifvar reloadStrategy/type equals('MANAGED')%
												<IMG SRC="images/reloadManaged.gif" title="Reloading Strategy = MANAGED" border="0" height=13 width=13 />
											%endifvar%
											%ifvar reloadStrategy/isValid equals('false')%
												<IMG SRC="images/warning.gif" title="Invalid reloading strategy requested in this file" border="0" height=13 width=13 />
											%endifvar%
										</td>
										<script>writeTD('rowdata');</script>
											<a href="deleteFile.dsp?fileNameWithPath=%value canonicalPath encode(url)%&package=%value cfgId%&showPkg=%value /showPkg%&isMissing=%value isMissing%"> <img src="/WmRoot/icons/delete.gif" alt="Delete" border="0" /></a>
										</td>
										<script>writeTD('rowdata');</script>
											<a href="renameFile.dsp?fileNameWithPath=%value canonicalPath encode(url)%&package=%value cfgId%&showPkg=%value /showPkg%&newFileName=%value fileName%"> <img src="/WmRoot/icons/file.gif" alt="Rename" border="0" /></a>
										</td>
										<script>writeTD('rowdata');</script>
											%ifvar isValid%
												%ifvar isValid equals('true')%
													<IMG SRC="/WmRoot/icons/green-ball.gif" border="0" height=13 width=13 />
												%else%	
													<IMG SRC="/WmRoot/icons/red-ball.gif" border="0" height=13 width=13 />
													&nbsp;
													<IMG SRC="/WmRoot/icons/magnifyglass.gif" border="0" height=13 width=13 
														title="%value loadErrorReason%"/>
												%endif%
											%else%	
												(unknown)
											%endifvar%   
										</td>
										<script>writeTD('rowdata');</script>
											%ifvar containsUnresolvedInterpolator%
												%ifvar containsUnresolvedInterpolator equals('false')%
													<IMG SRC="/WmRoot/icons/green-ball.gif" border="0" height=13 width=13>
												%else%
													%ifvar isActive equals('true')%
														<IMG SRC="/WmRoot/icons/red-ball.gif" border="0" height=13 width=13>
													%else%
														<IMG SRC="/WmRoot/icons/yellow-ball.gif" title="Interpolator cannot be resolved, but this may be caused by the file not being active" 
														border="0" height=13 width=13>
													%endif%
												%endif%
											%else%	
												(unknown)
											%endifvar%   
										</td>
										<script>writeTD('rowdata');</script>
											%ifvar passmanEntryMissing%
												%ifvar passmanEntryMissing equals('true')%
													%ifvar isActive equals('true')%
														<IMG SRC="/WmRoot/icons/red-ball.gif" border="0" height=13 width=13 title="Value is NOT defined in Passman" />
													%else%
														<IMG SRC="/WmRoot/icons/yellow-ball.gif" border="0" height=13 width=13 title="Value is NOT defined in Passman, but file is inactive" />
													%endifvar%
												%else%	
													<IMG SRC="/WmRoot/icons/green-ball.gif" border="0" height=13 width=13>
												%endif%
											%else%	
												
											%endifvar%   
										</td>
										<script>writeTD('rowdata');</script>
											%ifvar ../showPkg%
												<a href="listFiles.dsp?action=reload&package=%value cfgId%&showPkg=%value ../showPkg%">
											%else%
												<a href="listFiles.dsp?action=reload&package=%value cfgId%">
											%endifvar%
											
												<img name="treeRefreshButton" border="0" src="/WmRoot/icons/icon_reload.gif" alt='Reload' title="Reload">
											</a>
										</td>
										%ifvar ../showFileLastChangeDateTime equals('true')%
											<script>writeTD('rowdata');swapRows();</script>
												%ifvar lastModified%
													%value lastModified%
												%else%	
													(unsaved)
												%endifvar%   
											</td>
										%endifvar%
										<script>swapRows();</script>
									</tr>
								%endloop%
							%else%
								<tr><TD><IMG SRC="images/blank.gif" height=10 width=10 border=0></TD></tr>
								<tr>
									<td class="heading" colspan=
									%ifvar showFileLastChangeDateTime equals('true')%
										14
									%else%
										13
									%endifvar%
									>No files to show</td>
								</tr>
							%endifvar%
						%endifvar%
							
						</table>
						<table width="100%" class=tableView>
							<tr>
								<td class="heading" colspan=2>Icons</td>
							</tr>
							<tr>
								<td>Location</td>
								<td>
									<IMG SRC="images/package.gif" border="0" height=13 width=13 title="PACKAGE"> Package
									<IMG SRC="/WmRoot/icons/dir.gif" border="0" height=13 width=13 title="PATH"> Path
									<IMG SRC="images/alias.gif" border="0" height=13 width=13 title="ALIAS"> Alias
									<img name="treeRefreshButton" border="0" height=12 width=12
										src="/WmRoot/icons/icon_reload.gif" alt='Rescan Enabled' title="Rescan Enabled" /> Rescan Enabled
								</td>
							</tr>
							<tr>
								<td>File Content</td>
								<td>
									<img src="images/contentAudit.gif" alt="Audit Settings" title="Audit Settings" border="0" height=14 width=14 /> Audit Settings
									<img src="images/contentAutoSetup.gif" alt="Audit Settings" title="Audit Settings" border="0" height=14 width=14 /> Auto-Setup
									<img src="images/contentDbSource.gif" alt="Database Source" title="Database Source" border="0" height=14 width=14 /> Database Source
									<img src="images/contentPublish.gif" alt="Publish Settings" title="Publish Settings" border="0" height=14 width=14 /> Publish Settings
									<img src="images/overridesDefaults.gif" alt="Overrides Defaults" title="Overrides Defaults" border="0" height=14 width=14 /> Overrides Defaults
								</td>
							</tr>
							<tr>
								<td>Stage</td>
								<td>
									<IMG SRC="images/globalValues.gif" border="0" height=13 width=13 title="GLOBAL"> Global
									<IMG SRC="images/hosts.gif" border="0" height=13 width=13 title="ENVIRONMENT"> Environment
									<IMG SRC="images/computer.gif" border="0" height=13 width=13 title="HOST"> Host
									<IMG SRC="images/number.gif" border="0" height=13 width=13 title="HOST_PORT"> Host+Port
								</td>
							</tr>
							<tr>
								<td>Conditions</td>
								<td>
									<IMG SRC="images/Windows-icon.png" border="0"  title="Windows"> Windows
									<IMG SRC="images/Linux-icon.png" border="0"  title="Linux"> Linux
									<IMG SRC="images/Unix-icon.png" border="0" height=16 width=16 title="Unix/Linux"> Unix/Linux
									<IMG SRC="images/calendar.gif" border="0" title="Date/Time"> Date/Time
								</td>
							</tr>
						</table>