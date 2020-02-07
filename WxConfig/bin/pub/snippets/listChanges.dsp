<table width="100%" class="tableView">
<tr >
	%ifvar containsIssueLinks equals('true')%
		<td class="heading" colspan=5>
	%else%
		<td class="heading" colspan=4>
	%endifvar%
	List of Changes</td>
</tr>
<tr class="subheading2">
	<td>&nbsp;Date&nbsp;</td>
	<td>&nbsp;Type&nbsp;</td>
	<td>&nbsp;Name&nbsp;</td>
	<td>&nbsp;Description&nbsp;</td>
	%ifvar containsIssueLinks equals('true')%
		<td>&nbsp;Issue&nbsp;</td>
	%endifvar%
</tr>
<script>resetRows();</script>
	%loop changeList/change%
		<tr>
			<script>writeTD('row-l');</script>
				%value @date%
			</td>
			<script>writeTD('row-l');</script>
				%value @type%
			</td>
			<script>writeTD('rowdata-l');</script>
				%value @name%
			</td>
			<script>writeTD('row-l');</script>
				%value *body%
			</td>
			%ifvar @issueId%
				<script>writeTD('row-l');</script>
					<a href="%value @issueUrl%" target="_blank">%value @issueId%</a>
				</td>
			%endifvar%
		</tr>
		<script>swapRows();</script>
	%endloop%
</table>