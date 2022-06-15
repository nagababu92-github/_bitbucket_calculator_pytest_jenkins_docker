FROM python:3.6-slim
COPY . /python-test-calculator
WORKDIR /python-test-calculator
RUN pip freeze > requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
#RUN ["pytest", "-v", "--junitxml=reports/result.xml"]
RUN apt-get update
RUN apt-get -y install vim
RUN vi result.xml
cmd :wq!
#RUN :wq!
CMD ["python", "-m", "pytest" "--junitxml=reports/result.xml"]
CMD tail -f /dev/null
