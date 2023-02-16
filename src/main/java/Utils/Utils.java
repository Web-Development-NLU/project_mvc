package Utils;

public class Utils {
    public  boolean handleCheckPasswordIsValid(String password) {
        if (!password.matches("\\.*[aA-zZ0-9].*") || !password.matches("\\.*\\w*[A-Z].*")) {

            return false;
        }
        return true;
    }
}
