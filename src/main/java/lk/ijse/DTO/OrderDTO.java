package lk.ijse.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public  class OrderDTO {
    private int orderId;
    private UserDTO user;
    private Date orderDate;
    private Double totalAmount;
}