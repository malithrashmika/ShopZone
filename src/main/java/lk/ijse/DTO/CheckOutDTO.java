package lk.ijse.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CheckOutDTO {
    private OrderDTO orderDTO;
    private List<OrderDetailDTO> odList;
}
