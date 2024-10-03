# Dockerfile for book_catalog microservice

# Use the official Python image from DockerHub as the base image
FROM python:3.10-slim

# Set the working directory inside the container to /app
WORKDIR /app

# Copy the requirements.txt file to the /app directory in the container
COPY book_catalog/requirements.txt .

# Install the dependencies specified in the requirements.txt file
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire current directory (book_catalog) to the /app directory inside the container
COPY ./book_catalog .

# Expose the port that FastAPI will use (usually 8000)
EXPOSE 8000

# Define the command to run FastAPI using uvicorn, specifying the app location and port
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]