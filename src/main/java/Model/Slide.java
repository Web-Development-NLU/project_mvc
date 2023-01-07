package Model;

public class Slide extends BaseModel{

    private String title;
    private String subtitle;
    private String banner;
    private String action;
    private String redirect;

    public Slide() {}

    public Slide(String title, String subtitle, String banner, String action, String redirect) {
        super();
        this.title = title;
        this.subtitle = subtitle;
        this.banner = banner;
        this.action = action;
        this.redirect = redirect;
    }

    public String getTitle() {
        return title;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public String getBanner() {
        return banner;
    }

    public String getAction() {
        return action;
    }

    public String getRedirect() {
        return redirect;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setSubtitle(String subTitle) {
        this.subtitle = subTitle;
    }

    public void setBanner(String banner) {
        this.banner = banner;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public void setRedirect(String redirect) {
        this.redirect = redirect;
    }
}
