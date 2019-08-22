For creating the database:
Assuming you have MySql installed...
Run the SQL script reservation_buid.sql file in MySql to establish the database.
There is also a test_data.sql script with some initial data to run.

For adding the server:
Download glassfish 5.0
In Netbeans->Services->Servers 
Remove old server if exists 
then right-click AddServer and choose glassfish5 file as instalation location.
Make sure the Domain is a full absolute path.

Adding the project:
In netbeans File->Import Project->From zip upload ReservationApp.zip
In ReservationApp->Source Packages->newuserbean->ShowBean->IMAGE_PATH to change to your path of netbeans.

Put Connecctor/J on the glassfish path.
Copy the jar file (ReservationApp\web\lib\mysql-connector-java-8.0.12.jar) from the project folder
Paste it into glassfish-5.0\glassfish5\glassfish\lib folder (folder that contains jndi-properties.jar).

For Adding Connection pool and Data Source:
In Netbeans->Services->Servers>GlassFish Server, right-click start.
Right-click and choose 'View Domain Admin Console'.
Common Tasks->Resources->JDBC->JDBC Connection Pools->New
Choose a pool name.
Resource type: javax.sql.ConnectionPoolDataSource.
Datasource Classname: com.mysql.cj.jdbc.MysqlDataSource.
Make sure only pooling is 'Enabled' in the Advanced options tab.
In Additional Properties Add Property for the following:
	User: your database username.
	Password: your database password.
	URL: jdbc:mysql://localhost:3306/reservation_db?zeroDateTimeBehavior=CONVERT_TO_NULL&useSSL=false&rewriteBatchedStatements=true
Common Tasks->Resources->JDBC->JDBC Resources->New.
Set JNDI Name to jdbc/myDatasource and choose the Pool Name you created and click ok.

Right-click the project name->run		

Updating the database USER & PASS in glassfish-resources.xml.


Setup resource and pool permenantly in Glassfish (Optional)
Services->Servers->Glassfish->View Domain Admin Console.
Resources->Add Resource.
Choose file 'glassfish-resources.xml (In WEB-INF file of the project).
click OK.
Test if the connection works Common Tasks->Resources->JDBC ->JDBC Connection Pools->ConnectionPool (or other name).
Test if ping succesfull.

	