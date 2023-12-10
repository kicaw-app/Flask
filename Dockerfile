FROM python:3.10-slim

ENV PYTHONBUFFERED True

ENV APP_HOME /app

WORKDIR $APP_HOME

COPY . ./

COPY requirement.txt requirement.txt

RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r requirement.txt

ENV PORT 8080

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 app:app
