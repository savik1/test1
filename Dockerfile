FROM ubuntu:18.04
RUN apt update
RUN apt install default-jdk tomcat8 maven git -y
EXPOSE 8080
RUN mkdir /home/sampleTest
WORKDIR /home/sampleTest
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /home/sampleTest/boxfuse-sample-java-war-hello
RUN mvn package
# RUN cp ./target/hello-1.0.war /var/lib/tomcat8/webapps/
RUN service tomcat8 status
CMD ["/usr/share/tomcat8/bin/catalina.sh", "run"]