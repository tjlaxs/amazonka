ifndef TOP
$(error TOP is not set)
endif

SHELL   := /usr/bin/env bash
SANDBOX := $(TOP)/.cabal-sandbox

build:
	cabal build

install: cabal.sandbox.config
	cabal install -j \
 --disable-documentation \
 --disable-library-coverage \
 --only-dependencies \
 --avoid-reinstalls

cabal.sandbox.config:
	cabal sandbox init --sandbox=$(SANDBOX)

clean:
	cabal clean
	rm -f cabal.sandbox.config

doc:
	cabal haddock
