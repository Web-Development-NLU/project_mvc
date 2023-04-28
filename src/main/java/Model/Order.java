package Model;

public class Order extends BaseModelUUID {
    private String info;
    private int price;
    private String transID;
    private String username;
    private String country;
    private String city;
    private String district;
    private String address;
    private String phone;
    private String email;
    private String userId;
    private String deliveryId;

    public Order() {
    }

    public Order(String info, int price, String transId, String username, String country, String city, String district, String address, String phone, String email) {
        super();
        this.info = info;
        this.price = price;
        this.transID = transId;
        this.username = username;
        this.country = country;
        this.city = city;
        this.district = district;
        this.address = address;
        this.phone = phone;
        this.email = email;
    }


    public String getInfo() {
        return info;
    }

    public String getDeliveryId() {
        return deliveryId;
    }

    public void setDeliveryId(String deliveryId) {
        this.deliveryId = deliveryId;
    }

    public int getPrice() {
        return price;
    }

    public String getTransID() {
        return transID;
    }

    public String getUsername() {
        return username;
    }

    public String getCountry() {
        return country;
    }

    public String getCity() {
        return city;
    }

    public String getDistrict() {
        return district;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setTransID(String transId) {
        this.transID = transId;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
