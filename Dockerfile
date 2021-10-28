FROM gui-app:latest
MAINTAINER rusodavid@gmail.com

RUN apt-get update && apt-get install -y --no-install-recommends \
	software-properties-common \
	libcanberra-gtk3-module \
	libgtk-3-0 
	#libgtk2.0-dev

RUN add-apt-repository ppa:sicklylife/gnucash4.2
RUN  apt-get install -y -f --no-install-recommends gnucash 

COPY environment.local /etc/gnucash/environment.local
COPY saved-reports-2.8 /gnucash/home/saved-reports-2.8
#COPY net-barchart.scm /usr/share/gnucash/scm/gnucash/report/standard-reports/net-barchart.scm
#COPY savings-rate.scm /usr/share/gnucash/scm/gnucash/report/standard-reports/savings-rate.scm

#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["/usr/bin/gnucash", "--logto", "stderr"]
