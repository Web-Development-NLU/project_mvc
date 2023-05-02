package DTO;
public class ProductOrderDTO {
    private int id;
    private String orderId;
    private String productId;
    private String name;
    private String image;
    private String pattern;
    private String color;
    private int amount;
    private double price;

    public ProductOrderDTO() {}
    public ProductOrderDTO(int id, String orderId, String productId, String name, String image, String pattern, String color, int amount, double price) {
        this.id = id;
        this.orderId = orderId;
        this.productId = productId;
        this.name = name;
        this.image = image;
        this.pattern = pattern;
        this.color = color;
        this.amount = amount;
        this.price = price;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public String getOrderId() {
        return orderId;
    }

    public String getProductId() {
        return productId;
    }

    public String getName() {
        return name;
    }

    public String getImage() {
        return image;
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

    public void setId(int id) {
        this.id = id;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setImage(String image) {
        this.image = image;
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
}
