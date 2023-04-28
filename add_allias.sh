#!/bin/bash

if grep -qxF "#alias" ".config/fish/config.fish"; then
  sleep 2
  else
  echo -e "\n#alias" >> ~/.config/fish/config.fish
fi

while true; do

read -p "Czy chcesz dodać nowy/kolejny alias " wybierz

case "$wybierz" in
  Y|y )
    read -p "Podaj alias: " alias_name
    read -p "Podaj polecenie: " alias_command
    # Dodanie aliasu do pliku config.fish
    echo "alias $alias_name='$alias_command'" >> ~/.config/fish/config.fish

    # Wyświetlenie komunikatu potwierdzającego dodanie aliasu
    echo "Dodano alias $alias_name do pliku ~/.config/fish/config.fish"
      ;;
    N|n )
    echo "Aliasy dodane."
    break
      ;;
    * )
      echo "Nieprawidłowa odpowiedź, spróbuj ponownie."
      ;;
  esac
done
