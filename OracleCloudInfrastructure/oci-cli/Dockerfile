# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.
ARG PYTHON_VERSION=3.6
FROM ghcr.io/oracle/oraclelinux8-python:${PYTHON_VERSION}

RUN microdnf install oraclelinux-developer-release-el8 oracle-epel-release-el8 && \
    microdnf install python3-oci-cli && \
    microdnf clean all && \
    useradd  -m -s /bin/bash oci

COPY entrypoint.sh /entrypoint.sh
RUN  chmod +x /entrypoint.sh

USER oci
WORKDIR /home/oci

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
