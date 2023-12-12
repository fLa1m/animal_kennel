package Model;

public class Horse extends PackAnimal {

    static final Genus genus_name = Genus.HORSE;

    public Horse(String name, String birthday, String command) {
        super(name, birthday, command);
    }

    public Horse(String name, String birthday) {
        super(name, birthday);
    }

    public Horse() {
    }

    public Genus getGenus() {
        return genus_name;
    }

    @Override
    public String toString() {
        return "Horse [name=" + name + ", birthday=" + birthday + ", command=" + command + "]";
    }
}
