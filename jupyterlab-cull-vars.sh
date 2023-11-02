#!/bin/bash

echo "c.MappingKernelManager.cull_busy = ${CULL_BUSY}" >> /home/jovyan/.jupyter/jupyter_notebook_config.py && \
        echo "c.MappingKernelManager.cull_connected = ${CULL_CONNECTED}" >> /home/jovyan/.jupyter/jupyter_notebook_config.py && \
        echo "c.MappingKernelManager.cull_idle_timeout = ${CULL_IDLE_TIMEOUT}" >> /home/jovyan/.jupyter/jupyter_notebook_config.py && \
        echo "c.MappingKernelManager.cull_interval = ${CULL_INTERVAL}" >> /home/jovyan/.jupyter/jupyter_notebook_config.py && \
	jupyter lab --NotebookApp.token=${JUPYTER_TOKEN}
