FROM python:3.12-alpine

WORKDIR /app
COPY . .

RUN apk add --no-cache build-base libmagic wget
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install -e .

ENTRYPOINT ["python", "article_dataset_builder/harvest.py"]
CMD ["--grobid", "--diagnostic", "--dois", "test/dois.txt"]