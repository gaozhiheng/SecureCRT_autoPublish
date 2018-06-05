# SecureCRT_autoPublish
VBScript for SecureCRT, excutes a serial of tasks in tomcat web project deploment

Stripts in file dn.vbs, executing after connect to the linux tomcat server.
Tasks include:
1.execute ngitcmd.bat, which gets updated codes from git
2.execute ncpfiles.bat, which copys files to porject directory
3.execute ngulp.bat, which updates version hash code for js and css files
4.execute nmvncmd.bat", which compiles and builts and gets the targeted war file(NOCE.war)
5.shutdown tomcat
6.put NOCE.war from local to server
7.remove temp directories and replace NOCE.war in tomcat
8.startup tomcat

by gaozhiheng, 20180605

