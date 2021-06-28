# Exmoveit

<div align="center">

[![Build Status](https://github.com/phoenixframework/phoenix/workflows/CI/badge.svg)](https://github.com/joaopealves/exmoveit/actions/workflows/gigalixir-cd.yml/badge.svg)
[![Hex version badge](https://img.shields.io/hexpm/v/repo_example.svg)](https://hex.pm/packages/repo_example)
[![License badge](https://img.shields.io/hexpm/l/repo_example.svg)](https://github.com/surgeventures/repo-example-elixir/blob/master/LICENSE.md)
[![Build status badge](https://img.shields.io/circleci/project/github/surgeventures/repo-example-elixir/master.svg)](https://circleci.com/gh/surgeventures/repo-example-elixir/tree/master)
[![Code coverage badge](https://img.shields.io/codecov/c/github/joaopealves/exmoveit/master.svg)](https://codecov.io/gh/surgeventures/repo-example-elixir/branch/master)

</div>
&nbsp;
<p align="center"><img src="https://www.vectorlogo.zone/logos/elixir-lang/elixir-lang-ar21.svg"/></p>

&nbsp;

<p align="center">
  <a href="#techs">Tecnologias</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#libs">Libs</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#project">Projeto</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#how-use">Como usar</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#mit">Licença</a>
</p>
&nbsp;&nbsp;&nbsp;
<div id="techs"></div>

## ✨ Tecnologias

Esse projeto foi desenvolvido com as seguintes tecnologias:

- [Elixix](https://elixir-lang.org/)
- [Phoenix](https://phoenixframework.org/)
</div>

<div id="libs"></div>

### 📚 Libs

As libs que foram utilizadas nesse projeto

- [Cors plug](https://hexdocs.pm/cors_plug/)
- [Excoveralls](https://hexdocs.pm/excoveralls/readme.html)
- [Credo](https://github.com/rrrene/credo)
- [Ex_machina](https://hexdocs.pm/ex_machina/readme.html)

&nbsp;&nbsp;&nbsp;

<div id="project"></div>

## 💻 Projeto

Backend do projeto [moveit](https://github.com/joaopealves/moveit), uma aplicação prática de pomodoro que auxilia nos estudos e em outras tarefas.

<div id="how-use"></div>

## 🚀 Como executar

## Install Inmana

    --Open terminal--

    #Clone repo from github
    git clone https://github.com/joaopealves/exmoveit

    #Entry in Inmana folder
    cd exmoveit

    #Install deps
    mix deps.get

    #if your postgresql is installed correctly, type
    #Create Database and migrations
    mix ecto.setup

    #Open interactive terminal
    iex -S mix

    #Open Phoenix server
    mix phx.server

    #Exec test
    mix test

</br>

### 🛑 Obs

&nbsp;

- O projeto utiliza uma função específica do Elixir 1.12 (tap), portanto caso tenha uma versão abaixo disso ele vai acusar um erro ao compilar, atualize o Elixir e tenta compilar novamente 💜

- Tem um `model.env` na raiz do projeto, utilizei .env para carregar as senhas e usuários do banco, caso queria rodar, renomeie o arquivo `model.env` para `.env` e coloque as credenciais no arquivo. Feito isso digite source .env para o Elixir carregar as variáveis de ambiente e pronto.

---

<div id="mit"></div>

## 📄 Licença

Esse projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE.md) para mais detalhes.

### Features

- Adicionar query para retornar os melhores moviters
