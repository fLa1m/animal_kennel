package Model;

public class Donkey extends PackAnimal {

    static final Genus genus_name = Genus.DONKEY;

    public Donkey(String name, String birthday, String command) {
        super(name, birthday, command);
    }

    public Donkey(String name, String birthday) {
        super(name, birthday);
    }

    public Donkey() {
    }

    public Genus getGenus() {
        return genus_name;
    }

    @Override
    public String toString() {
        return "Donkey [name=" + name + ", birthday=" + birthday + ", command=" + command + "]";
    }
}
