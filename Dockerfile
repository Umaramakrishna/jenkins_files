FROM maven AS build
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
COPY . .
RUN mvn clean install

FROM tomcat
WORKDIR webapps
COPY --from=build /opt/tomcat/target/*.war ./
RUN rm -rf ROOT && mv *.war ROOT.war
EXPOSE 8080
