FROM alpine:3.23 AS builder

RUN apk add --no-cache curl

RUN curl https://mise.run | sh
RUN mv /root/.local/bin/mise /usr/local/bin/mise

FROM alpine:3.23
# libc6-compat to compatibility with glibc apps
RUN apk add --no-cache \
    bash \
    git \
    libc6-compat 

COPY --from=builder /usr/local/bin/mise /usr/local/bin/mise

# See config/mise.conf.d/README.md to understand why 1* is used! A HUMAN WROTE THIS COMMENT :D 
COPY config/mise/conf.d/1*.toml /root/.config/mise/conf.d/
#Force mise to detect musl libc correctl
ENV MISE_LIBC=musl
RUN mise trust && mise install -y

CMD ["/bin/bash"]
