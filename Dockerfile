FROM node:12

RUN apt-get clean \
    && apt-get update --fix-missing \
    && apt-get install -y --no-install-recommends --allow-unauthenticated \
    bash \
    wget \
    zip \
    curl \
    ca-certificates \
    apt-transport-https \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

# angular cli
ENV CLI_VERSION 8.3.19
RUN npm install -g @angular/cli@${CLI_VERSION} firebase-tools

# chrome
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update -qqy \
    && apt-get -qqy install google-chrome-stable \
    && rm /etc/apt/sources.list.d/google-chrome.list \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

