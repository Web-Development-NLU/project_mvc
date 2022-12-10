package Database;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.awt.*;
import java.sql.SQLDataException;
import java.sql.SQLException;

public class DBConnection {
    private String uri = "jdbc:mysql://" + DBConfig.host + ":" + DBConfig.port + "/" + DBConfig.dbname;

    public static Jdbi jdbi;
    public DBConnection() {
        if(jdbi == null) {
            MysqlDataSource dataSource = new MysqlDataSource();

            dataSource.setURL(uri);
            dataSource.setUser(DBConfig.username);
            dataSource.setPassword(DBConfig.password);
            try {
                dataSource.setUseCompression(true);
                dataSource.setAutoReconnect(true);
            }catch (SQLException error) {
                error.printStackTrace();
                throw new RuntimeException(error);
            }

            jdbi = Jdbi.create(dataSource);

        }

    }

}
