package Services;

import Model.MailContent;
import com.mailjet.client.ClientOptions;
import com.mailjet.client.MailjetClient;
import com.mailjet.client.MailjetRequest;
import com.mailjet.client.errors.MailjetException;
import com.mailjet.client.errors.MailjetSocketTimeoutException;
import com.mailjet.client.resource.Emailv31;
import org.json.JSONArray;
import org.json.JSONObject;

public class MailService {
    private static MailjetClient mailjetClient;

    public MailService() {
        if(mailjetClient == null) {
            mailjetClient = new MailjetClient("0591f9ae8b4baee079a7e6611a0a33dd", "5275379b3822d8e9a6acb1cd5bf09904", new ClientOptions("v3.1"));
        }
    }

    public void send(String guessMail, MailContent mailContent) throws MailjetSocketTimeoutException, MailjetException {
        MailjetRequest request = new MailjetRequest(Emailv31.resource)
                .property(Emailv31.MESSAGES, new JSONArray()
                .put(new JSONObject()
                        .put(Emailv31.Message.FROM, new JSONObject()
                                .put("Email", "quangtho23062002@gmail.com")
                                .put("Name", "Furniture"))
                        .put(Emailv31.Message.TO, new JSONArray()
                                .put(new JSONObject()
                                        .put("Email", guessMail)
                                        .put("Name", "Guess")
                                ))
                        .put(Emailv31.Message.SUBJECT, mailContent.getSubject())
                        .put(Emailv31.Message.TEXTPART, mailContent.getContent())
                        .put(Emailv31.Message.CUSTOMID, "AppGettingStartedTest")));

        mailjetClient.post(request);

    }
}
