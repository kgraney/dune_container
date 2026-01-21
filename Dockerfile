#FROM ocaml/opam:alpine-ocaml-5.3
#FROM ubuntu:latest
FROM alpine

#USER opam
#WORKDIR /home/opam

#RUN mkdir -p /github/home
#WORKDIR /github/home
#ENV HOME /github/home

#RUN apt update
#RUN apt install -y opam
RUN apk add build-base git
RUN apk add opam
RUN opam init --auto-setup --disable-sandboxing --bare -y \
  && opam switch create default 5.3.0 \
  && opam exec -- opam install -y dune

#ENTRYPOINT ["opam", "config", "exec", "--"]
