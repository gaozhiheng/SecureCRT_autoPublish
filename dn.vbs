#$language = "VBScript"
#$interface = "1.0"




' This automatically generated script may need to be
' edited in order to work correctly.

Sub Main
  Set g_shell = CreateObject("WScript.Shell")
 g_shell.Run "e:/deplo/NOCE/ngitcmd.bat", 5 , TRUE 'get updated codes from git
 g_shell.Run "e:/deplo/NOCE/ncpfiles.bat", 5 , TRUE 'copy files to porject dir
 g_shell.Run "e:/deplo/NOCE/ngulp.bat", 5 , TRUE 'update version hash code for js and css files
 g_shell.Run "e:/deplo/NOCE/nmvncmd.bat", 5 , TRUE 'compile and built and get the targeted war file
  
  set objTab=crt.GetActiveTab

'shutdown tommcat  
	objTab.Screen.Send "cd " & chr(126) & "/NOCE" & chr(13)
	objTab.Screen.WaitForString "[root@web1 NOCE]#"
	objTab.Screen.Send "/opt/tomcat8080/bin/shutdown.sh" & chr(13)
'	objTab.Screen.WaitForString "[root@web1 NOCE]#"

'Create an SFTP tab associated with the existing tab and then upload NOCE.war 
  set objSFTPTab=objTab.ConnectSftp
    ' cd "/gaozhh/132.96.171.45 (noceweb1)/root/root/NOCE"
	objSFTPTab.Screen.Send "cd " & chr(34) & "/gaozhh/132.96.171.45 (noceweb1)/root/root/NOCE" & chr(34) & chr(13)
	objSFTPTab.Screen.WaitForString "sftp> "
    ' put e:/deplo/NOCE/NOCE.war
	objSFTPTab.Screen.Send "put e:/deplo/NOCE/NOCE.war" & chr(13)
	crt.Sleep 1000 'wait for 1 second, otherwise the following WaitForString has no effect
	objSFTPTab.Screen.WaitForString "sftp> "

'replace NOCE.war and start tommat
  objTab.activate()
  ' crt.Sleep 120000
	objTab.Screen.Send "rm -rf /opt/tomcat8080/webapps/NOCE" & chr(13)
	objTab.Screen.WaitForString "[root@web1 NOCE]#"
	objTab.Screen.Send "rm -f /opt/tomcat8080/webapps/NOCE.war" & chr(13)
	objTab.Screen.WaitForString "[root@web1 NOCE]#"
	objTab.Screen.Send "rm -rf /opt/tomcat8080/work/Catalina" & chr(13)
	objTab.Screen.WaitForString "[root@web1 NOCE]#"
	objTab.Screen.Send "cp  " & chr(126) & "/NOCE/NOCE.war /opt/tomcat8080/webapps" & chr(13)
	objTab.Screen.WaitForString "[root@web1 NOCE]#"
	objTab.Screen.Send "/opt/tomcat8080/bin/startup.sh" & chr(13)
	objTab.Screen.WaitForString "[root@web1 NOCE]#"
	objTab.Screen.Send "./t8log.sh" & chr(13)	

    MsgBox "Mission completed!"

	End Sub
