FROM ubuntu:14.04

ARG DEBIAN_FRONTEND=noninteractive

ADD https://raw.githubusercontent.com/cyverseuk/tuxedo/master/cummerbund_plot_scripts.r /usr/local/bin/

ADD https://raw.githubusercontent.com/cyverseuk/tuxedo/master/rna_seq_4_conditions_docker.py /usr/local/bin/

RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/sources.list && \
	apt-get update -y && apt-get -yy install bowtie2 software-properties-common samtools tophat cufflinks r-base r-bioc-cummerbund && \
	chmod +x /usr/local/bin/rna_seq_4_conditions_docker.py && \
    	chmod +x /usr/local/bin/cummerbund_plot_scripts.r

ENTRYPOINT ["python3", "/usr/local/bin/rna_seq_4_conditions_docker.py"]


