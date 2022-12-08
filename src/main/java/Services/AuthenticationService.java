package Services;

import Model.MailContent;
import com.mailjet.client.errors.MailjetException;
import com.mailjet.client.errors.MailjetSocketTimeoutException;
import org.apache.commons.lang3.RandomStringUtils;

public class AuthenticationService {
    private MailService mailService;

    public AuthenticationService() {
        this.mailService = new MailService();
    }

    public void sendVerify(String code, String email){
        MailContent mailContent = new MailContent("FURNITURE VERIFY ACCOUNT","Your code is: " + code);
        try {
            this.mailService.send(email, mailContent);
        } catch (MailjetSocketTimeoutException e) {
            throw new RuntimeException(e);
        } catch (MailjetException e) {
            throw new RuntimeException(e);
        }
    }
}
