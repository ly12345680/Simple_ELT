FROM python:3.8-slim

# Install PostgreSQL command-line tools
RUN apt-get update && apt-get install -y postgresql-client cron

# Copy the ELT script 
COPY start.sh /app/start.sh
COPY elt_script.py .

WORKDIR /app

RUN echo "*/5 * * * * /usr/bin/python3 /app/elt_script.py" | crontab -

# Set the default command to run the ELT script
CMD ["python", "elt_script.py"]