.PHONY: all clean link

NIXOS_CONFIG_DIR := /etc/nixos
DOTFILES_DIR := ~/dotfiles

all: clean link

clean:
	@echo "Cleaning up existing NixOS configuration at $(NIXOS_CONFIG_DIR)..."
	sudo rm -rf $(NIXOS_CONFIG_DIR)

link:
	@echo "Creating symlink from $(DOTFILES_DIR) to $(NIXOS_CONFIG_DIR)..."
	sudo ln -sfn $(DOTFILES_DIR) $(NIXOS_CONFIG_DIR)