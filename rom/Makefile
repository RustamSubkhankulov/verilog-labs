all: help

SRC_DIR = modules
BUILD_DIR = build
PROJECT = romfetch

EXECUTABLE = $(BUILD_DIR)/$(PROJECT).executable

test: $(BUILD_DIR) $(EXECUTABLE)
	./$(EXECUTABLE)
	gtkwave dump.vcd

$(EXECUTABLE): $(wildcard $(SRC_DIR)/*.v)
	iverilog $(^) -o $(@)

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

.PHONY: clean test help 

clean:
	- rm -r $(BUILD_DIR)
	- rm dump.vcd

help:
	@echo "  test  - Run testbench"
	@echo "  clean - Remove generated files"
	@echo "  help  - Display this text"
