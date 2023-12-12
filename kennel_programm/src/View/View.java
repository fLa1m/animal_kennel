package View;

import java.util.Arrays;
import java.util.List;
import java.util.ListIterator;
import Model.*;

public class View {
    
    public void menu() {
        MenuCommands menuCommands = new MenuCommands();
        ListIterator<String> it = menuCommands.getMenu().listIterator();
        while (it.hasNext()) {
            System.out.println(it.nextIndex()+1 + ". " + it.next());
        }
    }

    public void genusMenu() {
        List<Genus> genus = Arrays.asList(Genus.values());
        ListIterator<Genus> it = genus.listIterator();
        while (it.hasNext()) {
            System.out.println(it.nextIndex()+1 + ". " + it.next());
        }
    }
}
