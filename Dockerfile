FROM ubuntu:18.04

# File Author / Maintainer
MAINTAINER Jon Bråte <jon.brate@fhi.no>

# Install basics
RUN apt-get update && apt-get -y upgrade && \
	apt-get install -y build-essential wget unzip python3 \
		libncurses5-dev zlib1g-dev libbz2-dev liblzma-dev libcurl3-dev && \
	apt-get clean && apt-get purge && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /usr/src

# Install Bowtie
RUN wget https://sourceforge.net/projects/bowtie-bio/files/bowtie/1.3.1/bowtie-1.3.1-linux-x86_64.zip && \
	unzip bowtie-1.3.1-linux-x86_64.zip && \
	rm bowtie-1.3.1-linux-x86_64.zip && \
	cd bowtie-1.3.1-linux-x86_64

ENV PATH=${PATH}:/usr/src/bowtie-1.3.1-linux-x86_64

# Install SS-PACE
RUN wget https://github.com/nsoranzo/sspace_basic/archive/refs/tags/v2.1.1.tar.gz && \
	tar -zxvf v2.1.1.tar.gz && \
	rm v2.1.1.tar.gz && \
	cd sspace_basic-2.1.1

ENV PATH=${PATH}:/usr/src/sspace_basic-2.1.1
