# Создать два текстовых файла: "Pets"(Домашние животные) и "Pack animals"(вьючные животные), 
# используя команду cat в терминале Linux. В первом файле перечислить собак, кошек и хомяков. 
# Во втором — лошадей, верблюдов и ослов.
mkdir animal_kennel
cd animal_kennel/
cat > Pets.txt
Dogs: Fido, Buddy, Bella
Cats: Whiskers, Smudge, Oliver
Hamsters: Hammy, Peanut
cat > PackAnimals.txt
Horses: Thunder, Storm, Blaze
Camels: Sandy, Dune, Sahara
Donkeys: Eeyore, Burro
# Объединить содержимое этих двух файлов в один и просмотреть его содержимое.
cat Pets.txt PackAnimals.txt > human_friends.txt
cat human_friends.txt
# Переименовать получившийся файл в "HumanFriends".
mv human_friends.txt HumanFriends.txt
# Создать новую директорию и переместить туда файл "HumanFriends".
mkdir temp
mv HumanFriends.txt /home/park/animal_kennel/temp
# Подключить дополнительный репозиторий MySQL и установить один из пакетов из этого репозитория.
sudo apt update
wget https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb
sudo apt install ./mysql-apt-config_0.8.12-1_all.deb
sudo apt update
# Установить и затем удалить deb-пакет, используя команду dpkg.
wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j_8.0.32-1ubuntu22.04_all.deb
sudo dpkg -i mysql-connector-j_8.0.32-1ubuntu22.04_all.deb
sudo apt -f install
sudo dpkg -r mysql-connector-j
sudo apt-get autoremove
# Сохранить и выложить историю ваших терминальных команд в Ubuntu.
1097  mkdir animal_kennel
1098  ls
1099  cd animal_kennel/
1100  ls
1101  cat > pets.txt
1102  cat pets.txt
1103  nano pets.txt
1104  cat pets.txt
1105  cat > pack_animals.txt
1106  cat pack_animals.txt
1107  cat pets.txt pack_animals.txt > human_friends.txt
1108  cat human_friends.txt
1109  ls
1110  mv pets.txt Pets.txt
1111  ls
1112  mv pack_animals.txt PackAnimals.txt
1113  mv human_friends.txt HumanFriends.txt
1114  ls
1115  mkdir temp
1116  cd temp/
1117  pwd
1118  cd .
1119  cd ..
1120  mv HumanFriends.txt /home/park/animal_kennel/temp
1121  ls
1122  cd temp/
1123  ls
1124  cd
1125  sudo apt update
1126  sudo apt install mysql-server
1127  sudo apt-get remove --purge mysql-server
1128  wget https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb
1129  sudo apt install ./mysql-apt-config_0.8.12-1_all.deb
1130  sudo apt update
1131  mysql --version
1132  lsb_release -a
1133  wget https://dev.mysql.com/downloads/connector/j/mysql-connector-j_8.2.0-1ubuntu22.04_all.deb
1134  wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j_8.0.32-1ubuntu22.04_all.deb
1135  sudo dpkg - i mysql-connector-j_8.0.32-1ubuntu22.04_all.deb
1136  sudo dpkg -i mysql-connector-j_8.0.32-1ubuntu22.04_all.deb
1137  sudo apt -f install
1138  sudo dpkg -r mysql-connector-j
1139  sudo apt-get autoremove
1140  histiry
1141  history