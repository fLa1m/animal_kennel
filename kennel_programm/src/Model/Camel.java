package Model;

public class Camel extends PackAnimal {

    static final Genus genus_name = Genus.CAMEL;

    public Camel(String name, String birthday, String command) {
        super(name, birthday, command);
    }

    public Camel(String name, String birthday) {
        super(name, birthday);
    }

    public Camel() {
    }

    public Genus getGenus() {
        return genus_name;
    }

    @Override
    public String toString() {
        return "Camel [name=" + name + ", birthday=" + birthday + ", command=" + command + "]";
    }

}
