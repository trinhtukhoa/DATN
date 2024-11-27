package WebProject.WebProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import WebProject.WebProject.entity.User;
import WebProject.WebProject.service.UserService;

import java.util.Base64;

@Controller
@RequestMapping("/dashboard-user")
public class LoadUserController {

    @Autowired
    private UserService userService;

    // Hiển thị danh sách người dùng và form thêm mới hoặc sửa
    @GetMapping
    public String getAllUsers(Model model) {
        model.addAttribute("users", userService.getAllUser());
        model.addAttribute("user", new User()); // Đối tượng trống để thêm mới
        model.addAttribute("isEditing", false); // Trạng thái mặc định là thêm mới
        return "dashboard-user";
    }

    // Xử lý thêm người dùng
    @PostMapping("/add")
    public String addUser(
            @ModelAttribute("user") User user,
            @RequestParam("password") String password,
            @RequestParam("confirmPassword") String confirmPassword,
            Model model) {
        try {
            if (user.getId() == null || user.getId().trim().isEmpty()) {
                model.addAttribute("error", "ID không được để trống!");
                model.addAttribute("users", userService.getAllUser());
                return "dashboard-user";
            }
            if (!password.equals(confirmPassword)) {
                model.addAttribute("error", "Mật khẩu và xác nhận mật khẩu không khớp!");
                model.addAttribute("users", userService.getAllUser());
                return "dashboard-user";
            }
            // Mã hóa mật khẩu
            String encodedPassword = Base64.getEncoder().encodeToString(password.getBytes());
            user.setPassword(encodedPassword);
            userService.saveUser(user); // Thêm người dùng mới
        } catch (Exception e) {
            model.addAttribute("error", "Có lỗi xảy ra khi thêm người dùng: " + e.getMessage());
            model.addAttribute("users", userService.getAllUser());
            return "dashboard-user";
        }
        return "redirect:/dashboard-user";
    }

    // Xử lý cập nhật người dùng
 // Xử lý cập nhật người dùng
    @PostMapping("/update")
    public String updateUser(@ModelAttribute("user") User user,
                             @RequestParam("password") String password,
                             @RequestParam("confirmPassword") String confirmPassword,
                             Model model) {
        try {
            // Kiểm tra nếu ID người dùng trống
            if (user.getId() == null || user.getId().trim().isEmpty()) {
                model.addAttribute("error", "ID không được để trống!");
                model.addAttribute("users", userService.getAllUser());
                return "dashboard-user";
            }

            // Kiểm tra xem người dùng có tồn tại trong cơ sở dữ liệu không
            User existingUser = userService.getUserById(user.getId());
            if (existingUser == null) {
                model.addAttribute("error", "Người dùng không tồn tại!");
                model.addAttribute("users", userService.getAllUser());
                return "dashboard-user";
            }

            // Kiểm tra nếu mật khẩu và xác nhận mật khẩu khớp
            if (!password.equals(confirmPassword)) {
                model.addAttribute("error", "Mật khẩu và xác nhận mật khẩu không khớp!");
                model.addAttribute("users", userService.getAllUser());
                return "dashboard-user";
            }

            // Nếu mật khẩu mới được nhập, mã hóa mật khẩu mới thành "MTlz"
            if (!password.isEmpty()) {
                String encodedPassword = "MTlz"; // Đây là mật khẩu bạn muốn mã hóa
                user.setPassword(encodedPassword);
            } else {
                // Nếu không thay đổi mật khẩu, giữ mật khẩu cũ
                user.setPassword(existingUser.getPassword());
            }

            // Cập nhật thông tin người dùng
            userService.updateUser(user);

        } catch (Exception e) {
            model.addAttribute("error", "Có lỗi xảy ra khi cập nhật người dùng: " + e.getMessage());
            model.addAttribute("users", userService.getAllUser());
            return "dashboard-user";
        }
        return "redirect:/dashboard-user";
    }






    // Hiển thị thông tin người dùng để sửa
    @GetMapping("/edit/{id}")
    public String editUser(@PathVariable("id") String id, Model model) {
        User user = userService.getUserById(id);
        if (user != null) {
            model.addAttribute("user", user); // Đưa thông tin người dùng cần sửa vào form
            model.addAttribute("isEditing", true); // Đổi trạng thái thành sửa
        } else {
            model.addAttribute("error", "Người dùng không tồn tại!");
            model.addAttribute("user", new User()); // Form trống
        }
        model.addAttribute("users", userService.getAllUser());
        return "dashboard-user";
    }

    // Xóa người dùng
    @PostMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") String id, Model model) {
        try {
            User user = userService.getUserById(id);
            if (user != null) {
                userService.deleteUserById(id); // Xóa người dùng
            } else {
                model.addAttribute("error", "Người dùng không tồn tại để xóa!");
                model.addAttribute("users", userService.getAllUser());
                return "dashboard-user";
            }
        } catch (Exception e) {
            model.addAttribute("error", "Có lỗi xảy ra khi xóa người dùng: " + e.getMessage());
            model.addAttribute("users", userService.getAllUser());
            return "dashboard-user";
        }
        return "redirect:/dashboard-user";
    }
}
