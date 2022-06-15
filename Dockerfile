FROM python:3.6-slim
COPY . /python-test-calculator
WORKDIR /python-test-calculator
RUN pip freeze > requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
#RUN ["pytest", "-v", "--junitxml=reports/result.xml"]
RUN apt-get update
RUN apt-get install vim
RUN Y
RUN vi result.xml
RUN :wq!
CMD ["python", "-m", "pytest" "--junitxml=reports/result.xml"]
CMD tail -f /dev/null
