FROM zenika/alpine-chrome:73

USER root
RUN apk add --update git python2 py-pip \
  && rm -rf /var/cache/apk/*

RUN pip install --user requests \
  && pip install --user selenium

WORKDIR /
RUN git clone https://github.com/inAudible-NG/audible-activator.git

WORKDIR /chromedriver
ARG CHROMEDRIVER_ZIP=chromedriver_linux64.zip
RUN wget https://chromedriver.storage.googleapis.com/73.0.3683.68/$CHROMEDRIVER_ZIP \
  && unzip $CHROMEDRIVER_ZIP \
  && rm -rf $CHROMEDRIVER_ZIP \
  && chmod +x ./chromedriver
ENV PATH $PATH:/chromedriver

WORKDIR /audible-activator
COPY ./entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]