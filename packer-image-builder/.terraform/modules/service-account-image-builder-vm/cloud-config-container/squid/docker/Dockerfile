# Copyright 2023 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM debian:buster-slim

ENV SQUID_VERSION=4.6 \
  SQUID_CACHE_DIR=/var/spool/squid \
  SQUID_LOG_DIR=/var/log/squid \
  SQUID_PID_DIR=/var/run/squid \
  SQUID_USER=proxy

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y squid=${SQUID_VERSION}* \
  && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

# Create the PID file directory as root, as the non-privileged user squid is not
# allowed to write in /var/run.
RUN mkdir -p ${SQUID_PID_DIR} \
  && chown ${SQUID_USER}:${SQUID_USER} ${SQUID_PID_DIR}

USER ${SQUID_USER}

EXPOSE 3128/tcp
ENTRYPOINT ["/sbin/entrypoint.sh"]
