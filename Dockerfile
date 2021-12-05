# Image de base 
FROM alpine:3.8

# Installation de Python 3 et pip3
RUN apk add --no-cache --virtual .build-deps g++ python3-dev libffi-dev openssl-dev && \
    apk add --no-cache --update python3 && \
    pip3 install --upgrade pip setuptools 

# Mise à jour de pip3
RUN pip3 install --upgrade pip 

RUN mkdir /app 
WORKDIR /app 
#Copie des fichiers de l'application
COPY requirements.txt /app
COPY app.py /app 
RUN pip3 install --no-cache-dir -r requirements.txt 

# On ouvre et expose le port 80 
EXPOSE 80 

# Lancement de l'API 
CMD ["flask" , "run" , "-h" , "0.0.0.0" , "-p" , "80"]

