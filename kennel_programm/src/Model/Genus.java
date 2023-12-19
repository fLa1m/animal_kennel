package Model;

public enum Genus {
    CAT ("Cat"), 
    DOG ("Dog"),
    HAMSTER ("Hamster"), 
    HORSE ("Horse"), 
    CAMEL ("Camel"), 
    DONKEY ("Donkey");

    private String title;

    private Genus(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        return title;
    }

    
}
