from ubuntu:20.04

# Get add-apt-repository
RUN apt update
RUN apt install -y software-properties-common

# Add PPA for Racket
RUN add-apt-repository ppa:plt/racket

## Install dependencies
# apt dependencies
RUN apt install -y      \
          python3-pip   \
          racket        \
          libzmq3-dev
# pip dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
# raco (Racket) dependencies
# First, fix https://github.com/racket/racket/issues/2691
RUN raco setup --doc-index --force-user-docs

# If we want to use iRacket/Jupyter, we'll need the following:
# Connect iRacket kernel to Jupyter Notebook.
#RUN raco pkg install --auto iracket
#RUN raco iracket install
# Add "trusted" Racket kernel.
#WORKDIR /root/.local/share/jupyter/kernels
#RUN cp -r racket racket-trusted
#RUN sed -i s/\"--\"/\"--\",\"-t\"/ racket-trusted/kernel.json
#RUN sed -i s/\"display_name\":\"Racket\"/\"display_name\":\"Racket \(trusted\)\"/ racket-trusted/kernel.json

RUN raco pkg install --deps search-auto --batch rosette

WORKDIR /root/
ADD ./racket ./racket
