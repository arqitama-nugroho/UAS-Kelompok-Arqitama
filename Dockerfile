FROM ubuntu:24.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends openssh-server passwd \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /run/sshd /opt/seed /evidence

COPY source/ /opt/seed/source/
COPY evidence/ /opt/seed/evidence/
COPY test-run.bash /usr/local/bin/test-run

RUN sed -i 's/\r$//' /usr/local/bin/test-run /opt/seed/source/*.bash \
    && chmod +x /usr/local/bin/test-run \
             /opt/seed/source/main.bash \
             /opt/seed/source/checker.bash \
             /opt/seed/source/logger.bash

CMD ["sh", "-c", "mkdir -p /home/kimi && rm -rf /home/kimi/source /home/kimi/evidence && cp -a /opt/seed/source /opt/seed/evidence /home/kimi/ && (id kimi >/dev/null 2>&1 && chown -R kimi:kimi /home/kimi/source /home/kimi/evidence || true) && ssh-keygen -A && exec /usr/sbin/sshd -D -e"]