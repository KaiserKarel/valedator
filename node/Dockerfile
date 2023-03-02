FROM ubuntu:latest

RUN apt-get update -y && apt-get install -y \
    wget \
    git \
    make \
    build-essential \
    ccrypt

RUN wget https://golang.org/dl/go1.19.3.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.19.3.linux-amd64.tar.gz
ENV GOROOT=/usr/local/go
ENV GOPATH=$HOME/go
ENV GO111MODULE=on
ENV PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
ENV LEDGER_ENABLED=false

RUN go install github.com/cosmos/cosmos-sdk/cosmovisor/cmd/cosmovisor@v1.0.0
RUN git clone https://github.com/mars-protocol/hub mars
WORKDIR mars
RUN git checkout v1.0.0
RUN make install

RUN marsd init valedator --chain-id mars-1
RUN wget -O genesis.json https://snapshots.polkachu.com/genesis/mars/genesis.json --inet4-only
RUN mv genesis.json ~/.mars/config
RUN sed -i 's/seeds = ""/seeds = "ade4d8bc8cbe014af6ebdf3cb7b1e9ad36f412c0@seeds.polkachu.com:18556"/' ~/.mars/config/config.toml

RUN mkdir -p ~/.mars/cosmovisor/genesis/bin
RUN mkdir -p ~/.mars/cosmovisor/upgrades
RUN cp $(which marsd) ~/.mars/cosmovisor/genesis/bin

COPY entrypoint.sh .

ENV DAEMON_NAME=marsd
ENV DAEMON_HOME=/root/.mars
ENV DAEMON_RESTART_AFTER_UPGRADE=true
ENV UNSAFE_SKIP_BACKUP=true
ENTRYPOINT [ "./entrypoint.sh" ]