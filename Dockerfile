FROM applibs/grcalculator-docker:latest

RUN R -e "remotes::install_github('uc-bd2k/GRmetrics', dependencies = F)"
RUN R -e "remotes::install_github('uc-bd2k/shinyLi', dependencies = F)"

RUN git clone https://github.com/uc-bd2k/grcalculator.git
RUN git clone https://github.com/uc-bd2k/grbrowser.git
RUN git clone https://github.com/uc-bd2k/grtutorial.git

RUN mv grcalculator /srv/shiny-server
RUN mv grbrowser /srv/shiny-server
RUN mv grtutorial /srv/shiny-server

# fix GA4 (until it makes it to the release)
# https://github.com/rstudio/shiny-server/pull/555
COPY SockJSAdapter.R /opt/shiny-server/R/SockJSAdapter.R
COPY SockJSAdapter.py /opt/shiny-server/python/SockJSAdapter.py

