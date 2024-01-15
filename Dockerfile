FROM python:3.11-slim

WORKDIR /app

RUN apt update -y

COPY requirements.txt  .

RUN pip install --no-cache-dir -r requirements.txt

ARG API_KEY=default_api_key
ENV API_KEY=$API_KEY

COPY . .


RUN pip install --upgrade pip && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /root/.cache

EXPOSE 4000

CMD ["python", "run.py"]

