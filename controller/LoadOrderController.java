package WebProject.WebProject.controller;

import WebProject.WebProject.entity.Order;
import WebProject.WebProject.service.OrderService;
import WebProject.WebProject.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("dashboard-order")
public class LoadOrderController {

    @Autowired
    private OrderService orderService;
    
    @Autowired
    private UserService userService;

    // Hiển thị danh sách các đơn hàng
    @GetMapping
    public String listOrders(Model model) {
        model.addAttribute("orders", orderService.findAll());
        model.addAttribute("users", userService.getAllUser());// Danh sách các Order
        model.addAttribute("order", new Order()); // Khởi tạo đối tượng Order mới để hiển thị form
        model.addAttribute("isEditing", false); // Không trong chế độ chỉnh sửa
        return "dashboard-order"; // View tên là dashboard-order.html
    }

    // Hiển thị form thêm mới Order
    @GetMapping("/save")
    public String showForm(Model model) {
        model.addAttribute("order", new Order()); // Đối tượng Order mới
        model.addAttribute("isEditing", false); // Thêm mới không phải chỉnh sửa
        return "dashboard-order"; // View dashboard-order.html
    }

    // Lưu Order mới
    @PostMapping("/save")
    public String saveOrder(@ModelAttribute Order order) {
        orderService.saveOrder(order); // Lưu Order
        return "redirect:/dashboard-order"; // Chuyển về danh sách
    }

    // Hiển thị form sửa Order
    @GetMapping("/edit/{id}")
    public String editOrder(@PathVariable("id") int id, Model model) {
        Order order = orderService.findById(id); // Lấy Order theo ID
        if (order != null) {
            model.addAttribute("order", order); // Thêm đối tượng vào Model
            model.addAttribute("isEditing", true); // Đặt chế độ chỉnh sửa
            return "dashboard-order"; // View dashboard-order.html
        }
        return "redirect:/dashboard-order"; // Nếu không tìm thấy Order
    }

    // Cập nhật Order
    @PostMapping("/update/{id}")
    public String updateOrder(@PathVariable("id") int id, @ModelAttribute Order order) {
        order.setId(id); // Gán lại ID cho Order
        orderService.saveOrder(order); // Cập nhật Order
        return "redirect:/dashboard-order"; // Chuyển về danh sách
    }

    // Xóa Order
    @PostMapping("/delete/{id}")
    public String deleteOrder(@PathVariable("id") int id) {
        orderService.deleteById(id); // Xóa Order theo ID
        return "redirect:/dashboard-order"; // Chuyển về danh sách
    }
}
