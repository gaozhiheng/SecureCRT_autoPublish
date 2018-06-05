E:
cd E:\Work\应用开发团\2015-网运大数据平台\NOCE
call mvn clean >>E:\deplo\NOCE\log_deplo.txt 2>&1
call mvn install >>E:\deplo\NOCE\log_deplo.txt 2>&1
cd E:\deplo\NOCE
copy /Y E:\Work\应用开发团\2015-网运大数据平台\NOCE\target\NOCE.war E:\deplo\NOCE\NOCE.war >>E:\deplo\NOCE\log_deplo.txt 2>&1
