FROM python:3.8
RUN python -m pip install --upgrade pip
RUN python --version && pip --version

#ENV PYTHONUNBUFFERED 1

RUN mkdir app
#WORKDIR app
WORKDIR /app

ADD . /app
#RUN addgroup -S adifect-app && adduser -S adifect-app -G adifect-app
RUN pip install --no-cache-dir -r requirement.txt && \
        pip install gunicorn
        

#RUN python manage.py collectstatic

RUN chmod +x gunicorn.sh
EXPOSE 8000
ENTRYPOINT ["./gunicorn.sh"]
