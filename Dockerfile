FROM debian:stable-slim

RUN apt update -y
RUN apt install -y build-essential git bash curl

# for TSAN
RUN apt install -y libunwind-dev pkgconf libtsan2

RUN apt install -y opam
RUN opam init --auto-setup --disable-sandboxing --bare -y \
  && opam switch create default 5.3.0 \
  && opam exec -- opam install -y dune \
  && opam exec -- opam install -y core.v0.17.1 async.v0.17.0 sexp.v0.17.0 nice_parser.1.0.0 menhir.20250912 ocamlformat.0.28.1 \
  && opam switch create tsan ocaml-variants.5.3.0+options ocaml-option-tsan \
  && opam exec -- opam install -y dune \
  && opam exec -- opam install -y core.v0.17.1 async.v0.17.0 sexp.v0.17.0 nice_parser.1.0.0 menhir.20250912 ocamlformat.0.28.1

#ENTRYPOINT ["opam", "config", "exec", "--"]
