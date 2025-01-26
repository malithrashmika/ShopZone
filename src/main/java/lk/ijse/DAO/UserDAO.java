package lk.ijse.DAO;

import lk.ijse.Entity.User;

import java.sql.SQLException;

public interface UserDAO extends CrudDAO<User>{
    User searchByEmail(String id) throws SQLException, ClassNotFoundException;

    User getLastUser();
}
