# Copyright 2017 The OpenSSL Project Authors. All Rights Reserved.
#
#Location of the openssl version we are using. May not be the same as the system
#version
OSSLDIR= /usr/local/ssl
CC= gcc
CFLAGS= -I$(OSSLDIR)/include -L$(OSSLDIR)/lib -g -lcrypto -lssl

#No exe's to build yet
EXE=

BOOKELEMS= openssl-book.tex \
	foundations/getting/getting.tex

all: openssl-book.pdf

$(EXE): %: %.c
	$(CC) -o $@ $< $(CFLAGS)

#We run this twice to ensure that any references etc are updated
openssl-book.pdf: $(BOOKELEMS) $(EXE)
	pdflatex openssl-book
	pdflatex openssl-book

code: $(EXE)

clean-code:
	rm $(EXE)

clean-book:
	rm openssl-book.pdf openssl-book.log openssl-book.aux openssl-book.out

#Add clean-code here when we actually have code to clean
clean: clean-book
