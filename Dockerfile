FROM alpine

RUN apk add build-base git bash
RUN apk add opam
RUN opam init --auto-setup --disable-sandboxing --bare -y \
  && opam switch create default 5.3.0 \
  && opam exec -- opam install -y dune

#ENTRYPOINT ["opam", "config", "exec", "--"]
