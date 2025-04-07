# Use an official Python image
FROM python:3.10-slim

# Set work directory
WORKDIR /flask_app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app files
COPY . .

# Expose port (Gunicorn default)
EXPOSE 8000

# Start the Flask app with Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:8000", "app:app"]

