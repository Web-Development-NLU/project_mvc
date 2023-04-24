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

//        if (!password.matches("\\.*[aA-zZ0-9].*") || !password.matches("\\.*\\w*[A-Z].*") ||
//                !password.matches("\\.*[a-z].*")) {
//
//            return false;
//        }
//        return true;
    }

//    public static void main(String[] args) {
//        Utils u = new Utils();
//        System.out.print(u.handleCheckPasswordIsValid("123TTTTa"));
//    }

}
