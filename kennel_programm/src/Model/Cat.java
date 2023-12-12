package Model;

public class Cat extends Pet {

    static final Genus genus_name = Genus.CAT;

    public Cat(String name, String birthday, String command) {
        super(name, birthday, command);
    }

    public Cat(String name, String birthday) {
        super(name, birthday);
    }

    public Cat() {
    }

    public Genus getGenus() {
        return genus_name;
    }

    @Override
    public String toString() {
        return "Cat [name=" + name + ", birthday=" + birthday + ", command=" + command + "]";
    }

    

}
