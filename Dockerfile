FROM python:3.6-slim
RUN apt-get install -y curl 
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
COPY . /python-test-calculator
WORKDIR /python-test-calculator
RUN pip freeze > requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
cmd cd reports 
#RUN ["pytest", "-v", "--junitxml=reports/result.xml"]
RUN apt-get update
RUN apt-get -y install vim
RUN touch result.xml
RUN docker cp $CONTAINER_NAME:/python-test-calculator/reports/result.xml reports/
#cmd :wq!
#RUN :wq!
CMD ["python", "-m", "pytest" "--junitxml=reports/result.xml"]
CMD tail -f /dev/null
