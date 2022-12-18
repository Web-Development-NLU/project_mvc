package DTO;

public class CartDTO {
    private static int auto = 0;
    private int id;
    private String name;
    private int amount = 1;
    private String idProduct;
    private double price;
    private int categoryId;
    private String color;
    private String pattern;
    private String size;

    public CartDTO () {}

    public CartDTO(String name, int amount, String idProduct, double price, int categoryId, String color, String pattern, String size) {
        auto++;
        this.id = auto;
        this.name = name;
        this.amount = amount;
        this.idProduct = idProduct;
        this.price = price;
        this.categoryId = categoryId;
        this.color = color;
        this.pattern = pattern;
        this.size = size;
    }

    public String getName() {
        return name;
    }

    public int getAmount() {
        return amount;
    }

    public double getPrice() {
        return price;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getColor() {
        return color;
    }

    public String getPattern() {
        return pattern;
    }

    public String getSize() {
        return size;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void setPattern(String pattern) {
        this.pattern = pattern;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getId() {
        return id;
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }
}
