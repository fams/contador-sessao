FROM ubuntu:16.04 AS build
LABEL mantainer=fams@linuxplace.com.br
ADD /contador/requirements.txt /app/
WORKDIR /app
RUN apt-get update -y && \
 apt-get install --no-install-recommends python3 -y && \
 apt-get install -y  python3-pip python3-dev build-essential python3-virtualenv virtualenv
RUN cd /app && \
  virtualenv --python=python3 /app/venv &&  \
  /app/venv/bin/pip install -r requirements.txt

FROM ubuntu:16.04 AS production
ENV REDIS_HOST redis
ENV REDIR_PORT 6379

COPY --from=build /app/venv /app/venv
RUN apt-get update -y && \
 apt-get --no-install-recommends -y install python3 libexpat1
COPY /contador /app/
ADD /runapp.sh /app/
ENTRYPOINT ["/app/runapp.sh"]
WORKDIR /app/
CMD ["app.py"]

EXPOSE 5000
