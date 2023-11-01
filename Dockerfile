FROM vatlab/sos-notebook:latest

LABEL maintainer="Madhur Gupta <madhurgupta104@gmail.com>"

COPY ./.Rprofile /home/jovyan/.Rprofile

COPY ./custom-r-functions.R /home/jovyan/my-scripts/custom-r-functions.R

USER root

RUN mamba install -c conda-forge quandl -y

USER jovyan

