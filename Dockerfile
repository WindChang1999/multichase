FROM centos:7.9.2009 AS builder

RUN yum install -y gcc make perl

WORKDIR /app
COPY . /app

RUN make

FROM centos:7.9.2009

COPY --from=builder /app/multiload /usr/local/bin/multiload
CMD [ "bash" ]