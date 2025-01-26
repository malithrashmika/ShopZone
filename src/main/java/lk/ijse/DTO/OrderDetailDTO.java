package lk.ijse.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;



@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class OrderDetailDTO {
    private int orderDetailId;
    private OrderDTO order;
    private ProductDTO product;
    private Integer quantity;
    private Double price;

}
