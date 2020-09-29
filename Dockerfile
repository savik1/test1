FROM tomcat
EXPOSE 8080
RUN apt update
RUN apt install maven git -y
RUN mkdir /home/sampleTest
WORKDIR /home/sampleTest
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /home/sampleTest/boxfuse-sample-java-war-hello
RUN mvn package
RUN cp ./target/hello-1.0.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]