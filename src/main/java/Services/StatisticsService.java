package Services;

import Database.DBConnection;
import Model.*;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.HandleCallback;
import org.jdbi.v3.core.Jdbi;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.ArrayList;


public class StatisticsService  {
    
    private Jdbi jdbi;

    public StatisticsService()  {
        this.jdbi = DBConnection.jdbi;
    }

    public int getOrder() {
        int totalOrder = jdbi.withHandle(handle -> handle.createQuery("SELECT COUNT(*) FROM orders where status=2").mapTo(Integer.class).one());
        return totalOrder;
    }
    public int getTotalOrderByDate(LocalDate createDate) {
        int totalOrderByDate = jdbi.withHandle(handle -> handle.createQuery("SELECT COUNT(*) FROM orders where status=2 and createdAt=? ")
                .bind(0,createDate).mapTo(Integer.class).one());
        return totalOrderByDate;
    }

    public int getSales() {
        int sales = jdbi.withHandle(handle -> handle.createQuery("SELECT sum(price) FROM orders where status=2").mapTo(Integer.class).one());
        return sales;
    }

//    public int getSalesByDate(LocalDate createDate) {
//        int sales = jdbi.withHandle(handle -> handle.createQuery("SELECT sum(price) FROM orders where status=2 and createdAt=? ")
//                .bind(0,createDate).mapTo(Integer.class).one());
//        if(sales!=0){
//            return sales;
//        }else
//        return 0;
//    }
public int getSalesByDate(LocalDate createDate) {
    try {
        return this.jdbi.withHandle(new HandleCallback<Integer, Exception>() {
            public Integer withHandle(Handle handle) throws Exception {
                try {
                    Integer result = handle.createQuery("SELECT sum(price) FROM orders where status=2 and createdAt = :createDate")
                            .bind("createDate", createDate)
                            .mapTo(Integer.class)
                            .one();
                    return result != null ? result : 0;
                } catch (IllegalStateException exception) {
                    return 0;
                }
            }
        });
    } catch (Exception e) {
        throw new RuntimeException(e);
    }
}


    public Statistics create(Statistics model) {
        return this.jdbi.withHandle(handle -> {
            handle.createUpdate("INSERT INTO statistics" + " (totalOrder, totalOrderByDate, totalSales, totalSalesByDate, createAt) VALUES " +
                    "(:totalOrder, :totalOrderByDate, :totalSales, :totalSalesByDate, :createAt) ").bindBean(model).execute();
            return model;
        });
    }

    public void update() {
//        int id = this.getStatisticsId(LocalDate.now());

        int order= this.getOrder();
        int orderByDay= this.getTotalOrderByDate(LocalDate.now());
        int sales= this.getSales();
        int salesByDay= this.getSalesByDate(LocalDate.now());
        Timestamp update=new Timestamp(System.currentTimeMillis());

        this.jdbi.useHandle(handle -> {
            // Tìm giá trị MAX(id)
            Long maxId = handle.createQuery("SELECT MAX(id) FROM statistics")
                    .mapTo(Long.class)
                    .one();

            // Thực hiện câu UPDATE với giá trị MAX(id) đã tìm được
            handle.createUpdate("UPDATE statistics " +
                            "SET totalOrder = :order, " +
                            "totalOrderByDate = :orderByDay, " +
                            "totalSales = :sales, " +
                            "totalSalesByDate = :salesByDay, " +
                            "updatedAt = :update " +
                            "WHERE id = :maxId")
                    .bind("order", order)
                    .bind("orderByDay", orderByDay)
                    .bind("sales", sales)
                    .bind("salesByDay", salesByDay)
                    .bind("update", update)
                    .bind("maxId", maxId)
                    .execute();
        });
    }


    public Statistics getStatistics() {
        return (Statistics) this.jdbi.withHandle(handle -> {
            return handle.createQuery("SELECT * FROM statistics" +
                            " ORDER BY createAt desc limit 1")
                    .mapToBean(Statistics.class)
                    .first();
        });
    };

    public ArrayList<Integer> getTotalSalesByMonth(int year) {
        String sql = "SELECT sum(price) FROM orders WHERE status = 2 AND YEAR(createdAt) = :year GROUP BY MONTH(createdAt) ORDER BY createdAt ASC";
        return (ArrayList<Integer>) jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("year", year)
                        .mapTo(Integer.class)
                        .list()
        );
    }



    public ArrayList<Integer> getTotalOrderByMonth(int year) {
        try {
            return this.jdbi.withHandle(new HandleCallback<ArrayList<Integer>, Exception>() {
                public ArrayList<Integer> withHandle(Handle handle) throws Exception {
                    try {
                        return (ArrayList<Integer>) handle.createQuery(
                                        "SELECT count(*) FROM orders WHERE status = 2 AND YEAR(createdAt) = :year GROUP BY MONTH(createdAt) ORDER BY createdAt ASC")
                                .bind("year", year)
                                .mapTo(Integer.class)
                                .list();
                    } catch (IllegalStateException exception) {
                        return null;
                    }

                }
            });
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<String> getMonth(int year) {
        String sql = "SELECT MONTH(createdAt) FROM orders WHERE status = 2 AND YEAR(createdAt) = :year GROUP BY MONTH(createdAt) ORDER BY createdAt ASC";
        return (ArrayList<String>) jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("year", year)
                        .mapTo(String.class)
                        .list()
        );
    }


public ArrayList<Integer> getYear() {
    String sql = "SELECT YEAR(createdAt) FROM orders WHERE status = 2 GROUP BY YEAR(createdAt) ORDER BY createdAt ASC";
    return (ArrayList<Integer>) jdbi.withHandle(handle ->
            handle.createQuery(sql)
                    .mapTo(Integer.class)
                    .list()
    );
}


}


