package Model;


public class Pet extends Animal {

    static final String type = "Pet";

    public Pet(String name, String birthday, String command) {
        super(name, birthday, command);
    }

    public Pet(String name, String birthday) {
        super(name, birthday);
    }

    public Pet(){
        
    }

    public String getType() {
        return type;
    }

    @Override
    public String toString() {
        return getType();
    }
   
}
