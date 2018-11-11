FROM jamesdbloom/docker-java7-maven as build
WORKDIR /local/git
RUN git clone https://github.com/chrisjleu/ldap-ui.git
WORKDIR /local/git/ldap-ui
RUN mvn install "-e"
RUN ls -l *

FROM jetty:9.2-jre7 as run
COPY --from=build /local/git/ldap-ui/target/ldap-ui.war /var/lib/jetty/webapps/
USER jetty
EXPOSE 8080
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["java","-jar","/usr/local/jetty/start.jar", "url=$LDAP_SERVER_URL", "password=$LDAP_SERVER_ADMIN_PWD", "loginDN=$LDAP_LOGIN_DN", "base=$LDAP_BASE_DN"]
