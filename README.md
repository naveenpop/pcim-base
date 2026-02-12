Download driver: [Only for non prod - for prod we need to get it from SAP with business account]

     https://maven.colorcoding.org/#browse/browse:maven-public:com%2Fsap%2Fjconnect%2Fjconn4%2F16.0.3%2Fjconn4-16.0.3.jar

install driver:

    mvn install:install-file "-Dfile=C:/Users/270802/Downloads/jconn4-16.0.3.jar" "-DgroupId=com.sap.jconnect"    "-DartifactId=jconn4"   "-Dversion=16.0.3"   "-Dpackaging=jar"

build:

    mvn clean package

Deploy:

    C:\code\pcim-base\target>cp sybase-crud-1.0.war C:\tools\apache-tomcat-10.1.52\webapps\

Sybase Image:

    podman run -d -t -p 5000:5000 --name sybase-db datagrip/sybase:16.0

DB logs:

    podman logs sybase-db

Test DB:

    =============== SYBASE STARTED ==========================
    SYBASE_USER: tester
    SYBASE_PASSWORD: guest1234
    SYBASE_DB: testdb

sh to db:

    podman exec -it sybase-db /bin/bash

find server names:

    podman exec -it sybase-db grep "^[^#]" /opt/sybase/interfaces

connect isql:

    podman exec -it -e SYBASE=/opt/sybase sybase-db /opt/sybase/OCS-16_0/bin/isql -Utester -Pguest1234 -SMYSYBASE

create table:

    CREATE TABLE users (id INT IDENTITY PRIMARY KEY,  name VARCHAR(50),  email VARCHAR(50))
    GO

insert entry:

    INSERT INTO users (id, name, email) VALUES (1, 'John Doe', 'john@example.com')
    GO

select:

    SELECT * FROM users
    GO
