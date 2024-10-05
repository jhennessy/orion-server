
FROM python:3.11-slim

ADD orion /opt/orion-server/orion
ADD config.json /etc/orion/config.json
ADD requirements.txt /opt/orion-server

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends gcc python3-dev libssl-dev && \
  apt-get install -y --no-install-recommends default-libmysqlclient-dev pkg-config


ENV PYTHONPATH=/opt/orion-server

RUN pip install -r /opt/orion-server/requirements.txt

CMD ["python",  "/opt/orion-server/orion/server.py"]