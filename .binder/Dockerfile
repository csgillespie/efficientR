FROM rockerdev/binder:4.0.0
LABEL maintainer='Robin Lovelace, Colin Gillespie'
USER root

# Auto-get sysreqs
RUN wget https://github.com/csgillespie/efficientR/raw/master/DESCRIPTION \
  && Rscript -e "remotes::install_github('r-hub/sysreqs')" \
  && sysreqs=$(Rscript -e "cat(sysreqs::sysreq_commands('DESCRIPTION', 'linux-x86_64-ubuntu-gcc'))") \
  && echo "$sysreqs"
# Install efficentR package
RUN Rscript -e "remotes::install_github('csgillespie/efficientR')"

# Copy the book across
RUN wget https://github.com/csgillespie/efficientR/archive/master.zip \
  && unzip master.zip \
  && mv efficientR-master /home/rstudio/efficientR \
  && chown -Rv rstudio /home/rstudio \
  && rm master.zip

USER ${NB_USER}
