FROM ubuntu:16.04
LABEL mantainer=fams@linuxplace.com.br
COPY /contador /app
WORKDIR /app
RUN apt-get update -y && \
 apt-get install --no-install-recommends python3 -y && \
 apt-get install -y  python3-pip python3-dev build-essential && \
 cd /app && pip3 install -r requirements.txt

ENV REDIS_HOST redis
ENV REDIR_PORT 6379
ENTRYPOINT ["python3"]
CMD ["app.py"]
EXPOSE 5000
