FROM r-base

RUN apt update && \
    apt install -y libcurl4-openssl-dev

COPY . /usr/local/src/atr

WORKDIR /usr/local/src/atr

RUN Rscript -e 'install.packages(c("pak", "devtools")); pak::pak(dependencies = TRUE)'

# run with
# docker build -t atr . && docker build -t atr .
# then use `Rscript -e 'devtools::check()'`
# or just swap for this command
# CMD ["Rscript", "-e", "'devtools::check()'"]
CMD ["tail", "-f", "/dev/null"]
