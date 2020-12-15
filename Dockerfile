
From ubuntu
MAINTAINER "Ian Stewart"
RUN apt-get update
RUN apt-get install -y git

RUN apt update && apt install python3-pip -y


RUN mkdir spacyrec

COPY  external-recommender-spacy spacyrec
WORKDIR spacyrec
RUN ls

RUN python3 -m pip install git+https://github.com/dkpro/dkpro-cassis
RUN pip3 install spacy
RUN pip3 install flask
RUN pip3 install diskcache
RUN python3 -m spacy download en 
#RUN python3 app.py en

#RUN python3 from ariadne.contrib.spacy import SpacyNerClassifier, SpacyPosClassifier
#RUN pyhton3 from ariadne.server import Server
#  
#RUN python3 server = Server()
#RUN python3 server.add_classifier("spacy_ner", SpacyNerClassifier("en"))
#RUN python3 server.add_classifier("spacy_pos", SpacyPosClassifier("en"))

#RUN python3 server.start()
#RUN gunicorn -w 4 -b 127.0.0.1:5000 wsgi:server._app
CMD ["python3", "app.py"]
