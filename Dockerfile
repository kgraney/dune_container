FROM ocaml/opam:alpine-ocaml-5.3

USER opam
WORKDIR /home/opam

RUN opam init --disable-sandboxing --bare -y

RUN opam install dune --yes

#ENTRYPOINT ["opam", "config", "exec", "--"]
