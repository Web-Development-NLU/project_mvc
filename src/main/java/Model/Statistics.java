package Model;

import java.sql.Timestamp;
import java.time.LocalDate;

public class Statistics {
    private int totalOrder;
    private int totalOrderByDate;
    private int totalSales;
    private int totalSalesByDate;
    private Timestamp createAt;
    private Timestamp updatedAt;


    public Statistics(int totalOrder, int totalOrderByDate, int totalSales, int totalSalesByDate, Timestamp createAt, Timestamp updatedAt) {
        this.totalOrder = totalOrder;
        this.totalOrderByDate = totalOrderByDate;
        this.totalSales = totalSales;
        this.totalSalesByDate = totalSalesByDate;
        this.createAt = createAt;
        this.updatedAt = updatedAt;
    }

    public Statistics() {
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public int getTotalOrder() {
        return totalOrder;
    }

    public void setTotalOrder(int totalOrder) {
        this.totalOrder = totalOrder;
    }

    public int getTotalOrderByDate() {
        return totalOrderByDate;
    }

    public void setTotalOrderByDate(int totalOrderByDate) {
        this.totalOrderByDate = totalOrderByDate;
    }

    public int getTotalSales() {
        return totalSales;
    }

    public void setTotalSales(int totalSales) {
        this.totalSales = totalSales;
    }

    public int getTotalSalesByDate() {
        return totalSalesByDate;
    }

    public void setTotalSalesByDate(int totalSalesByDate) {
        this.totalSalesByDate = totalSalesByDate;
    }
}
