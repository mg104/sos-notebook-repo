FROM vatlab/sos-notebook:latest

LABEL maintainer="Madhur Gupta <madhurgupta104@gmail.com>"

COPY ./.Rprofile ~/.Rprofile

COPY ./custom-r-functions.R ~/work/my-scripts/custom-r-functions.R

RUN mamba install -c conda-forge quandl


