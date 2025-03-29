BUILD_DIR ?= build
SRC_DIR ?= .

ifeq ($(CMAKE_GENERATOR), Ninja)
  BUILD_FILE := $(BUILD_DIR)/build.ninja
  CMAKE_OPTIONS += -G Ninja
else
  # Assume "Unix Makefiles"
  BUILD_FILE := $(BUILD_DIR)/Makefile
endif

define create_rule
.PHONY: $(1)
$(1): $$(BUILD_FILE)
	cmake --build $$(<D) --target $(1) -- $$(BUILD_OPTIONS)
endef

$(foreach goal,$(filter-out clean default,$(MAKECMDGOALS)),$(eval $(call create_rule,$(goal))))

default: $(BUILD_FILE)
	cmake --build $(<D) $(addprefix --target ,$(BUILD_TARGETS)) -- $(BUILD_OPTIONS)

$(BUILD_FILE): $(SRC_DIR)/CMakeLists.txt
	cmake -S $(<D) -B $(@D) $(CMAKE_OPTIONS)

clean:
	$(RM) -r $(BUILD_DIR)

.PHONY: build clean default
