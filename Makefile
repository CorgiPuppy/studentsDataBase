REPORT_DIR := report

RPRT := $(REPORT_DIR)/report.pdf
SRC := main.cpp

CPPC := g++
CPPFLAGS := -std=c++20
LDFLAGS := -lgtest -lgtest_main -pthread
TPST := typst compile --root .
ZTHR := zathura

.PHONY: all

all: clean-report run-src run-report

run-src:
	@echo "Running.."
	@$(CPPC) $(CPPFLAGS) $(SRC) $(LDFLAGS) -o main.out
	@./main.out --test

run-report: $(RPRT)
	@echo "Running a report.."
	@$(ZTHR) $<

$(RPRT): $(REPORT_DIR)/*.typ
	@echo "Building pdf.."
	@$(TPST) $<

clean-report:
	@echo "Cleaning the report.."
	@$(RM) $(RPRT)
