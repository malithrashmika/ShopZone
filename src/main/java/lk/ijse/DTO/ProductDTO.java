package lk.ijse.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ProductDTO {
    private int productId;
    private String name;
    private Double price;
    private String description;
    private int quantity;
    private String imagePath;
    private CategoryDTO category;
}