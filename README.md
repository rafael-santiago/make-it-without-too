# MakeItWithoutToo

[Oh! English please...](#oh-english-please)

`MakeItWithoutToo.mk` é um `template Make` que tem como intenção fazer o `Make` ser
menos ruim. Durante anos precisando usar essa peça de merda chamada `Make` por aí,
colecionei necessidades práticas que surgiram e as implementei nesse `script`
minimalista e direto ao assunto. Eu tenho usado isso desde `2020`, profissionalmente
(pegando as lições aprendidas nesse `script` e customizando de acordo com a necessidade
dos meus empregadores) e também com minhas próprias coisas (quando quero dar suporte
para o `make`, quase nunca, sendo sincero hahaha!!)

Sinta-se livre em pegar algumas ideias daqui e faça o seu `Make` menos ruim.

Sim, isso é um trocadalho com `"Make it wit chu"` do `"Queens of The Stone Age"`...
sarcasmo é meu negócio. Isso não foi pensado para funcionar com o `autotools`,
se você usa `autotools`: pare de usar drogas... *"I wanna make it, I wanna make it -
without GNU autotOolSsss!!!!"* :wink:

Em geral, assim é como você pode reduzir a fedentina do seu `make`:

```
            DEFINIÇÃO REQUERIDA    |     TRECHO DO MAKEFILE
    -------------------------------+----------------------------------------- W
    Tipo de linguagem (c ou c++)   |     LANG=C                               H
    Diretório dos arquivos objeto  |     OBJDIR = .o                          O
    Diretório do binário           |     BINDIR = bin                         L
    Nome do binário                |     BINARY = foo.a                       E
    As CXXFLAGS ou CFLAGS          |     CFLAGS = -DFOO=1                     M
    As LXXFLAGS ou LDFLAGS         |     LDFLAGS = -lbar -Lsys/lib/bar/       A
    Inclua este template           |     include MakeItWithoutToo.mk          K
    -------------------------------+----------------------------------------- E :)
```

Dentro do diretório `samples` você encontra alguns usos práticos. Mais detalhes
sobre como usar o `script` leia o comentário que encabeça esse arquivo `.mk`

Aproveite! Que seu `make` feda menos!

Rafael

## Oh! English, please...

`MakeItWithoutToo.mk` is a `Make template` that intends to make `Make` `suckless`.
During years having to use this piece of shit called `Make` over there I collected
practical necessities that shown up to me and implemented it in this sharp and simple
`makescript`. I have been using it since `2020`, professionally (by taking the lessons
learned in this script and customizing according the necessities of my employers) and
also with my own stuff (when I want to give support to make, almost never, to be true
hahaha!!)

Feel free on taking some ideas from here and use to make `Make` suckless.

Yes, this is a pun with `"Make it wit chu"` from `"Queens of The Stone Age"`... sarcasm is
my thing. It was not designed to work on with `autotools`, if you are using `autotools`
stop on drugs... *"I wanna make it, I wanna make it - without GNU autotOolSsss!!!!"* :wink:

In general this is how you can reduce the `make` stinks:

```
           REQUIRED DEFINITION     |     MAKEFILE SNIPPET
    -------------------------------+----------------------------------------- W
    The language type (c or c++)   |     LANG=C                               H
    The object directory           |     OBJDIR = .o                          O
    The binary directory           |     BINDIR = bin                         L
    The binary name                |     BINARY = foo.a                       E
    The CXXFLAGS or CFLAGS         |     CFLAGS = -DFOO=1                     M
    The LXXFLAGS or LDFLAGS        |     LDFLAGS = -lbar -Lsys/lib/bar/       A
    Include this template          |     include MakeItWithoutToo.mk          K
    -------------------------------+----------------------------------------- E :)
```

Inside the directory samples you find some practical usages. For more details
on using the `script` read the commentary that heads this `.mk`

Enjoy! I hope your `make` stink less from now on!

Rafael
