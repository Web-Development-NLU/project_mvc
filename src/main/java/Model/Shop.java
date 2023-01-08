package Model;

public class Shop extends BaseModel{

    private String name;
    private String image;
    private String redirect;
    private int type;

    public Shop(){}

    public Shop(String name, String image, String redirect, int type) {
        super();
        this.name = name;
        this.image = image;
        this.redirect = redirect;
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public String getImage() {
        return image;
    }

    public String getRedirect() {
        return redirect;
    }

    public int getType() {
        return type;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setRedirect(String redirect) {
        this.redirect = redirect;
    }

    public void setType(int type) {
        this.type = type;
    }
}
