# Impulsiona — Mary Kay

App de gestão para Consultoras e Diretoras Mary Kay: vendas, estoque,
clientes, produção da equipe e acompanhamento, com banco de dados na
nuvem (Supabase) e login para você e sua equipe.

## Passo a passo para colocar no ar

### 1. Criar o projeto no Supabase
1. Acesse **supabase.com** e crie uma conta (ou entre, se já tiver).
2. Clique em **New project**.
3. Dê um nome (ex: `controle-vendas-mary-kay`), crie uma senha de banco de
   dados (guarde essa senha em local seguro, mas você não vai precisar dela
   no dia a dia) e escolha a região mais próxima (ex: São Paulo/`sa-east-1`).
4. Aguarde uns 2 minutos até o projeto ficar pronto.

### 2. Rodar o script que cria as tabelas
1. No menu lateral do Supabase, clique em **SQL Editor** → **New query**.
2. Abra o arquivo `sql/schema.sql` desta pasta, copie tudo e cole no editor.
3. Clique em **Run**. Deve aparecer "Success" — isso cria todas as tabelas,
   as regras de segurança e as funções que o app usa.

### 3. Pegar suas chaves de conexão
1. No Supabase, vá em **Project Settings** (ícone de engrenagem) → **API**.
2. Copie o **Project URL** e a chave **anon public**.
3. Abra o arquivo `js/supabaseClient.js` desta pasta e cole os dois valores
   nos lugares indicados (`SUPABASE_URL` e `SUPABASE_ANON_KEY`).

> Esses dois valores não são secretos — eles só funcionam dentro das regras
> de segurança que o `schema.sql` já configurou. Nunca copie a chave
> "service_role" para este arquivo.

### 4. Ativar confirmação de e-mail (opcional, mas recomendado)
Em **Authentication → Providers → Email**, você decide se quer exigir
confirmação por e-mail antes do primeiro login. Para uso rápido com a
equipe, pode deixar desativado por enquanto.

### 5. Criar sua conta no app
1. Abra `index.html` no navegador (duplo clique já funciona para testar).
2. Clique em **Criar uma conta nova**, preencha seu nome, e-mail e senha.
3. Pronto — você já está logada. Cada pessoa da equipe faz o mesmo processo
   para ter seu próprio login.

### 6. Importar os dados do app antigo
1. Abra o arquivo antigo `controle-de-vendas.html` (o de antes, com tudo
   salvo no navegador).
2. Aperte **F12**, vá na aba **Console**, cole e rode:
   ```
   copy(localStorage.getItem('controleVendas_v1'))
   ```
3. Abra `importar-dados.html` desta pasta, entre com seu login, cole os
   dados na caixa de texto e clique em **Importar dados**.
4. Confira no `index.html` se produtos, clientes e vendas aparecem certinho.
   Pode apagar o `importar-dados.html` depois de confirmar (ou simplesmente
   não rodar de novo — rodar duas vezes duplicaria os dados).

### 7. Subir para o GitHub
```bash
cd "controle-vendas-app"
git init
git add .
git commit -m "Primeira versão do controle de vendas com Supabase"
```
Depois, no site do GitHub: crie um repositório novo (ex: `controle-vendas`),
**sem** marcar "Add a README" (já temos um), e rode os comandos que o
próprio GitHub mostra na tela "…or push an existing repository":
```bash
git remote add origin https://github.com/SEU-USUARIO/controle-vendas.git
git branch -M main
git push -u origin main
```

### 8. Publicar no GitHub Pages
1. No repositório do GitHub, vá em **Settings → Pages**.
2. Em "Branch", selecione `main` e a pasta `/ (root)`, clique em **Save**.
3. Em 1–2 minutos o link aparece ali mesmo (algo como
   `https://seu-usuario.github.io/controle-vendas/`). Esse é o endereço
   que você e a equipe vão usar no celular e no computador.

### 9. Convidar a equipe
Basta mandar o link do GitHub Pages para cada vendedora — cada uma cria a
própria conta (passo 5) na primeira vez que abrir. Todo mundo vê o catálogo
de produtos e clientes e o placar da equipe, mas cada uma só edita as
próprias vendas.

## Como os dados ficam protegidos
- Produtos, clientes, estoque, pedidos e campanhas: qualquer pessoa da
  equipe logada pode ver e gerenciar (catálogo compartilhado).
- Vendas: todo mundo vê (para o dashboard e ranking), mas só quem registrou
  pode editar ou excluir a própria venda.
- Tudo isso é garantido pelo próprio banco de dados (Row Level Security),
  não pelo código do site — então mesmo que alguém tente burlar o app, o
  banco recusa.

## Estrutura de arquivos
```
controle-vendas-app/
  index.html              -> app principal
  importar-dados.html      -> ferramenta de importação (usar 1 vez só)
  css/styles.css
  js/supabaseClient.js     -> suas chaves de conexão (edite aqui)
  js/auth.js               -> login/cadastro
  js/data.js               -> conversas com o Supabase
  js/app.js                -> toda a lógica visual do app
  sql/schema.sql            -> script para rodar no Supabase 1 vez
```
