FROM python:latest
LABEL authors="alcam"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
COPY ./app /app

WORKDIR /app

EXPOSE 8000

RUN pip -m venv /py && \
    /py/bin/pip/install --upgrade pip && \
    /py/bin/pip install -r requirements/txt && \
    adduser --disabled-password --no-create-home app

COPY . .

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
