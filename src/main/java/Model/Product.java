package Model;

import java.time.LocalDate;

public class Product extends BaseModelUUID {

    private String name;
    private double price;
    private String shortDescription;
    private int size;
    private int status;
    private String description;
    private String dimensions;
    private String material;
    private String thumbnail;
    private int categoryId;
    private double avg;

    public Product() {
    }

    public Product(String name, double price, String shortDescription, int size, int status, String description, String dimensions, String material, String thumbnail, int categoryId) {
        super();
        this.name = name;
        this.price = price;
        this.shortDescription = shortDescription;
        this.size = size;
        this.status = status;
        this.description = description;
        this.dimensions = dimensions;
        this.material = material;
        this.thumbnail = thumbnail;
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public int getSize() {
        return size;
    }

    public int getStatus() {
        return status;
    }

    public String getDescription() {
        return description;
    }

    public String getDimensions() {
        return dimensions;
    }

    public String getMaterial() {
        return material;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public int getCategoryId() {
        return categoryId;
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

    public void setDimensions(String demensions) {
        this.dimensions = demensions;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public double getAvg() {
        return avg;
    }

    public void setAvg(double avg) {
        this.avg = avg;
    }

    @Override
    public boolean equals(Object obj) {
        return this.id.equals(((Product) obj).getId());
    }
}
