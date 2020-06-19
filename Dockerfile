# The base image we want to inherit from
FROM python:3.7
ENV PYTHONUNBUFFERED 1
ARG ENV=dev

RUN mkdir /app
WORKDIR /app
ADD ./requirements /app/requirements

# Install the pip requirements file depending on 
# the $ENV build arg passed in when starting build.
RUN pip install requirements.txt

# Copy the rest of our application.
COPY . /app/

# Expose the application on port 8000
EXPOSE 8000
# Run test server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]