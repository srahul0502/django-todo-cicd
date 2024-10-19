FROM python:3

# Set the working directory
WORKDIR /data

# Install distutils
RUN apt-get update && apt-get install -y python3-distutils

# Install Django
RUN pip install django==5.1.2

# Copy the current directory contents into the container at /data
COPY . .

# Run migrations
RUN python manage.py migrate

# Expose port 8000
EXPOSE 8000

# Command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
