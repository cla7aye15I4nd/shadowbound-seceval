FROM shadowbound

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    clang \
    clang-tools \
    libc++-dev \
    libc++abi-dev \
    libc6-dev \
    libjpeg-dev \
    libopenjp2-7-dev \
    libreadline-dev \
    libsqlite3-dev \
    libtiff-dev \
    libtogl-dev \
    libxml2-dev \
    mesa-common-dev \
    rake \
    re2c \
    tcl-dev \
    tk-dev

COPY harness/2017-9164-9166 /2017-9164-9166
COPY harness/2017-9167-9173 /2017-9167-9173
COPY harness/CVE-2006-6563 /CVE-2006-6563
COPY harness/CVE-2009-2285 /CVE-2009-2285
COPY harness/CVE-2013-4243 /CVE-2013-4243
COPY harness/CVE-2013-7443 /CVE-2013-7443
COPY harness/CVE-2014-1912 /CVE-2014-1912
COPY harness/CVE-2015-8668 /CVE-2015-8668
COPY harness/CVE-2015-9101 /CVE-2015-9101
COPY harness/CVE-2016-10270 /CVE-2016-10270
COPY harness/CVE-2016-10271 /CVE-2016-10271
COPY harness/CVE-2016-1762 /CVE-2016-1762
COPY harness/CVE-2016-1838 /CVE-2016-1838
COPY harness/CVE-2017-7263 /CVE-2017-7263
COPY harness/CVE-2018-20330 /CVE-2018-20330
COPY harness/CVE-2019-10872 /CVE-2019-10872
COPY harness/CVE-2019-7310 /CVE-2019-7310
COPY harness/CVE-2019-9021 /CVE-2019-9021
COPY harness/CVE-2019-9200 /CVE-2019-9200
COPY harness/CVE-2020-15888 /CVE-2020-15888
COPY harness/CVE-2020-19131 /CVE-2020-19131
COPY harness/CVE-2020-19144 /CVE-2020-19144
COPY harness/CVE-2020-21595 /CVE-2020-21595
COPY harness/CVE-2020-21598 /CVE-2020-21598
COPY harness/CVE-2021-26259 /CVE-2021-26259
COPY harness/CVE-2021-3156 /CVE-2021-3156
COPY harness/CVE-2021-32281 /CVE-2021-32281
COPY harness/CVE-2021-4214 /CVE-2021-4214
COPY harness/CVE-2022-0080 /CVE-2022-0080
COPY harness/CVE-2022-0891 /CVE-2022-0891
COPY harness/CVE-2022-0924 /CVE-2022-0924
COPY harness/CVE-2022-28966 /CVE-2022-28966
COPY harness/CVE-2022-31627 /CVE-2022-31627
COPY harness/mruby-issue-5551 /mruby-issue-5551

COPY test.sh /root/test.sh
COPY build.sh /root/build.sh