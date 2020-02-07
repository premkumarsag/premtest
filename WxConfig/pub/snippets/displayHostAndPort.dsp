%invoke wx.config.impl.util.system:getPrimaryPort%
			%onerror%
				%include /snippets/error.dsp%
		%endinvoke%
		
		%invoke wx.config.impl.util.system:getHostname%
			%onerror%
				%include /snippets/error.dsp%
		%endinvoke%
		
		
Current System: 		
Hostname = %value hostname% ;
Primary Port = %value port%