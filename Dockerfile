FROM vatlab/sos-notebook:latest

LABEL maintainer="Madhur Gupta <madhurgupta104@gmail.com>"

ENV JUPYTER_TOKEN=randomtoken

ENV CULL_IDLE_TIMEOUT=1800

ENV CULL_INTERVAL=10

ENV CULL_CONNECTED=True

ENV CULL_BUSY=False

COPY ./.Rprofile /home/jovyan/.Rprofile

COPY ./custom-r-functions.R /home/jovyan/my-scripts/custom-r-functions.R

COPY jupyterlab-cull-vars.sh /jupyterlab-cull-vars.sh

USER root

RUN mamba install -c conda-forge \
	 r-quandl=2.11.0 \
	 yfinance=0.2.31 \
	 requests=2.31.0 \
	 beautifulsoup4=4.12.2 \
	 scrapy=2.11.0 \
	 selenium=4.15.1 \
	 playwright=1.39.0 \
	 lxml=4.9.3 \
	 urllib3=2.0.7 \
	 mechanicalsoup=1.2.0 \
	 elementpath=4.1.5 \
	 chromium -y 

RUN pip install jupyterlab-sos==0.10.1

RUN apt-get install procps

RUN chmod +x /jupyterlab-cull-vars.sh

ENTRYPOINT ["/jupyterlab-cull-vars.sh"]

USER jovyan

