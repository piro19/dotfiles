DOTFILE_ROOT := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES   := $(wildcard .??*)
EXCLUSIONS   := .DS_Store .git .travis.yml
DOTFILES     := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

.DEFAULT_GOAL := help

list: ## Show dot files
	@$(foreach val, $(DOTFILES), ls -dF $(val);)

install: ## Create symlink
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

clean: ## Remove dot files
	@$(foreach val, $(DOTFILES), rm -v $(HOME)/$(val);)

help: ## Show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
