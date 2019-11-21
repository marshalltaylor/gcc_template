default: binary

REPO_ROOT = ../..

SOURCES := \
main.cpp

INCLUDE_PATHS := \
. \
$(REPO_ROOT)/lib/c_thing \

UNIT_NAME := myProgram

BUILD_LIBS = \
$(REPO_ROOT)/lib/c_thing/build/output/c_thing_lib.a \

# Pull in common rules
include $(REPO_ROOT)/common.mk
include $(REPO_ROOT)/catalog.mk

.phony: libs

libs: $(BUILD_LIBS)

clean: clean_unit
	make -C $(REPO_ROOT)/lib/c_thing clean_unit

binary: build libs $(OUTPUT_DIR)/$(UNIT_NAME)

$(OUTPUT_DIR)/$(UNIT_NAME): build $(OBJECTS)
	@echo "#### Creating executable"
	@mkdir -p $(@D)
	$(CPP) $(CPPFLAGS) $(INCLUDE) $(LDFLAGS) $(OBJECTS) $(BUILD_LIBS) -o $(OUTPUT_DIR)/$(UNIT_NAME)
	$(OBJD) -S --disassemble $@ > $@.dump

appInfo:
	@echo ""
