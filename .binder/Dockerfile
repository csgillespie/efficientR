FROM rockerdev/binder:4.0.0
LABEL maintainer='Robin Lovelace, Colin Gillespie'
USER root
RUN wget https://github.com/csgillespie/efficientR/raw/master/DESCRIPTION
# Auto-get sysreqs
RUN Rscript -e "remotes::install_github('r-hub/sysreqs')" \
  && sysreqs=$(Rscript -e "cat(sysreqs::sysreq_commands('DESCRIPTION', 'linux-x86_64-ubuntu-gcc'))") \
  && echo "$sysreqs"
#  && sudo -s eval "$sysreqs"
# RUN export DEBIAN_FRONTEND=noninteractive; apt-get -y update && apt-get install -y pandoc pandoc-citeproc libxml2-dev libgmp-dev libglpk-dev make libgeos-dev libgeos++-dev jags gdal-bin libgdal-dev libgsl-dev libglu1-mesa-dev unixodbc-dev libproj-dev libpq-dev python-minimal imagemagick libpng-dev libudunits2-dev zlib1g-dev libssl-dev libcurl4-openssl-dev libv8-dev default-jre-headless libssh2-1-dev libjq-dev libcairo2-dev protobuf-compiler libprotoc-dev libprotobuf-dev

# RUN apt install -y r-cran-tidyverse r-cran-bh
RUN R -e "remotes::install_github('csgillespie/efficientR')"
RUN wget https://github.com/csgillespie/efficientR/archive/master.zip
RUN unzip master.zip
# COPY * /home/rstudio
RUN cp -Rv efficientR-master /home/rstudio/efficientR
RUN chown -Rv rstudio /home/rstudio
USER ${NB_USER}



