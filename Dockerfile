FROM python:3.11-slim

WORKDIR /app

RUN apt update -y

COPY requirements.txt  .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .


RUN pip install --upgrade pip 

RUN apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /root/.cache

EXPOSE 4000

CMD ["python", "run.py"]

