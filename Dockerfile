FROM eclipse-temurin:11-jdk

# Set the working directory in the container
# Set the working directory inside the container
WORKDIR /app

# Copy the Java source code into the container
COPY src/main/java/HelloWorld.java /app/

# Compile the Java source code
RUN javac HelloWorld.java

# Specify the command to run the application
CMD ["java", "HelloWorld"]

