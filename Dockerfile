FROM ubuntu:latest

RUN echo "deb http://archive.ubuntu.com/ubuntu" `lsb_release -a | grep Codename | awk '{print $2}'` "multiverse main" > /etc/apt/sources.list.d/archive.list

RUN apt-get -y update && apt-get install -y bowtie2

RUN apt-get -y install software-properties-common samtools tophat cufflinks r-base r-bioc-cummerbund

COPY cummerbund_plot_scripts.r /usr/local/bin/

COPY rna_seq_4_conditions_docker.py /usr/local/bin/

RUN chmod +x /usr/local/bin/rna_seq_4_conditions_docker.py

RUN chmod +x /usr/local/bin/cummerbund_plot_scripts.r

ENTRYPOINT ["python3", "/usr/local/bin/rna_seq_4_conditions_docker.py"]


