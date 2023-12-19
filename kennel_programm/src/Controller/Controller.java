package Controller;

import Model.*;
import Service.*;
import View.*;

public class Controller {
    private final View view = new View();
    private final Input in = new Input();
    private final CheckException check = new CheckException();
    private final MenuCommands commands = new MenuCommands();
    private final AnimalService service = new AnimalService();

    public void start() {
        Integer select = 0;
        while (select != 6) {
            view.menu();
            System.out.println("Введите номер команды.");
            System.out.print(">>> ");
            select = Integer.parseInt(in.scan());
            try {
                check.checkInputCommand(select, commands.getMenu());
            } catch (InputException e) {
                System.out.println(e.getMessage());
                System.out.println();
                start();
            }
            if (select == 1) {
                Integer selectGenus = service.selectGen();
                try{
                    check.checkInputCommand(selectGenus, commands.getGenus());
                } catch (InputException e) {
                    System.out.println(e.getMessage());
                    System.out.println();
                    service.selectGen();
                }
                String name = service.setName();
                String bday = service.setBirthday();
                switch (selectGenus) {
                    case 1:
                        Cat cat = new Cat(name, bday, " ");
                        service.animalList.add(cat);
                        break;
                    case 2:
                        Dog dog = new Dog(name, bday, " ");
                        service.animalList.add(dog);
                        break;
                    case 3:
                        Hamster hamster = new Hamster(name, bday, " ");
                        service.animalList.add(hamster);
                        break;
                    case 4:
                        Horse horse = new Horse(name, bday, " ");
                        service.animalList.add(horse);
                        break;
                    case 5:
                        Camel camel = new Camel(name, bday, " ");
                        service.animalList.add(camel);
                        break;
                    case 6:
                        Donkey donkey = new Donkey(name, bday, " ");
                        service.animalList.add(donkey);
                        break;
                }
            }
            if (select == 2) {
                String name = service.setName();
                service.showCommands(name);
            }
            if (select == 3) {
                String name = service.setName();
                String command = service.setCommand();
                service.addCommand(name, command);
            }
            if (select == 4) {
                System.out.println(service.read());
                System.out.println("Счетчик: " + service.showCount());
            }
            if (select == 5) {
                String bday = service.setBirthday();
                service.showAnimals(bday);
            }
        }
    }
}
