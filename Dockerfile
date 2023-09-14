FROM p4irin/sipp:latest
LABEL description="Python, pysipp, and SIPp Docker image"
LABEL pysipp-version="0.1.0"
LABEL python-version="3.10"
LABEL pysipp-github-url="https://github.com/p4irin/pysipp"
LABEL pysipp-dockerhub-url="https://hub.docker.com/r/p4irin/pysipp"
LABEL maintainer="https://github.com/p4irin"
LABEL author = "https://github.com/p4irin"
RUN mkdir tests
ENV PATH=$PATH:/tests
WORKDIR /tests
COPY requirements.txt .
RUN apt-get update && apt-get install -y python3.10-full python3-pip && \
      python3 -m pip install -r requirements.txt && \
      rm requirements.txt && python3 -m pip cache purge && \
      apt-get purge -y python3-pip && apt-get autoremove -y && apt-get clean -y
CMD ["python3"]
