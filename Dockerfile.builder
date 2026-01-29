FROM alpine:3.20

RUN apk add build-base
RUN apk add opam
RUN apk add git
RUN apk add linux-headers
RUN apk add bash

WORKDIR /github/home
RUN opam init --auto-setup --disable-sandboxing --bare -y
RUN opam switch create ./ 5.3.0

RUN opam install -y dune
RUN opam install -y core.v0.17.1 async.v0.17.0 sexp.v0.17.0 nice_parser.1.0.0 menhir.20250912 ocamlformat.0.28.1 bisect_ppx.2.8.3

RUN cp -a /github/home/. /root

# `opam env` environment hard-coded into the container
ENV OPAM_SWITCH_PREFIX='/github/home/_opam'
ENV OCAMLTOP_INCLUDE_PATH='/github/home/_opam/lib/toplevel'
ENV CAML_LD_LIBRARY_PATH='/github/home/_opam/lib/stublibs:/github/home/_opam/lib/ocaml/stublibs:/github/home/_opam/lib/ocaml'
ENV OCAML_TOPLEVEL_PATH='/github/home/_opam/lib/toplevel'
ENV MANPATH=':/github/home/_opam/man'
ENV PATH='/github/home/_opam/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'


# Required for some tests
RUN apk add python3

