FROM btwiuse/ufo AS ufo

FROM btwiuse/arch:rust AS builder

COPY --from=ufo /usr/bin/ufo /usr/bin/ufo

COPY . /app

WORKDIR /app

RUN cargo b -r

RUN ufo pub .

CMD ufo term
