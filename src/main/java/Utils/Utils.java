package Utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Utils {
    public boolean handleCheckPasswordIsValid(String password) {
        String regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{6,}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(password);
        if (matcher.matches()) {
            return true;
        }
        return false;


    }
}
