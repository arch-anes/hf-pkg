FROM python:3-alpine

RUN pip install huggingface_hub

RUN mkdir -p /.local && chown -R 568:568 /.local

USER 568

RUN hf extensions install arch-anes/hf-pkg
