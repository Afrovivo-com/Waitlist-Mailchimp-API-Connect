#Use an official Python runtime as parent image
FROM python:3.10.0

# # Use an official Python runtime as a parent image
# FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install dependencies
RUN pip install --upgrade pip
RUN pip install poetry

# Set the working directory
WORKDIR /app

# Copy the necessary files
COPY pyproject.toml poetry.lock /app/

# Install project dependencies
RUN poetry install --no-root

# Copy the rest of the application code
COPY . /app/

# Command to run the application
CMD ["poetry", "run", "python", "app.py"]


# #Set environment variables for Python to not buffer output
# ENV PYTHONBUFFERED 1

# #Set the working directory in the container
# WORKDIR /app

# #Copy the current directory contents into the container at /app
# COPY . /app/

# #Install poetry and use poetry to install all the dependencies in the poetry.lock file
# RUN pip install poetry
# RUN poetry install

# #Expose the port that Django runs on
# EXPOSE 8000

# #Run Django's development server
# CMD CMD ["gunicorn", "--bind", "0.0.0.0:8000", "waitlist.wsgi:application"]