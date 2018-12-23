FROM python:stretch
ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
# docker build -t flbrew .
# docker run --name fldck -d -p 80:80 flbrew