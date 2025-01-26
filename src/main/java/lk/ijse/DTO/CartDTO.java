package lk.ijse.DTO;



import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CartDTO {
    private int cartId;
    private UserDTO user;
    private ProductDTO product;
    private Integer quantity;


}