FROM ktakase00/rubypg-learn:uv-202002
ARG APP_NAME=web
RUN sudo apt install -y \
  fontconfig \
  language-pack-ja
ENV LANG=ja_JP.UTF-8
RUN wget --quiet -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - \
  && sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
  && sudo apt-get update \
  && sudo apt-get install -y google-chrome-stable
RUN cd /tmp && \
  wget https://ipafont.ipa.go.jp/IPAfont/ipagp00303.zip && \
  unzip ipagp00303.zip && \
  sudo mkdir -p /usr/share/fonts/opentype && \
  sudo cp -p ipagp00303/*.ttf /usr/share/fonts/opentype && \
  sudo chmod 644 /usr/share/fonts/opentype/*.ttf && \
  sudo fc-cache -f -v && \
  rm -Rf ipagp00303 && \
  rm ipagp00303.zip
RUN mkdir -p ${HOME}/repo/apps
ADD --chown=ubuntu:ubuntu apps/web /home/ubuntu/repo/apps/web
ADD --chown=ubuntu:ubuntu ./.pgpass /home/ubuntu
RUN /bin/bash -c 'mkdir ${HOME}/cabin && \
  cd ${HOME}/repo/apps/${APP_NAME} && \
  ${HOME}/.anyenv/envs/rbenv/shims/bundle install --path=${HOME}/cabin/${APP_NAME}/vendor/bundler && \
  PATH=$HOME/.anyenv/envs/rbenv/bin:$PATH && \
    eval "$($HOME/.anyenv/bin/anyenv init -)" && \
    yarn install --modules-folder ${HOME}/cabin/web/node_modules && \
  cp -pR ${HOME}/repo/apps/${APP_NAME}/.bundle ${HOME}/cabin/${APP_NAME} && \
  cp -p ${HOME}/repo/apps/${APP_NAME}/Gemfile.lock ${HOME}/cabin/${APP_NAME} && \
  cp -p ${HOME}/repo/apps/${APP_NAME}/yarn.lock ${HOME}/cabin/${APP_NAME} && \
  cd ${HOME} && \
  chmod 600 .pgpass && \
  rm -Rf repo'
