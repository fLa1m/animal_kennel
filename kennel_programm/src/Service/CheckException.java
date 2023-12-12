package Service;

import java.util.List;

public class CheckException {
    
    public void checkInputCommand(Integer select, List<?> commands) {
        if(select <= 0 || commands.size() < select) {
            throw new InputException("Такой команды нет. Повторите ввод.");
        }
    }
}
