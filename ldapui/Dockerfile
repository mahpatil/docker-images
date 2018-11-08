FROM jamesdbloom/docker-java7-maven as build
WORKDIR /local/git
RUN git clone https://github.com/chrisjleu/ldap-ui.git
WORKDIR /local/git/ldap-ui
RUN ls -l *
RUN mvn install "-e"