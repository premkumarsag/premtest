//
// wx.js
// =====
//
//   webMethods Integration Server Javascript Client Library
//
//
// Import
// ======
//
//   Note: wx.js depends on jQuery for making ajax calls to Integration Server.
//         jQuery must be imported prior to wx.js
//
//
//   html page
//   ---------
//     <script type="text/javascript" src="lib/jquery-1.9.1.min.js"></script>
//     <script type="text/javascript" src="lib/wx.js"></script>
//
//
//   node.js
//   -------
//     $    = require('jquery');  // Needed for making ajax calls
//     btoa = require('btoa');    // Needed for base64 encoding
//     wx   = require('./wx.js'); // 
//   
//
// Invoking Services
// =================
// 
//   Invoke a service
//
//       wx.invoke("pub.flow:tracePipeline");
//
//
//   Invoke a service with pipeline input
//
//       wx.invoke("pub.flow:tracePipeline", { text: "hello world" } );
//
//
//   Invoke a service on a remote server
//
//       var context = wx.connect("http://host:port"); // Default credentials
//       var context = wx.connect("http://host:port", { user: "Administrator", password: "manage" });
//       context.invoke(service, pipeline);
//
//       Note: These examples require that CORS is configured on the servers involved:
//         watt.server.cors.allowedOrigins=*
//         watt.server.cors.enabled=true
//         watt.server.cors.supportedHeaders=accept, authorization, content-type
//         watt.server.cors.supportedMethods=GET,POST,PUT,DELETE,OPTIONS,HEAD
//         watt.server.cors.supportsCredentials=true
//
//
//   Handle successful invocation pipeline output
//
//       var result = wx.invoke(service, pipeline);
//       result.done(function(result)) {
//           console.log(result);
//       }
//
//       Note: The result object passed to the done function will be the service output pipeline
//       in JSON object format
// 
//
//   Handle failing invocation output
//
//       var result = wx.invoke(service, pipeline);
//       result.fail(function(result)) {
//           console.log(result.$errorDump);
//       }
//
//       Note: The result object passed to the fail function will have the following structure:
//
//       $error: "pub.flow:tracePipeline2"
//       $errorDump: "com.wm.app.b2b.server.UnknownServiceException: pub.flow:tracePipeline2↵    at com.wm.app.b2b.server.HTTPInvokeHandler._process(HTTPInvokeHandler.java:94)↵ at com.wm.app.b2b.server.InvokeHandler.process(InvokeHandler.java:110)↵ at com.wm.app.b2b.server.HTTPDispatch.handleRequest(HTTPDispatch.java:173)↵ at com.wm.app.b2b.server.Dispatch.run(Dispatch.java:382)↵   at com.wm.util.pool.PooledThread.run(PooledThread.java:114)↵    at java.lang.Thread.run(Thread.java:680)↵"
//       $errorType: "com.wm.app.b2b.server.UnknownServiceException"
//       $errorInfo: Object
//           $details: null
//           $error: "pub.flow:tracePipeline2"
//           $errorDump: "com.wm.app.b2b.server.UnknownServiceException: pub.flow:tracePipeline2↵    at com.wm.app.b2b.server.HTTPInvokeHandler._process(HTTPInvokeHandler.java:94)↵ at com.wm.app.b2b.server.InvokeHandler.process(InvokeHandler.java:110)↵ at com.wm.app.b2b.server.HTTPDispatch.handleRequest(HTTPDispatch.java:173)↵ at com.wm.app.b2b.server.Dispatch.run(Dispatch.java:382)↵   at com.wm.util.pool.PooledThread.run(PooledThread.java:114)↵    at java.lang.Thread.run(Thread.java:680)↵"
//           $errorMsgId: null
//           $errorType: "com.wm.app.b2b.server.UnknownServiceException"
//           $localizedError: "pub.flow:tracePipeline2"
//           $time: "Tue Jun 16 18:32:20 CET 2013"
//           $user: "Administrator"
//
//
//   Handle end of invocation, for either success or failure
//
//       var result = wx.invoke(service, pipeline);
//       result.always(function(result)) {
//           console.log(result);
//       }
//
//       Note: The result object passed to the always function will have either the pipeline, or error object
// 
//
//
//   Concurrent Service Invocation
//
//       var invocation1 = context1.invoke(...);
//       var invocation2 = context2.invoke(...);
//       $.when(invocation1, invocation2)
//           .then(function(result1, result2) {
//               // Runs once only if all invocations have succeeded
//           })
//           .fail(function(result) {
//               // Runs once for first failing invocation
//           })
//
//

(function() {


    // ===================================================================
    // 
    // Constructor: Context
    //
    // Creates a connection context. Currently this is just the url and
    // connection credentials. In the future this function should 
    // establish a connection and set other metadata like session ID
    //
    // Params:
    // 
    //     url           Server URL in any of the following forms:
    //                      - localhost:5555
    //                      - http://localhost:5555
    //                      - https://localhost:5556
    //
    //     credentials   Credentials object with the following fields
    //                     user:     username (String)
    //                     password: password (String)
    //
    // ===================================================================
    var Context = function(url, credentials) {
        this.url = url;
        this.credentials = credentials || { user: "Administrator", password: "manage" };
    }


    // ===================================================================
    // 
    // Function: Context.invoke
    //
    // Invokes a service on this connection context. Invocation is done 
    // using jQuery.ajax(), and is returned to the caller as a jQuery
    // promise.
    //
    // Params:
    //     service:     NS name of the service (eg. "pub.flow:tracePipeline")
    //     pipeline:    pipeline as a javascript object
    //     ajax:        jQuery ajax param object to overide any options
    //
    // Returns:
    //     a jQuery promise object for the invocation
    //
    // ===================================================================
    Context.prototype.invoke = function(service, pipeline, ajax) {

        // Build URL
        // - If this.url is undefined, then url is relative "/invoke/...."
        // - If url is not prefixed with a protocol, then http:// is added
        var urlprefix = "";
        if (this.url) {
            if (this.url.indexOf("://") === -1) {
                urlprefix = "http://" + this.url;
            } else {
                urlprefix = this.url;
            }
        }
        var url = urlprefix + "/invoke/" + service.replace(":", "/");
        log("invoke() service url: " + url);

        // If pipeline is undefined, make it an empty object, or else the IS JSON
        // content handler will barf
        pipeline = pipeline || {};
        log("invoke() input pipeline: " + JSON.stringify(pipeline));        

        // Build jQuery.ajax default params
        var defaultParams = {
            async: true, // if async=false then node's XMLHttpRequest barfs
            type: "POST",
            url: url,
            contentType: "application/json",
            dataType: "json",
            data: JSON.stringify(pipeline),
        }

        // Conditionally add credentials to ajax params if they were provided
        // TODO this is here because username/password in the ajax params doesn't
        // seem to work int the case of CORS (resulting in Access Denied errors).
        // The following code will force the credentials to be in the HTTP request
        // even in the case of a CORS request to a separate server.
        if (this.credentials) {
            var user = this.credentials.user;
            var password = this.credentials.password;
            defaultParams.beforeSend = function(xhr) { 
                xhr.setRequestHeader("Authorization", "Basic " + btoa(user + ":" + password));
            }
        }
 
        // Create a jQuery Deferred object representing this invocation
        var deferred = $.Deferred(); 

        // Custom ajax params are merged with the generated ajax params
        // where the custom ajax params takes precedence
        var ajaxParams = defaultParams;
        $.extend(ajaxParams, ajax);
        log("invoke() ajax params: " + JSON.stringify(ajaxParams));
    

        // Invoke the ajax call, returning a deferred that we will use
        // to handle success/failure of the ajax request
        var ajax = $.ajax(ajaxParams);

        // If ajax call succeeds, return the output pipeline as the done object
        ajax.done(function(data) {
            log("invoke() output pipeline: " + JSON.stringify(data));
            deferred.resolve(data);
        })

        // If ajax call fails, parse the output response into an object and return it as
        // the fail object
        ajax.fail(function(jqxhr, errorText, three) {
            log("invoke() ERROR: " + JSON.stringify(jqxhr));
            deferred.reject(JSON.parse(jqxhr.responseText));
        })

        // Return only a promise of this invocation's deferred object
        return deferred.promise();
    }

    // Create global wx object with a default context
    var wx = new Context();

    // Add metadata to global wx object
    wx.title = "webMethods Javascript Client Library";
    wx.version = "1.0";
    wx.debug = false;


    // ===================================================================
    //
    // Function: wx.connect
    //
    // Create a connection context for a remote IS
    //
    // Params:
    //     url          host-port in the form "localhost:5555" or "https://localhost/"
    //     credentials  object { user, password }
    //
    // Returns:
    //     An new instance of Context, which can be used for making invocations
    //
    // ===================================================================
    wx.connect = function(url, credentials) {
        return new Context(url, credentials);
    }

    // Make into universal module, useful for both browser and node.js environment
    // If node.js
    if (typeof module !== 'undefined') {  
        wx.environment = "node.js";
        module.exports = wx;
    // Else => Browser
    } else {
        wx.environment = "browser"
        self.wx = wx;
    }

    // ===================================================================
    //
    // Function: log
    //
    // Logs a message to console.log() if debug is enabled
    //
    // ===================================================================
    var log = function(text) {
        if (wx.debug == true) { 
          console.log("wx.js: " + text);
        }
    }


})();
