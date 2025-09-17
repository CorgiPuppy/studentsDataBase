SRC_DIR := src
INC_DIR := include
TARGET_DIR := target
REPORT_DIR := report

RPRT := $(REPORT_DIR)/report.pdf
EXE := $(TARGET_DIR)/main
INC := $(wildcard $(INC_DIR)/*.h)
SRC := $(wildcard $(SRC_DIR)/*.cpp)
OBJ := $(patsubst $(SRC_DIR)/%.cpp, $(TARGET_DIR)/%.o, $(SRC))

CPPC := g++
CPPFLAGS := -std=c++20
LDFLAGS := -pthread -lgtest -lgtest_main
TPST := typst compile --root .
ZTHR := zathura

.PHONY: all

all: clean-report run-src run-report clean-target

run-src: $(EXE)
	@echo "Running.."
	@./$< --test

$(EXE): $(OBJ) | $(TARGET_DIR)
	@echo "Building binaries.."
	@$(CPPC) $(OBJ) -o $@ $(LDFLAGS)

$(TARGET_DIR)/%.o: $(SRC_DIR)/%.cpp $(INC) | $(TARGET_DIR)
	@echo "Building objects.."
	@$(CPPC) $(CPPFLAGS) -c $< -o $@

$(TARGET_DIR):
	@echo "Create a target dir.."
	@mkdir -p $@

run-report: $(RPRT)
	@echo "Running a report.."
	@$(ZTHR) $<

$(RPRT): $(REPORT_DIR)/*.typ
	@echo "Building pdf.."
	@$(TPST) $<

clean-target:
	@echo "Cleaning the target dir.."
	@$(RM) -rv $(TARGET_DIR)

clean-report:
	@echo "Cleaning the report.."
	@$(RM) $(RPRT)
