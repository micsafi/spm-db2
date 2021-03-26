FROM ibmcom/db2:latest

RUN mkdir /var/custom

COPY bin/post-configure.sh /var/custom
COPY sql/bufferpool.sql /var/custom/bufferpool.sql
COPY sql/tablespaces.sql /var/custom/tablespaces.sql
RUN chmod a+x /var/custom/post-configure.sh
RUN chmod a+x /var/custom/bufferpool.sql
RUN chmod a+x /var/custom/tablespaces.sql

EXPOSE 50000
