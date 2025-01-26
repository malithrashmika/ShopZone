package lk.ijse.DAO;

import lk.ijse.Entity.Category;

import java.sql.SQLException;

public interface CategoryDAO extends CrudDAO<Category>{
    Category searchByID(String id) throws SQLException, ClassNotFoundException;
}
