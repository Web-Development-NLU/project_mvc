package Model;

public class Product extends BaseModelUUID {
    private String id;
    private String name;
    private double price;
    private String shortDescription;
    private int size;
    private int status;
    private String description;
    private String demensions;
    private String material;
    private int thumbnail;
    private int categoryId;

    public Product(String name, double price, String shortDescription, int size, int status, String description, String demensions, String material, int thumbnail, int categoryId) {
        this.name = name;
        this.price = price;
        this.shortDescription = shortDescription;
        this.size = size;
        this.status = status;
        this.description = description;
        this.demensions = demensions;
        this.material = material;
        this.thumbnail = thumbnail;
        this.categoryId = categoryId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setDemensions(String demensions) {
        this.demensions = demensions;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public void setThumbnail(int thumbnail) {
        this.thumbnail = thumbnail;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
}
