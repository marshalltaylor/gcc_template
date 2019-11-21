CC := gcc
CPP := g++
AR = ar
CP = objcopy
OBJD = objdump

#CFLAGS...:= -pedantic-errors -Wall -Wextra -Werror
CPPFLAGS := -v -pedantic-errors -Wall -Wextra -Werror
#LDFLAGS  := -L/usr/lib -lstdc++ -lm
LDFLAGS  := -lstdc++ -lm

BUILD    := ./build
OBJ_DIR  := $(BUILD)/objects
OUTPUT_DIR  := $(BUILD)/output

INCLUDE  := $(addsuffix /,$(addprefix -I, $(INCLUDE_PATHS)))

OBJECTS = $(addprefix $(OBJ_DIR)/, $(addsuffix .o, $(basename $(SOURCES))))

default:
	@echo "common.mk should never build default!"

archive: build $(OUTPUT_DIR)/$(UNIT_NAME).a

$(OBJ_DIR)/%.o: %.cpp
	@echo "#### Compiling $< (CPP)"
	@mkdir -p $(@D)
	$(CPP) $(CPPFLAGS) $(INCLUDE) -o $@ -c $<

$(OBJ_DIR)/%.o: %.c
	@echo "#### Compiling $< (C)"
	@mkdir -p $(@D)
	$(CC) $(CPPFLAGS) $(INCLUDE) -o $@ -c $<

# Archiver
$(OUTPUT_DIR)/$(UNIT_NAME).a: build $(OBJECTS)
	@echo "#### Creating archive"
	@mkdir -p $(@D)
	$(AR) rcs $@ $(OBJECTS)
	$(OBJD) -S --disassemble $@ > $@.dump
	@echo

.PHONY: all build clean_unit debug release

build:
	@mkdir -p $(OUTPUT_DIR)
	@mkdir -p $(OBJ_DIR)

debug: CPPFLAGS += -DDEBUG -g
debug: all

release: CPPFLAGS += -O2
release: all

clean_unit:
	@echo "#### Clean unit: $(UNIT_NAME)"
	-@rm -rvf $(OBJ_DIR)/*
	-@rm -rvf $(OUTPUT_DIR)/*

info:
	@echo "$(INCLUDE)"
