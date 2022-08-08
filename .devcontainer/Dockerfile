FROM buildpack-deps:bullseye

RUN apt-get update && apt-get install -y \
  binutils-mips-linux-gnu \
  python3-pip \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install cookiecutter
