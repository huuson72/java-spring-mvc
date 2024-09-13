package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Role;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    // @RequestMapping("/")
    // public String getHomePage(Model model) {
    //     List<User> arrUsers = this.userService.getAllUserByEmail("son@gmail.com");
    //     System.out.println(arrUsers);
    //     model.addAttribute("eric", "test");
    //     model.addAttribute("hoidanit", "from controller with model");
    //     return "hello";
    // }
    @GetMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUser();
        model.addAttribute("users1", users);
        return "admin/user/detail";
    }

    // @RequestMapping("/admin/user")
    // public String getUserPageDashBoard(Model model) {
    //     List<User> users = this.userService.getAllUser();
    //     model.addAttribute("users1", users);
    //     return "admin/user/table-user";
    // }
    // @RequestMapping("/admin/user/{id}")
    // public String getUserDetailPage(Model model, @PathVariable long id) {
    //     System.out.println("check path id = " + id);
    //     model.addAttribute("id", id);
    //     return "admin/user/show";
    // }
    @PostMapping(value = "/admin/user/create")
    public String createUserPage(Model model, @ModelAttribute("newUser") @Valid User hoidanit, BindingResult newUsersBindingResult,
            @RequestParam("hStoreFile") MultipartFile file) {
        List<FieldError> errors = newUsersBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        if (newUsersBindingResult.hasErrors()) {
            return "/admin/user/create";
        }
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        hoidanit.setAvatar(avatar);
        String hashPassword = this.passwordEncoder.encode(hoidanit.getPassword());

        hoidanit.setPassword(hashPassword);
        hoidanit.setRole(this.userService.getRoleByName(hoidanit.getRole().getName()));

        this.userService.handleSaveUser(hoidanit);

        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserDetail(@PathVariable("id") long id, Model model) {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        return "admin/user/show";
    }

    @GetMapping("/admin/user/update/{id}") // GET
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.findById(id);
        List<Role> roles = this.userService.getAllRoles(); // Lấy danh sách các vai trò từ dịch vụ
        model.addAttribute("newUser", currentUser);
        model.addAttribute("roles", roles); // Thêm danh sách vai trò vào mô hình
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(@ModelAttribute("newUser") User updatedUser, @RequestParam("hStoreFile") MultipartFile file) {
        User currentUser = this.userService.findById(updatedUser.getId());
        if (currentUser != null) {
            currentUser.setAddress(updatedUser.getAddress());
            currentUser.setFullName(updatedUser.getFullName());
            currentUser.setPhone(updatedUser.getPhone());
            currentUser.setRole(this.userService.getRoleById(updatedUser.getRole().getId()));

            // Xử lý upload file avatar
            if (!file.isEmpty()) {
                String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
                currentUser.setAvatar(avatar);
            }

            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    // @PostMapping("/admin/user/update")
    // public String postUpdateUser(@ModelAttribute("newUser") User updatedUser) {
    //     User currentUser = this.userService.findById(updatedUser.getId());
    //     if (currentUser != null) {
    //         currentUser.setAddress(updatedUser.getAddress());
    //         currentUser.setFullName(updatedUser.getFullName());
    //         currentUser.setPhone(updatedUser.getPhone());
    //         currentUser.setRole(this.userService.getRoleById(updatedUser.getRole().getId()));
    //         this.userService.handleSaveUser(currentUser);
    //     }
    //     return "redirect:/admin/user";
    // }
// @PostMapping("/admin/user/update")
// public String postUpdateUser(Model model, @ModelAttribute("newUser") User hoidanit) {
//     User currentUser = this.userService.findById(hoidanit.getId());
//     if (currentUser != null) {
//         currentUser.setAddress(hoidanit.getAddress());
//         currentUser.setFullName(hoidanit.getFullName());
//         currentUser.setPhone(hoidanit.getPhone());
//         // bug here
//         this.userService.handleSaveUser(currentUser);
//     }
//     return "redirect:/admin/user";
// }
// @RequestMapping(value = "/admin/user/update", method = RequestMethod.POST)
// public String updateUser(@ModelAttribute User user) {
//     userService.handleSaveUser(user); // Lưu thông tin người dùng đã cập nhật
//     return "redirect:/admin/user"; // Redirect đến danh sách người dùng
// }
    @PostMapping(value = "/admin/user/delete")
    public String deleteUser(@RequestParam("id") long id) {
        userService.deleteById(id);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user/delete")
    public String showDeletePage(@RequestParam("id") long id, Model model) {
        User user = userService.findById(id);
        model.addAttribute("user", user);
        return "admin/user/delete";
    }

}
