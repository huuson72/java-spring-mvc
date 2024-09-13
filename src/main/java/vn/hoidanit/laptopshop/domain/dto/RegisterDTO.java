package vn.hoidanit.laptopshop.domain.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;
import lombok.Data;
import vn.hoidanit.laptopshop.service.validator.RegisterChecked;

@Data
@RegisterChecked
public class RegisterDTO {

    @Size(min = 3, message = "FirstName phải có tối thiểu 3 kí tự")
    private String firstName;
    private String lastName;
    @Email(message = "Email không hợp lệ", regexp = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")
    private String email;
    private String password;
    @Size(min = 3, message = "Password phải có tối thiểu 3 kí tự")
    private String confirmPassword;

}
