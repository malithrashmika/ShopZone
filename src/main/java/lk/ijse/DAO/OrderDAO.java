package lk.ijse.DAO;

import lk.ijse.Entity.Order;


public interface OrderDAO extends CrudDAO<Order> {
    Order getLastOrderId();
}
