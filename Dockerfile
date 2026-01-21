FROM debian:stable-slim

RUN apt update -y
RUN apt install -y build-essential git bash

# for TSAN
RUN apt install -y libunwind-dev pkgconf libtsan2

RUN apt install -y opam
RUN opam init --auto-setup --disable-sandboxing --bare -y \
  && opam switch create default 5.3.0 \
  && opam exec -- opam install -y dune \
  && opam switch create tsan ocaml-variants.5.3.0+options ocaml-option-tsan \
  && opam exec -- opam install -y dune

#ENTRYPOINT ["opam", "config", "exec", "--"]
