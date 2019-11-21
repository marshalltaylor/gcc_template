REPO_ROOT = ../..

SOURCES := \
main.cpp

INCLUDE_PATHS := \
.

# Pull in common rules
include $(REPO_ROOT)/common.mk

$(OUTPUT_DIR)/$(UNIT_NAME): build $(OBJECTS)
	@echo "#### Creating executable"
	@mkdir -p $(@D)
	$(CPP) $(CPPFLAGS) $(INCLUDE) $(LDFLAGS) -o $(OUTPUT_DIR)/$(UNIT_NAME) $(OBJECTS)