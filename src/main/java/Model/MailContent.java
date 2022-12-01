package Model;

public class MailContent {
    private String subject;
    private String content;

    public MailContent(String subject, String content) {
        this.subject = subject;
        this.content = content;
    }

    public String getSubject() {
        return subject;
    }

    public String getContent() {
        return content;
    }
}
