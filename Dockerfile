FROM python:3.9.19-alpine3.20
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY src src
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=30s --start-period=30s --retries=5 CMD curl -f http://localhost/health || exit 1
ENTRYPOINT [ "python", "./src/app.py" ]
