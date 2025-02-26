package lk.ijse.Entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.*;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
@Getter
@Setter
public class Login {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int login;
    private String UserMail;
}
