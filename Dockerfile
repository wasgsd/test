FROM lballabio/quantlib-python
MAINTAINER Luigi Ballabio <luigi.ballabio@gmail.com>
LABEL Description="An IPython notebook server with the QuantLib Python module available"

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y ipython-notebook python-matplotlib \
                                                      python-pandas python-seaborn \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 8888

RUN mkdir /notebooks
VOLUME /notebooks
# COPY *.ipynb /notebooks/

CMD ipython notebook --no-browser --ip=0.0.0.0 --port=8888 --notebook-dir=/notebooks
