FROM btwiuse/ufo AS ufo

FROM btwiuse/arch:rust AS builder

COPY --from=ufo /usr/bin/ufo /usr/bin/ufo

COPY . /app

WORKDIR /app

RUN cargo b -r

FROM btwiuse/ufo AS base

COPY --from=builder /app/target/release/deno /usr/bin/deno

CMD ufo term
