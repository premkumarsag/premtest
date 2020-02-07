<html> 

  <!-- Copyright (c) 2017, Software AG  All Rights Reserved. -->

	<head>
		<title>Show Encrypted Values Status</title>
		%include snippets/htmlHeadDefaults.dsp%
		%include snippets/htmlHeadJquery.dsp%
	</head> 

	<body>
		%include snippets/headerUpdates.dsp%
		<table width=100% cellspacing=0 cellpadding=0>
			<tr>
				<td class="breadcrumb" colspan=6>
					Configuration &gt; Encrypted Values
				</td>
			</tr>
		
			%include snippets/invokeSaveFileAfterEdit.dsp%
			
			%ifvar action equals('setValue')%
				%invoke wx.config.impl.util.passman:passmanCreateOrUpdate%
				%ifvar message%
					%ifvar result equals('true')%
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<TR>
							<TD class="success" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message%</TD>
						</TR>
					%else%
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<TR>
							<TD class="error" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message%</TD>
						</TR>
					%endifvar%
				%endif%
				%endinvoke wx.config.impl.util.passman:passmanCreateOrUpdate%
			%endif%
		
		
			%ifvar action equals('clearValue')%
				%invoke wx.config.impl.util.passman:passmanRemove%
				%ifvar result equals('true')%
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<TR>
							<TD class="success" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message%</TD>
						</TR>
					%else%
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<TR>
							<TD class="error" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message%</TD>
						</TR>
					%endifvar%
				%endinvoke wx.config.impl.util.passman:passmanRemove%
			%endif%
			
			%ifvar action equals('setLock')%
				%invoke wx.config.impl.util.passman:passmanLockSet%
				%ifvar message%
					%ifvar result equals('true')%
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<TR>
							<TD class="success" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message%</TD>
						</TR>
					%else%
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<TR>
							<TD class="error" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message%</TD>
						</TR>
					%endifvar%
				%endif%
				%endinvoke wx.config.impl.util.passman:passmanLockSet%
			%endif%
			
			%ifvar action equals('removeLock')%
				%invoke wx.config.impl.util.passman:passmanLockRemove%
				%ifvar message%
					%ifvar result equals('true')%
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<TR>
							<TD class="success" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message%</TD>
						</TR>
					%else%
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<TR>
							<TD class="error" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message%</TD>
						</TR>
					%endifvar%
				%endif%
				%endinvoke wx.config.impl.util.passman:passmanLockRemove%
			%endif%
			
			%ifvar action equals('setDescription')%
				%invoke wx.config.impl.ui:setEncryptedValueDescription%
					%ifvar success equals('true')%
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<TR>
							<TD class="success" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message%</TD>
						</TR>
					%else%
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<TR>
							<TD class="error" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;%value message%</TD>
						</TR>
					%endifvar%
				%endinvoke  wx.config.impl.ui:setEncryptedValueDescription%
			%endif%
			
			%ifvar action equals('bulkImport')%
				%invoke wx.config.impl.util.passman:bulkImportFromString%
					%include snippets/successAndMessage.dsp%
				%endinvoke wx.config.impl.util.passman:bulkImportFromString%
			%endif%
		
			<tr>
				<td>
					<img src="/WmRoot/images/blank.gif" height=10 width=10>
				</td>
			</tr>
			<tr>
				<td colspan=3>
					<ul>
						<li> <a href="encryptedValuesBulkExport.dsp">Bulk-Export of Encrypted Values</a></li>
						<li> <a href="encryptedValuesBulkImport.dsp">Bulk-Import of Encrypted Values</a></li>
					</ul>
				</td>
			</tr>

			
			<tr>
				<td>
					<img src="/WmRoot/images/blank.gif" height=10 width=10>
				</td>
			</tr>
		</table>
			
		<table width=100% class="tableView">
			
			%include snippets/fileFilter.dsp%
		
			<tr>
				<td class="heading" colspan=8>Encrypted Values</td>
			</tr>
			<tr class="subheading2">
				<td class="oddcol-l"   width="2%" tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Package&nbsp;</td>
				<td class="oddcol-l" width="30%" tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;" >&nbsp;Description&nbsp;</td>
				<td class="oddcol" width="2%" tdclass="rowdata-l">Edit</td>
				<td class="oddcol"   width="6%" tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Handle&nbsp;</td>
				<td class="oddcol"   width="6%" tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Status&nbsp;</td>
				<td class="oddcol"   width="6%" tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Clear&nbsp;</td>
				<td class="oddcol"   width="6%" tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Lock&nbsp;</td>
				<td class="oddcol"  width="10%" tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;File&nbsp;</td>
			</tr>
			<script>resetRows();</script>
			
			%invoke wx.config.impl.ui:getParamsEditFileDsp%
			%endinvoke%
			
			%invoke wx.config.impl.ui:getEncryptedValues%
			%endinvoke%
			%ifvar encryptedValuesWithFile%
				%loop encryptedValuesWithFile%
					<tr>
						%scope encryptedValue%
							<script>writeTD('rowdata-l');</script>
								%value cfgId%
							</td>
							<script>writeTD('row-l')</script>
								%value description%
							</td>
							<script>writeTD('rowdata');</script>
								<a href="encryptedValues.dsp?action=EDIT
										&package=%value cfgId%
										&showPkg=%value /showPkg%
										&encryptedValue=%value handle%
										&descriptionEnc=%value description%
										&fileNameWithPath=%value ../configFile/canonicalPath encode(url)%
										&isInPassmanFilter=%value /isInPassmanFilter%
										&calledFromEncryptedValues=true
										&targetPage=encryptedValues.dsp"> 
									<img src="/WmRoot/icons/file.gif" alt="Edit" title="Edit description" border="0" />
								</a>
							</td>
							<script>writeTD('rowdata');</script>
								<a href="setEncryptedValue.dsp?pkgID=%value cfgId%&id=%value value%&isInPassmanFilter=%value /isInPassmanFilter%&showPkg=%value /showPkg%&description=%value description%" 
										title="Set/update value in Passman">
									%value handle%</a>
							</td>
							<script>writeTD('rowdata')</script>
								%ifvar existsInPassman equals('true')%
									<IMG SRC="/WmRoot/icons/green-ball.gif" border="0" height=13 width=13 title="Value is defined in Passman" />
								%else%
									%ifvar ../configFile/isActive equals('true')%
										<IMG SRC="/WmRoot/icons/red-ball.gif" border="0" height=13 width=13 title="Value is NOT defined in Passman" />
									%else%
										<IMG SRC="/WmRoot/icons/yellow-ball.gif" border="0" height=13 width=13 title="Value is NOT defined in Passman, but file is inactive" />
									%endifvar%
								%endif%
							</td>
							<script>writeTD('rowdata');</script>
								%ifvar existsInPassman equals('true')%
									<a href="clearEncryptedValue.dsp?pkgID=%value cfgId%&id=%value value%&isInPassmanFilter=%value /isInPassmanFilter%&showPkg=%value /showPkg%&description=%value description%" 
											title="Remove value from Passman">
										<IMG SRC="/WmRoot/icons/delete.gif" border="0" height=13 width=13>
									</a>
								%else%	
									empty
								%endif%
							</td>
							<script>writeTD('rowdata')</script>
								%ifvar isUpdateLocked equals('true')%
									<a href="encryptedValues.dsp?action=removeLock&pkgID=%value cfgId%&id=%value value%&showPkg=%value /showPkg%" >
										<IMG SRC="images/Locked.gif" border="0" height=13 width=13 title="Value locked against changes, click to remove lock" />
									</a>
								%else%	
									<a href="encryptedValues.dsp?action=setLock&pkgID=%value cfgId%&id=%value value%&showPkg=%value /showPkg%" >
										<IMG SRC="images/LockOpen.gif" border="0" height=13 width=13 title="Value can be changed, click to set lock" />
									</a>
								%endif%
							</td>
						%endscope%
						<script>writeTD('row-l');</script>
							%scope configFile%
								%rename /calledFromEncryptedValues calledFromEncryptedValues -copy%
								%include snippets/configFileWithLink.dsp%
							%endscope%
						</td>
					</tr>
					<script>swapRows();</script>
				%endloop%
			%else%
				<tr>
					<td class="oddrowdata" colspan=7>
						There are no encrypted values configured.
					</td>
				</tr>
			%endifvar%
			</table>
			
			
			
			
			
			%ifvar action equals('EDIT')%
					
				<form name="saveForm" method="post" action="encryptedValues.dsp" 
						target="_self"> 
					<input type="hidden" name="action" value="setDescription" />
					<input type="hidden" name="fileNameWithPath" value="%value fileNameWithPath%" />
					<input type="hidden" name="package" value="%value package%" />
					<input type="hidden" name="showPkg" value="%value showPkg%" />
					<input type="hidden" name="encryptedValue" value="%value encryptedValue%" />
					<input type="hidden" name="calledFromEncryptedValues" value="true" />
					<input type="hidden" name="targetPage" value="encryptedValues.dsp" />

					<table width="100%" class="tableView">
						<tr>
							<td class="heading" colspan=2>
								Change Description
							</td>
						</tr>

						<tr>
							<script>writeTD('row');</script>
								Package
							</td>
							<script>writeTD('row-l');</script>
								%value package%
							</td>
						</tr>
						
						<tr>
							<script>writeTD('row');</script>
								Encrypted Value
							</td>
							<script>writeTD('row-l');</script>
									%value encryptedValue%
							</td>
							<script>swapRows();</script>
						</tr>
						
							<script>writeTD('row');</script>
								Description
							</td>
							<script>writeTD('row-l');</script>
								<script>writeInputFieldWithId("description","description", "%value descriptionEnc%" , 200, "EDIT");</script>
								<script>document.getElementById("description").focus();</script>
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
			%endifvar%
			
			
		
			
			
			%ifvar unusedEntries%
				<table class=tableView >
					<tr>
						<td class="heading" colspan=2>Unreferenced Handles&nbsp;</td>
					</tr>
					<tr class="subheading2">
						<td class="oddcol-l" tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Name&nbsp;</td>
						<td class="oddcol"   tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Delete&nbsp;</td>
					</tr>
				
					<script>resetRows();</script>
					%loop unusedEntries%
						<tr>
							<script>writeTD('rowdata-l')</script>%value%
							</td>
							<script>writeTD('rowdata-l');;swapRows();</script>
								<a href="encryptedValues.dsp?action=clearValue&internalKey=%value unusedEntries%" title="Remove value from Passman">
									<IMG SRC="/WmRoot/icons/delete.gif" border="0" height=13 width=13>
								</a>
							</td>
						</tr>
					%endloop%
				</table>
			%endifvar%
			
			%ifvar pkgDisabledEntries%
				<table class=tableView >
					<tr>
						<td class="heading" colspan=2>Handles from Disabled Packages</td>
					</tr>
					<tr class="subheading2">
						<td class="oddcol-l" tdclass="rowdata-l" sortable="true" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Name&nbsp;</td>
						<td class="oddcol"   tdclass="rowdata-l" sortable="false" type="CaseInsensitiveString" style="cursor: hand;"               >&nbsp;Delete&nbsp;</td>
					</tr>
				
					<script>resetRows();</script>
					%loop pkgDisabledEntries%
						<tr>
							<script>writeTD('rowdata-l')</script>%value%
							</td>
							<script>writeTD('rowdata-l');;swapRows();</script>
								<a href="encryptedValues.dsp?action=clearValue&internalKey=%value pkgDisabledEntries%" title="Remove value from Passman">
									<IMG SRC="/WmRoot/icons/delete.gif" border="0" height=13 width=13>
								</a>
							</td>
						</tr>
					%endloop%
				</table>
			%endifvar%
		</table>
		<table width=100%>
			<tr>
				<td>
					<img src="/WmRoot/images/blank.gif" height=10 width=10>
				</td>
			</tr>
			<tr>
				<td colspan=5>
					It is possible for encrypted values from the main list to also show up as unreferenced 
					or from disabled packages. This may seem redundant or even contradicting,
					but it provides the maximum amount of transparancy.
				</td>
			</tr>
		</table>
	</body> 
</html> 
