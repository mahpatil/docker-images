FROM alpine/git as source
WORKDIR /ldapcherry
RUN git clone https://github.com/kakwa/ldapcherry
RUN ls -la /ldapcherry/*

FROM python:2.7-alpine3.8 as build
COPY --from=source /ldapcherry/ /
WORKDIR /ldapcherry
RUN apk add build-base
RUN apk add openldap-dev
RUN export SYSCONFDIR=/etc
RUN export DATAROOTDIR=/usr/share/
RUN python setup.py install
CMD ["ldapcherryd", "-c", "/etc/ldapcherry/ldapcherry.ini", "-D"]
