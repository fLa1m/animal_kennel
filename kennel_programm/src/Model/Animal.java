package Model;

public abstract class Animal {
    public static int count = 0;
    {
        count += 1;
    }

    public String name;
    public String birthday;
    public String command;
    

    public Animal(String name, String birthday, String command) {
        this.name = name;
        this.birthday = birthday;
        this.command = command;
    }

    public Animal(String name, String birthday) {
        this.name = name;
        this.birthday = birthday;
    }

    public Animal(){}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getCommand() {
        return command;
    }

    public void setCommand(String command) {
        this.command = this.command.trim() + " " + command;
    }

    public int getCount() {
        return count;
    }

    @Override
    public String toString() {
        return "Animal [name=" + name + ", birthday=" + birthday + ", command=" + command + "]";
    }
}
