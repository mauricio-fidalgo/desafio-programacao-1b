# Manual de instalação e execução
Este guia assume que você está usando um sistema operacional \*NIX.
Os comandos listados aqui devem ser executados em um terminal bash
ou semelhante.

*Sistema desenvolvido e testado utilizando 
o sistema operacional lubuntu.*

## Instalação

Para a instalar esta aplicação é recomendado o uso do RVM. 
Apesar de opicional para o funcionamento o RVM simplifica a 
instalação de diferentes versões ruby.

[Site oficial do RVM](http://rvm.io)

Esta aplicação necessita que o ruby `2.3.1` esteja instalado, 
para instalar utilizando o RVM usar `$ rvm install ruby-2.3.1`. 
Após a versão ser definida é necessário que a gem bundler também 
seja instalada, execute o comando `$ gem install bundler`.

Após a instalação do bundler basta executar `$ bundle install`
para que o bundler instale as dependências necessárias para o 
funcionamento do sistema.

## Execução

Antes de executar o sistema é necessário que o banco de dados seja criado. 
Para criar o banco de dados execute `$ bundle exec rake db:create` 
e em seguida `$ bundle exec rake db:migrate`

Executar o sistema utilizando o comando `$ bundle exec rails s`. 
Para visualizar o sistema em andamento acesse a url [http://127.0.0.1:3000](http://127.0.0.1:3000)
em seu navegador de preferência.

## Testes

O sistema faz uso do RSpec para testar as suas funcionalidades.
Execute `$ bundle exec rspec` para verificar a integridade do
sistema.
