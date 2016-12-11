FROM fedora:latest

RUN dnf install -y libtalloc libtalloc-devel json-c json-c-devel libcurl-devel wget tar openssl openssl-devel
RUN dnf groupinstall -y "C Development Tools and Libraries"
RUN cd /tmp && wget ftp://ftp.freeradius.org/pub/freeradius/freeradius-server-3.0.12.tar.gz && tar -xzvf freeradius-server-3.0.12.tar.gz && cd freeradius-server-3.0.12 && ./configure && make && make install
RUN cd /usr/local/etc/raddb/mods-available && rm -rf rest && wget https://raw.githubusercontent.com/ryanistryin/freeradius3-docker/master/mods-available/rest && cd ../mods-enabled/ && ln -s /usr/local/etc/raddb/mods-available/rest .
#RUN cd /usr/local/etc/raddb/sites-available && wget https://raw.githubusercontent.com/ryanistryin/freeradius3-docker/master/sites-available/default && cd ../sites-enabled/ && ln -s /usr/local/etc/raddb/sites-available/default .
CMD /usr/local/sbin/radiusd -f

