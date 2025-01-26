package lk.ijse.BO;

import lk.ijse.DTO.OrderDetailDTO;

import java.util.List;


public interface Order_DetailBO extends SuperBO {

    boolean save(List<OrderDetailDTO> odList) throws Exception;

    boolean saveOrderDetail(OrderDetailDTO od) throws Exception;
}
