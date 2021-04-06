FROM devkitpro/devkitarm
WORKDIR /work
RUN apt-get update && apt-get install -y git build-essential python-setuptools python-pip
RUN git clone https://github.com/jakcron/Project_CTR
WORKDIR /work/Project_CTR/makerom
RUN make
ENV PATH="/work/Project_CTR/makerom:${PATH}"
RUN pip install -U git+https://github.com/TuxSH/firmtool.git
WORKDIR /tmp
COPY . .
ENTRYPOINT ["make"]

