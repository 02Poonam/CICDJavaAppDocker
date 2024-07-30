FROM eclipse-temurin:11-jdk

# Set the working directory in the container
WORKDIR /app

COPY . /app

RUN javac Main.java

CMD [ "java","Main" ]
