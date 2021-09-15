premake_options := 
make_options :=
 
ifdef cc
	premake_options += --cc=$(cc)
	premake__bin_options += --cc $(cc)
endif
ifdef os
	premake_options += --os=$(os)
endif
ifdef location
	premake_options += --location=$(location)
else
	location := build
endif
ifdef targetdir
	premake_options += --targetdir=$(targetdir)
endif

ifdef config
	make_options += config=$(config)
endif

premake_filepath=scripts/build/premake5.lua

SOURCE_FILES := src/apps/as-tell.c \
				src/apps/as-exec.c \
				src/apps/as-info.c \
				src/applescript/applescript_placeholder.c \
				src/applescript/applescript.m
				
HEADER_FILES := include/applescript/applescript.h
 

.PHONY: all astyle clean doc gmake help 

ifneq ($(wildcard $(location)/$(MAKECMDGOALS).make),) 
$(MAKECMDGOALS): $(location)/Makefile
	@echo Build target $(MAKECMDGOALS)
	@$(MAKE) -C "$(location)" $(make_options) $(MAKECMDGOALS) 
endif

all: 
	@$(MAKE) -C "$(location)" $(make_options) 

astyle: 
	@astyle --options=scripts/astyle/c.style $(SOURCE_FILES) $(HEADER_FILES)
	
doc: 
	@echo "Generating source documentation"
	@cd scripts/doxygen && doxygen	

$(location):
	@mkdir -p "$(location)"
	
gmake: $(location)
	@premake5 --file=$(premake_filepath) $(premake_options) gmake

clean: 
	@$(MAKE) -C "$(location)" $(make_options)  clean
	
help:
	@echo '------------------------------------------------------------'
	@echo 'libapplescript utility Makefile'
	@echo ' '
	@echo ' Actions'
	@echo ' '
	@echo ' * gmake: Generate Makefiles using premake5'
	@echo '   Options '
	@echo '   * location: Build scripts location'
	@echo '   * targetdir: Location of build output'
	@echo '   * cc: Toolchain to use (gcc, clang)'
	@echo '   * os: Target platform (macosx, linux, ...)'
	@echo '   For more generation options, use premake5 directly'
	@echo ' '
	@echo ' * doc: Generate documentation using Doxygen'
	@echo ' '
	@echo ' * astyle: Format code using Artistic Style (astyle)'
	@echo ' '
	
