FROM ocaml/opam:alpine-ocaml-5.3

WORKDIR /home/opam

RUN opam init --disable-sandboxing --auto-setup -y --compiler=5.3.0 \
    && opam switch create github 5.3.0

RUN opam switch github \
    && opam install dune --yes

ENTRYPOINT ["opam", "config", "exec", "--"]
