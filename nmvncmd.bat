E:
cd E:\Work\Ӧ�ÿ�����\2015-���˴�����ƽ̨\NOCE
call mvn clean >>E:\deplo\NOCE\log_deplo.txt 2>&1
call mvn install >>E:\deplo\NOCE\log_deplo.txt 2>&1
cd E:\deplo\NOCE
copy /Y E:\Work\Ӧ�ÿ�����\2015-���˴�����ƽ̨\NOCE\target\NOCE.war E:\deplo\NOCE\NOCE.war >>E:\deplo\NOCE\log_deplo.txt 2>&1
