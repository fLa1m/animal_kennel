package Service;

import java.util.ArrayList;
import java.util.List;
import Model.*;
import View.View;

public class AnimalService {

    public List<Animal> animalList = new ArrayList<>();
    private Input input = new Input();
    private View view = new View();
    
    public String setName() {
        System.out.println("Введите имя животного.");
        System.out.print(">>> ");
        String name = input.scan();
        return name;
    }

    public String setBirthday() {
        System.out.println("Введите дату рождения животного.");
        System.out.print(">>> ");
        String birthday = input.scan();
        return birthday;
    }

    public String setCommand() {
        System.out.println("Введите новую команду");
        System.out.print(">>> ");
        String command = input.scan();
        return command;
    }

    public Integer selectGen() {
        view.genusMenu();
        System.out.println();
        System.out.println("Выберете вид животного.");
        System.out.print(">>> ");
        Integer selectGenus = Integer.parseInt(input.scan());
        return selectGenus;
    }

    public List<Animal> read(){
        return animalList;
    }

    public void addCommand(String name, String command) {
        for (Animal animal : animalList) {
            if (animal.getName().equals(name)) {
                animal.setCommand(command);
            }
        }
    }

    public void showCommands(String name){
        for (Animal animal : animalList) {
            if (animal.getName().equals(name)) {
                System.out.println(animal.getCommand());
            } else {
                System.out.println("Такого животного нет.");
            }
        }
    }

    public void showAnimals(String bday){
        for (Animal animal : animalList) {
            if (animal.getBirthday().equals(bday)) {
                System.out.println(animal.toString());
            } else {
                System.out.println("Такого животного нет.");
            }
        }
    }

    public int showCount(){
        return Animal.count;
    }

}
