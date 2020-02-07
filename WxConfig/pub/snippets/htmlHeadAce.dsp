<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<style type="text/css" media="screen">
	.ace_editor {
		position: relative !important;
		border: 1px solid lightgray;
		margin: auto;
		height: 400px;
		width: 90%;
	}
  
    .ace_status-indicator {
        color: black;
        position: left;
        right: 20px;
        /* border-left: 1px solid; */
    }
</style>
<script src="ace/ace.js" type="text/javascript" charset="utf-8"></script>
<script src="ace/ext-statusbar.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	var editor;
	window.onload = function() {
		editor = ace.edit("editor");
		editor.setTheme("ace/theme/eclipse");
		var StatusBar = ace.require("ace/ext/statusbar").StatusBar;
		var statusBar = new StatusBar(editor, document.getElementById("statusBar"));
		
		%ifvar type%
			%ifvar type equals('PROPERTIES')%
				editor.getSession().setMode("ace/mode/properties");
			%else%
				editor.getSession().setMode("ace/mode/xml");
			%endifvar%
		%else%
			editor.getSession().setMode("ace/mode/xml");
		%endifvar%
	}
	
	function putEditorContentToFileContentVariable() {
		var form = document.saveForm;
		var content = form.fileContent;
		content.value = editor.getSession().getValue();
	};
	
	function setReadOnly() {
		editor = ace.edit("editor");
		editor.setReadOnly(true);
		%ifvar type%
			%ifvar type equals('PROPERTIES')%
				editor.getSession().setMode("ace/mode/properties");
			%else%
				editor.getSession().setMode("ace/mode/xml");
			%endifvar%
		%else%
			editor.getSession().setMode("ace/mode/xml");
		%endifvar%
	};
</script>