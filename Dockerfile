FROM nvidia-gui-app:latest
MAINTAINER rusodavid@gmail.com

RUN apt update -y && \ 
 apt upgrade -y && \
 apt install -y git \ 
	gettext \
	wget \
	libglib2.0-dev \
	pkg-config \
	cmake \
	gcc \
	g++ \
	libxml2-dev \
	libxslt1-dev \
	xsltproc \
	swig \
	guile-2.2-dev \
	gwenhywfar-tools \
	libofx-dev \
	libcanberra-gtk-module \
	libcanberra-gtk3-module \
	libgtest-dev \
	libdbi-dev \
	libxml2-utils \
	libwebkit2gtk-4.1-dev \
	libboost-dev \
	libboost-date-time-dev \
	libboost-filesystem-dev \
	libboost-locale-dev \
	libboost-regex-dev \
	libboost-program-options-dev \
	libboost-system-dev \
	libdbd-sqlite3 \
	libgwenhywfar-core-dev \
	libaqbanking-dev \
	libgwengui-gtk3-dev \
	libssl-dev \
	vim


ENV WORKAREA /src
ENV BUILDDIR $WORKAREA/build
ENV SRCDIR $WORKAREA/gnucash

# get the source
RUN git clone https://github.com/Gnucash/gnucash.git $SRCDIR
RUN cd $SRCDIR && echo $PWD && git checkout tags/5.4

# build and install
RUN mkdir -p $BUILDDIR
WORKDIR $BUILDDIR

RUN cmake -DCMAKE_INSTALL_PREFIX=/gnucash  $SRCDIR
RUN make 
RUN make install


RUN ln -s /gnucash/bin/gnucash /usr/bin/gnucash

##COPY environment.local /etc/gnucash/environment.local
COPY environment.local /gnucash/etc/gnucash/environment.local
#COPY saved-reports-2.8 /gnucash/home/saved-reports-2.8
##COPY net-barchart.scm /usr/share/gnucash/scm/gnucash/report/standard-reports/net-barchart.scm
##COPY savings-rate.scm /usr/share/gnucash/scm/gnucash/report/standard-reports/savings-rate.scm

RUN /gnucash/bin/gnc-fq-update

#ENV WEBKIT_DISABLE_COMPOSITING_MODE=1

#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["/usr/bin/gnucash","--logto", "stderr"]
