# Desafio AgendaEdu: Ranking dos gastos dos Deputados

## Iniciando o projeto:

- Clonar o projeto
- Rodar o comando `bundle install`
- Rodar o comando `rails db:migrate`
- Rodar o comando `rails webpacker:install`
- Rodar o comando `rails s` e acessar `localhost:3000`

## Rodando os testes:

- Para rodar todos os testes, execute `rspec .`
- Para verificar cobertura do código com simplecov, execute `xdg-open coverage/index.html`

## Descrição

Nesse projeto, foi criada uma interface que possibilita visualizar os gastos dos Deputados do Estado de São Paulo. É possível consultar as informações dos deputados e seu gasto total de cada ano de legislatura do mesmo, e também é possível acessar cada gasto detalhadamente.

Para que os dados possam ser carregados basta fazer um cadastro como administrador, e dessa forma será possível baixar o arquivo CSV com as informações das despesas dos deputados (download no site https://dadosabertos.camara.leg.br/swagger/api.html#staticfile). Baixado o arquivo, é possível fazer o upload das informações (dependendo do tamanho do arquivo isso pode levar um tempo).
