#!/bin/bash

#powloka=$SHELL


if grep -qxF "exec zsh" "$HOME/.bashrc" || "$SHELL"="/usr/bin/zsh"; then
    grep -qxF "source ~/.bashrc" ".zshrc";
    else echo -e "\nsource ~/.bashrc" >> ~/.zshrc;
fi


if grep -qxF "exec fish" "$HOME/.bashrc" || "$SHELL"="/usr/bin/fish"; then
    grep -qxF "source ~/.bashrc" ".config/fish/config.fish";
    else echo "Dodawanie nowej linii do pliku..."; echo -e "\nsource ~/.bashrc" >> ~/.config/fish/config.fish;
fi


    # Zapytanie użytkownika o alias i jego polecenie
read -p "Podaj alias: " alias_name
read -p "Podaj polecenie: " alias_command

# Dodanie aliasu do pliku .bash_aliases
echo "alias $alias_name='$alias_command'" >> ~/.bash_aliases

# Przeładowanie pliku .bashrc, aby załadować nowe aliasy
source ~/.bashrc


: '
# Wybor powloki
while true; do
  clear;
  echo "Wybierz typ powloki jakia uzywasz"
  read -p " 1. BASH `echo $'\n '`2. ZSH `echo $'\n '`3. FISH `echo $'\n '`N/n: Nie chce dodawac aliasu `echo $'\n '`Wybierz akcje: " choose_shell
  case $choose_distro in
    [1] ) ""
      break;;
    [2] ) sudo dnf install fish;
      break;;
    [3] ) if grep -qxF "source ~/.bashrc" ".config/fish/config.fish"; then
            echo "Linia już istnieje w pliku."
          else
            echo "Dodawanie nowej linii do pliku..."
            echo -e "\nsource ~/.bashrc" >> ~/.config/fish/config.fish
          fi
      break;;
    [nN] ) exit;;
    * ) echo "Wybierz 1, 2, 3 lub N";;
esac
done

# Utworzenie pliku .bash_aliases, jeśli nie istnieje
touch ~/.bash_aliases

# Zapytanie użytkownika o alias i jego polecenie
read -p "Podaj alias: " alias_name
read -p "Podaj polecenie: " alias_command

# Dodanie aliasu do pliku .bash_aliases
echo "alias $alias_name='$alias_command'" >> ~/.bash_aliases

# Przeładowanie pliku .bashrc, aby załadować nowe aliasy
source ~/.bashrc
'
