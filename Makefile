NIXOS_CONFIG_DIR := /etc/nixos
DOTFILES_DIR     := ~/dotfiles

.PHONY: all help clean link disko-install

all: help

help:
	@echo "Usage:"
	@echo "  make disko-install FLAKE_ATTR=<flake-attribute> DISK_NAME=<disk-name> DISK_DEVICE=<disk-device>"
	@echo "  make clean"
	@echo "  make link"
	@echo
	@echo "Examples:"
	@echo "  sudo make disko-install FLAKE_ATTR=m920q DISK_NAME=nixos DISK_DEVICE=/dev/sda"
	@echo "  make link"
	@echo "  sudo make clean link"

clean:
	@echo "Cleaning up existing NixOS configuration at $(NIXOS_CONFIG_DIR)..."
	sudo rm -rf $(NIXOS_CONFIG_DIR)

link:
	@echo "Creating symlink from $(DOTFILES_DIR) to $(NIXOS_CONFIG_DIR)..."
	sudo ln -sfn $(DOTFILES_DIR) $(NIXOS_CONFIG_DIR)

# Run disko-install with validated parameters
disko-install:
ifndef FLAKE_ATTR
	$(error FLAKE_ATTR is not set. Usage: make disko-install FLAKE_ATTR=<flake-attribute> DISK_NAME=<disk-name> DISK_DEVICE=<disk-device>)
endif
ifndef DISK_NAME
	$(error DISK_NAME is not set. Usage: make disko-install FLAKE_ATTR=<flake-attribute> DISK_NAME=<disk-name> DISK_DEVICE=<disk-device>)
endif
ifndef DISK_DEVICE
	$(error DISK_DEVICE is not set. Usage: make disko-install FLAKE_ATTR=<flake-attribute> DISK_NAME=<disk-name> DISK_DEVICE=<disk-device>)
endif
	sudo nix run 'github:nix-community/disko/latest#disko-install' -- --flake .#$(FLAKE_ATTR) --disk $(DISK_NAME) $(DISK_DEVICE)
