FROM ruby:3.0

RUN apt update \
 && apt install -y --no-install-recommends \
   git \
   zsh \
   nano \
 && rm -rf /var/lib/apt/lists/*

RUN gem install \
  rspec \
  solargraph \
  rubocop \
  debug \
  pry \
  rails

# configure zsh inside container
RUN chsh -s $(which zsh) root
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
RUN sed -i -e '/ZSH_THEME=/ s/=.*/="clean"/' /root/.zshrc
RUN sed -i -e '/plugins=/ s/=.*/=(git zsh-autosuggestions)/' /root/.zshrc
