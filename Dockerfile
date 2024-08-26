FROM python:3.9-alpine

WORKDIR /usr/src/app

COPY build/web /usr/src/app

EXPOSE 8080

CMD ["python", "-m", "http.server", "8080"]
