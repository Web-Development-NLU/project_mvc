package DTO;

public class CartDTO {
    private String name;
    private int amount;
    private String id;
    private double price;


    public CartDTO(String name, String id, double price) {
        this.name = name;
        this.amount = 1;
        this.id = id;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public int getAmount() {
        return amount;
    }

    public String getId() {
        return id;
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

    public void setId(String id) {
        this.id = id;
    }
}
