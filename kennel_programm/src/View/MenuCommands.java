package View;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import Model.Genus;

public class MenuCommands {

    List<String> menuCommands = new ArrayList<>(Arrays.asList(
            "Добавить животное", "Список команд животного", "Добавить новую команду", "Список животных","Список животных по дате рождения", "Выход"));
    

    List<Genus> genus = Arrays.asList(Genus.values());     
            
    public List<String> getMenu(){
        return menuCommands;
    }

    public List<Genus> getGenus(){
        return genus;
    }
}
