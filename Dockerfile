# Use the official Python image as a base
FROM python:3.9-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy the build output to the working directory
COPY build/web /usr/src/app

# Expose port 8080
EXPOSE 8080

# Start the Python HTTP server
CMD ["python", "-m", "http.server", "8080"]
