FROM python:3
LABEL mantainer=fams@linuxplace.com.br

WORKDIR /usr/src/app

COPY contador/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY contador/ /usr/src/app

ENV REDIS_HOST redis
ENV REDIR_PORT 6379
EXPOSE 5000
CMD [ "python", "./app.py" ]
