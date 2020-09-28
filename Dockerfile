FROM ubuntu:18.04
RUN apt update
RUN apt install default-jdk -y
RUN apt install tomcat8 -y
RUN apt install maven -y
RUN apt install git -y
EXPOSE 8080
RUN mkdir /home/sampleTest
RUN cd /home/sampleTest
RUN ls -a
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN ls -a
RUN cd /home/sampleTest/boxfuse-sample-java-war-hello
RUN mvn package
RUN cd /home/sampleTest/boxfuse-sample-java-war-hello/target
RUN cp hello-1.0.war /var/lib/tomcat8/webapps/
CMD ["catalina.sh", "run"]