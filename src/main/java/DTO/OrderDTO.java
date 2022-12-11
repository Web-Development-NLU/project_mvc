package DTO;

public class OrderDTO {
    private int price;
    private String name;
    private String email;

    public OrderDTO() {
    }

    public OrderDTO(int price, String name, String email) {
        this.price = price;
        this.name = name;
        this.email = email;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public String getName() {
        return name;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
}
