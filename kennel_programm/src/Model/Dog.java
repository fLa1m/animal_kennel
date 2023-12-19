package Model;

public class Dog extends Pet {

    static final Genus genus_name = Genus.DOG;

    public Dog(String name, String birthday, String command) {
        super(name, birthday, command);
    }

    public Dog(String name, String birthday) {
        super(name, birthday);
    }

    public Dog() {
    }
    
    public Genus getGenus() {
        return genus_name;
    }

    @Override
    public String toString() {
        return "Dog [name=" + name + ", birthday=" + birthday + ", command=" + command + "]";
    }

}
