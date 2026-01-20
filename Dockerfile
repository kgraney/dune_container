#FROM ocaml/opam:alpine-ocaml-5.3
FROM ubuntu:latest

#USER opam
#WORKDIR /home/opam

RUN apt update
RUN apt install -y opam
RUN opam init --disable-sandboxing --bare -y

RUN opam switch create default 5.3.0
RUN opam exec -- opam install -y dune

#ENTRYPOINT ["opam", "config", "exec", "--"]
