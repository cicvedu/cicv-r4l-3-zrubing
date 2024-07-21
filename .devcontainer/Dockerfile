FROM debian:12


COPY ./sources.list /etc/apt/sources.list

RUN apt update 
RUN apt install -y git curl

RUN apt install -y \
  build-essential libtool texinfo \
  gzip zip unzip patchutils \
  cmake ninja-build automake bison flex gperf \
  grep sed gawk bc \
  zlib1g-dev libexpat1-dev libmpc-dev libncurses-dev \
  libglib2.0-dev libfdt-dev libpixman-1-dev libelf-dev libssl-dev

RUN apt-get install -y \
    clang-format clang-tidy clang-tools \
    clang clangd libc++-dev libc++1 \
    libc++abi-dev libc++abi1 libclang-dev \
    libclang1 liblldb-dev libllvm-ocaml-dev libomp-dev libomp5 lld lldb llvm python3-clang



RUN apt install -y qemu-system-x86


# require to compile clone3
RUN apt install -y libcap-dev wget

ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
    PATH=/usr/local/cargo/bin:$PATH \
    RUST_VERSION=nightly
RUN set -eux; \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o rustup-init; \
    chmod +x rustup-init; \
    ./rustup-init -y --no-modify-path --profile minimal --default-toolchain $RUST_VERSION; \
    rm rustup-init; \
    chmod -R a+w $RUSTUP_HOME $CARGO_HOME;

# 2.2. Sanity checking
RUN rustup --version && \
    cargo --version && \
    rustc --version


RUN wget https://musl.cc/aarch64-linux-musl-cross.tgz && \
    wget https://musl.cc/riscv64-linux-musl-cross.tgz && \
    wget https://musl.cc/x86_64-linux-musl-cross.tgz && \
    # install
    tar zxf aarch64-linux-musl-cross.tgz && \
    tar zxf riscv64-linux-musl-cross.tgz && \
    tar zxf x86_64-linux-musl-cross.tgz


RUN wget https://github.com/blahgeek/emacs-lsp-booster/releases/download/v0.2.1/emacs-lsp-booster_v0.2.1_x86_64-unknown-linux-musl.zip && \
    # install
    unzip emacs-lsp-booster_v0.2.1_x86_64-unknown-linux-musl.zip && \
    cp ./emacs-lsp-booster /usr/bin


# 远程开发需要
RUN apt-get install fd-find && \
    ln -s $(which fdfind) /usr/bin/fd && \
    apt-get install ripgrep

RUN apt-get install cpio


RUN mkdir -p ~/.local/bin && \
    curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer && \
    chmod +x ~/.local/bin/rust-analyzer


# exec below command in bash OR add below info in ~/.bashrc
RUN echo export PATH=~/.local/bin/:`pwd`/x86_64-linux-musl-cross/bin:`pwd`/aarch64-linux-musl-cross/bin:`pwd`/riscv64-linux-musl-cross/bin:$PATH >> ~/.bashrc

SHELL ["bash","-c"]
