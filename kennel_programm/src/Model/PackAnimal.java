package Model;

public class PackAnimal extends Animal {

    static final String type = "Pack animal";

    public PackAnimal(String name, String birthday, String command) {
        super(name, birthday, command);
    }

    public PackAnimal(String name, String birthday) {
        super(name, birthday);
    }

    public PackAnimal() {
    }

    public String getType() {
        return type;
    }

    @Override
    public String toString() {
        return getType();
    }

}
