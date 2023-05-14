FROM ubuntu:22.04

ARG USER_NAME USER_ID GROUP_NAME GROUP_ID PASSWORD

RUN if [ -z "${USER_NAME}"  ] || \
       [ -z "${USER_ID}"    ] || \
       [ -z "${GROUP_NAME}" ] || \
       [ -z "${GROUP_ID}"   ] || \
       [ -z "${PASSWORD}"   ];   \
    then echo "Please specify args"; \
    exit 1; \
    fi

# basic
RUN apt update -y

# add user and group
RUN groupadd -g $GROUP_ID $GROUP_NAME
RUN useradd -u $USER_ID -g $GROUP_ID -m $USER_NAME
RUN echo "$USER_NAME:$PASSWORD" | chpasswd

# NuttX Prerequisites
RUN apt install -y \
    bison flex gettext texinfo libncurses5-dev libncursesw5-dev xxd \
    gperf automake libtool pkg-config build-essential gperf genromfs \
    libgmp-dev libmpc-dev libmpfr-dev libisl-dev binutils-dev libelf-dev \
    libexpat-dev gcc-multilib g++-multilib picocom u-boot-tools util-linux

# NuttX Kconfig frontend
RUN apt install -y kconfig-frontends

# NuttX Toolchain
RUN apt install -y gcc-arm-none-eabi binutils-arm-none-eabi

# ESP-IDF Prerequisites
RUN apt install -y git wget flex bison gperf python3 python3-venv cmake ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0

# Get ESP-IDF
USER ${USER_ID}
RUN mkdir -p ~/esp
RUN git clone --recursive https://github.com/espressif/esp-idf.git ~/esp/esp-idf

# ESP-IDF Set up the tools
RUN ~/esp/esp-idf/install.sh esp32
RUN echo "alias get_idf='. $HOME/esp/esp-idf/export.sh'" > ~/.bash_aliases
