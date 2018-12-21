FROM maven:3.6.0-jdk-8
COPY ./pom.xml /usr/src/mymaven/
WORKDIR /usr/src/mymaven
RUN mvn dependency:go-offline -B --fail-never

COPY . /usr/src/mymaven
# WORKDIR /usr/src/mymaven

RUN mvn clean package -Dmaven.test.skip=true 

# ENTRYPOINT [ "mvn", "clean", "package", "-Dmaven.test.skip=true" ]
ENTRYPOINT [ "java", "-jar", "./target/crud-springboot-dynamodb-0.0.1.jar" ]

