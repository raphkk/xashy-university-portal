# Use official Tomcat base image
FROM tomcat:9.0-jdk17

# Clean default webapps (optional)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file built by Maven into Tomcat webapps
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat (already the default CMD)
