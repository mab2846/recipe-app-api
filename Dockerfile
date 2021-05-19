FROM python:3.7-alpine
MAINTAINER TDD Example

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app
#creamos usuario que se utilizara solo para ejecutar aplicaciones
#se usara simplemente para ejecutar nuestros procesos desde nuestro proyecto
#se realiza por razones de seguridad, esto limitara el alcance que tendria un atacante.XD
RUN adduser -D user
USER user
