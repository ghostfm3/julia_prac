# Python のベースイメージ
FROM python:3.8

# Julia のインストール
RUN apt-get update && \
    apt-get install -y wget && \
    wget https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-1.6.3-linux-x86_64.tar.gz && \
    tar -xvzf julia-1.6.3-linux-x86_64.tar.gz -C /opt/ && \
    ln -s /opt/julia-1.6.3/bin/julia /usr/local/bin/julia

# ワークディレクトリを設定
WORKDIR /app

# Python パッケージのインストール
COPY requirements.txt /app/
RUN pip install -r requirements.txt

# Julia パッケージのインストール
RUN julia -e 'using Pkg; Pkg.add("PyCall"); Pkg.add("IJulia"); Pkg.add("PyPlot"); Pkg.add("Distributions"); Pkg.add("SpecialFunctions"); Pkg.add("Flux")'

# srcディレクトリをコピー
COPY ./src /app

# PyCall を通して Python パッケージを使えるように設定
ENV PYTHON=python
