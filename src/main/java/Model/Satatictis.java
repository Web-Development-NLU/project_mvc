package Model;

public class Satatictis extends BaseModelUUID {
    private int id;
    private int totalOrder;
    private int totalOrderByDate;
    private int totalSales;
    private int totalSalesByDate;

    public Satatictis(int id, int totalOrder, int totalOrderByDate, int totalSales, int totalSalesByDate) {
        this.id = id;
        this.totalOrder = totalOrder;
        this.totalOrderByDate = totalOrderByDate;
        this.totalSales = totalSales;
        this.totalSalesByDate = totalSalesByDate;
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
