package Model;

public class Hamster extends Pet {

    static final Genus genus_name = Genus.HAMSTER;

    public Hamster(String name, String birthday, String command) {
        super(name, birthday, command);
    }

    public Hamster(String name, String birthday) {
        super(name, birthday);
    }

    public Hamster() {
    }

    public Genus getGenus() {
        return genus_name;
    }

    @Override
    public String toString() {
        return "Hamster [name=" + name + ", birthday=" + birthday + ", command=" + command + "]";
    }

}
