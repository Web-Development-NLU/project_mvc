package Model;

public class Cart extends BaseModel{
    private String idUser;
    private String idProduct;
    private String pattern;
    private String color;
    private int amount;
    private String image;
    public Cart() {
    }

    public Cart(String idUser, String idProduct, String pattern, String color, int amount, String image) {
        this.idUser = idUser;
        this.idProduct = idProduct;
        this.pattern = pattern;
        this.color = color;
        this.amount = amount;
        this.image = image;
    }

    public String getIdUser() {
        return idUser;
    }

    public String getIdProduct() {
        return idProduct;
    }

    public String getPattern() {
        return pattern;
    }

    public String getColor() {
        return color;
    }

    public int getAmount() {
        return amount;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public void setPattern(String pattern) {
        this.pattern = pattern;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
