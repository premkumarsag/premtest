These are made available not
only to the loading package but also a virtual package "GLOBAL" (available in "Show Value", too). 
Values from this virtual package can be used
by all other packages. This can happen by either using a silent fall-back, i.e. if the key is not defined
in the regular package, WxConfig will try to find it from GLOBAL. Or one can explicitly set the parameter "wxConfigPkgName"
to "GLOBAL". With the "silent fall-back" one can also implement a strategy to have global defaults, which are
overriden by packages on a case by case-basis.