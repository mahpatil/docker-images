FROM alpine/git as source
WORKDIR /ldapcherry
RUN git clone https://github.com/kakwa/ldapcherry
RUN ls -la /ldapcherry/*

FROM python:2.7 as build
COPY --from=source /ldapcherry/ /
WORKDIR /ldapcherry
RUN ls -la .
RUN pip install -e .
RUN pip install passlib
RUN export SYSCONFDIR=/etc
RUN export DATAROOTDIR=/usr/share/
RUN python setup.py install

FROM python:2.7 as run
WORKDIR /ldapcherry
RUN ls -la .
COPY --from=source /ldapcherry/ /
RUN export SYSCONFDIR=/etc
RUN export DATAROOTDIR=/usr/share/
RUN python setup.py
CMD ["ldapcherryd", "-c", "/etc/ldapcherry/ldapcherry.ini", "-D"]
