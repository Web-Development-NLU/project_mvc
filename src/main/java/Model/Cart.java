package Model;

public class Cart extends BaseModel{
    private String idUser;
    private String idProduct;
    private String pattern;
    private String size;
    private String color;
    private int amount;
    public Cart() {
    }

    public Cart(String idUser, String idProduct, String pattern, String size, String color, int amount) {
        this.idUser = idUser;
        this.idProduct = idProduct;
        this.pattern = pattern;
        this.size = size;
        this.color = color;
        this.amount = amount;
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

    public String getSize() {
        return size;
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

    public void setSize(String size) {
        this.size = size;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
