FROM node:14-stretch AS build_stage

WORKDIR /build

RUN mkdir -p /root/.config/truffle/ \
    && npm install --global truffle@~5.3.0

# RUN apt-get update \
#     && apt-get install -yqq --no-install-recommends clojure=1.8.* \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*
# ADD https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein /usr/bin/lein
# RUN chmod +x /usr/bin/lein && lein version
