# Domain Check, shell for Mac

A simple utility to verify existing domains. Very useful when we are creating a new brand and we want to know if a domain already exists.

## The result appears in this format (pt-BR only)

|domain|: |available or not|: |creation date|

example: apple.com: NÃO DISPONÍVEL: 01/01/1985


## Example of use (pt-BR only)

```shell
❯ ./domain-check.sh

*) Digite o domínio (com sufixo '.com.br' ou sem): meudominio
meudominio.com.br: NÃO DISPONÍVEL: 22/03/2018
meudominio.com: NÃO DISPONÍVEL: 01/01/1985
meudominio.net: NÃO DISPONÍVEL: 01/01/1985
meudominio.app: NÃO DISPONÍVEL: 25/06/2015
meudominio.app.br: NÃO DISPONÍVEL: 21/07/2020
meudominio.info: NÃO DISPONÍVEL: 26/06/2001
meudominio.inf.br: DISPONÍVEL
meudominio.me: NÃO DISPONÍVEL: 24/09/2007
meudominio.us: NÃO DISPONÍVEL: 15/02/1985
meudominio.ca: NÃO DISPONÍVEL: 14/05/1987
meudominio.it: NÃO DISPONÍVEL: 23/12/1987
meudominio.live: NÃO DISPONÍVEL: 25/06/2015
meudominio.digital: NÃO DISPONÍVEL: 17/04/2014

Obs.: Para sair pressione ^C


*) Digite o domínio (com sufixo '.com.br' ou sem): 
```

