# Tested on a Linux machine
# not sure how this would work in Mac or Windows (maybe might work in WSL)
current_dir = $(shell pwd)

.PHONY: lint test setup clean
lint:
	luacheck ./lua
test: setup
	nvim --headless -u ${current_dir}/tests/minimal.vim -c "PlenaryBustedDirectory tests/diagnosticls-configs { minimal_init = '${current_dir}/tests/minimal.vim' }"
setup: tests/nvim-data/autoload tests/nvim-data/plugged
	nvim --headless -u ${current_dir}/tests/minimal.vim +PlugInstall +qa
tests/nvim-data/autoload:
	mkdir -p tests/nvim-data/autoload
tests/nvim-data/plugged:
	mkdir -p tests/nvim-data/plugged
clean:
	rm -rfv tests/nvim-data
