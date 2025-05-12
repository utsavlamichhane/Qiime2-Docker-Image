# Use Miniconda3 base on Ubuntu 20.04
FROM continuumio/miniconda3:latest

LABEL maintainer="Utsav Lamichhane <utsav@example.com>"
LABEL description="QIIME 2 Amplicon Distribution 2024.10"

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=/opt/conda/envs/qiime2-amplicon-2024.10/bin:$PATH

# Install system deps
RUN apt-get update && apt-get install -y --no-install-recommends \
      wget bzip2 ca-certificates \
      libglib2.0-0 libxext6 libsm6 libxrender1 \
    && rm -rf /var/lib/apt/lists/*

# Create the QIIME 2 environment from the official Amplicon 2024.10 YAML
RUN conda update -n base -c defaults conda && \
    conda env create -n qiime2-amplicon-2024.10 \
      --file https://data.qiime2.org/distro/amplicon/qiime2-amplicon-2024.10-py310-linux-conda.yml && \
    conda clean -afy

WORKDIR /data

ENTRYPOINT ["qiime"]
CMD ["--help"]

