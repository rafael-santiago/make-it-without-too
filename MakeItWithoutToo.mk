#
# Copyright (c) 2020, Rafael Santiago
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.
#
# This is a well-simple abstraction to make make suckless. During years a lived with this
# horrible tool and still nowadays due to people over there use this piece of shit yet,
# people love chocolate buddy!! yeah...I need to keep on using it (when I am working with
# others and oldies or when I need that people without more knowledge of other stuff than
# the flat-earth make be able to build some stuff I have done).
#
# Since 2020 it was being useful to me and I am using it over there in projects that I
# have been working (hobby, professionally etc). Sometimes I customize some stuff, anyway,
# the base of my suckless effort with make is this make script here.
#
# It is related to C and C++.
#
# Yes, this is a pun with "Make it wit chu" from "Queens of The Stone Age"... sarcasm is my
# thing. I hope it helps you make your make suckless.
#
# It was not designed to work on with autotools, if you are using autotools stop on drugs...
# Gosh! "I wanna make it, I wanna make it - without GNU autotOolSsss!!!!" ;)
#
# All you need to do is include this file at the end of your Makefile, but your Makefile
# must be reduced, yes!! Amem! without all that crazy shit! Follows:
#
#                      REQUIRED DEFINITION     |     MAKEFILE SNIPPET
#               -------------------------------+----------------------------------------- W
#               The language type (c or c++)   |     LANG=C                               H
#               The object directory           |     OBJDIR = .o                          O
#               The binary directory           |     BINDIR = bin                         L
#               The binary name                |     BINARY = foo.a                       E
#               The CXXFLAGS or CFLAGS         |     CFLAGS = -DFOO=1                     M
#               The LXXFLAGS or LDFLAGS        |     LDFLAGS = -lbar -Lsys/lib/bar/       A
#               Include this template          |     include ../build/MakeItWithoutToo.mk K
#               -------------------------------+----------------------------------------- E :)
#
#               If you want to have platform dependent codes place them inside a subdirectory
#               named with the platform name, e.g. 'windows', 'linux'.
#
#               If you want to implement tests place the tests inside a subdirectory named
#               as 'test'.
#
#               By default tests are executed, if you want to skip it define skip-tests
#               at the make calling moment, e.g. 'make skip-tests=yes'.
#
#               Some projects depends on building its own dependencies or even run additional
#               steps before and/or after its artifact(s) generating. There are two windows
#               that allow you fit your custom rules at the moment of those two build task
#               events: CUSTOM_RULES_PROLOGUE and CUSTOM_RULES_EPILOGUE. Just set those
#               variables with your own previously defined make rule(s).
#
#               Supposing you need to build a lib called "coisa" that your artifact depends on...
#               in your Makefile you need to just putting on the following:
#               CUSTOM_RULES_PROLOGUE=makemycoisa
#               ...
#
#               makemycoisa: (...)
#               (it is up to you)
#               ...
#
#               Supposing you need to sign the artifact after generating it and deploying, too:
#               CUSTOM_RULES_EPILOGUE=dosign deploy
#               ...
#
#               dosign: (...)
#               (it is up to you)
#               ...
#
#               deploy: (...)
#               (it is up to you)
#               ...
#
#               You can override the test running command by setting TESTRUNCMD as follows:
#               TESTRUNCMD=`echo data | test-binary`
#
AR = ar
NATIVE_SRC = $(shell uname -s | tr '[:upper:]' '[:lower:]' | sed 's/^mingw.*/windows/g')

ifndef LANG
    $(error $$LANG not defined)
endif

ifeq ($(LANG),$(filter $(LANG),CPP cpp CPP CXX C++ c++ cc CC))
    PICKED_CC=$(CXX)
    PICKED_CCFLAGS=$(CXXFLAGS)
    PICKED_CCLDFLAGS=$(LXXFLAGS)
    PICKED_CCEXT=.cpp
else ifeq ($(LANG),$(filter $(LANG),c C))
    PICKED_CC=$(CC)
    PICKED_CCFLAGS=$(CFLAGS)
    PICKED_CCLDFLAGS=$(LDFLAGS)
    PICKED_CCEXT=.c
endif

ifndef PICKED_CC
    $(error Language not specified in right way. It must to be '$$LANG=c' or '$$LANG=c++')
endif

SOURCES := $(wildcard *$(PICKED_CCEXT))
SOURCES += $(wildcard $(NATIVE_SRC)/*$(PICKED_CCEXT))
OBJECTS := $(patsubst %$(PICKED_CCEXT), $(OBJDIR)/%.o,$(SOURCES))

TESTRUNCMD ?= find . -executable -type f

all: $(CUSTOM_RULES_PROLOGUE) setup $(BINARY) $(CUSTOM_RULES_EPILOGUE) test

setup:
	@mkdir -p $(OBJDIR)
	@mkdir -p $(BINDIR)

test:
ifndef skip-tests
	@if [ -d "test" ]; then \
	    cd test && gmake && cd bin && `$(TESTRUNCMD)` ;\
	fi
endif

$(BINARY): $(OBJDIR)/$(OBJECTS)
ifeq ($(suffix $(BINARY)),.a)
	@$(AR) -r $(BINDIR)/$(BINARY) $(OBJECTS) 2>&1
else
	@$(PICKED_CC) -o$(BINDIR)/$(BINARY) $(OBJECTS) $(PICKED_CCLDFLAGS) 2>&1
endif
	@echo ____
	@echo $(BINARY) created at $(BINDIR)/$(BINARY)

$(OBJDIR)/%.o: %$(PICKED_CCEXT)
	@mkdir -p $(@D)
	$(PICKED_CC) $(PICKED_CCFLAGS) -c $< -o $@

clean:
	@rm -rf $(OBJDIR)
	@rm -f $(BINDIR)/$(BINARY)

.PHONY: test
