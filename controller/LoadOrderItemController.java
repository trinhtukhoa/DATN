package WebProject.WebProject.controller;

import WebProject.WebProject.entity.Order_Item;
import WebProject.WebProject.entity.Product;
import WebProject.WebProject.repository.Order_ItemRepository;
import WebProject.WebProject.entity.Order;
import WebProject.WebProject.service.Order_ItemService;
import WebProject.WebProject.service.ProductService;
import WebProject.WebProject.service.OrderService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("dashboard-orderitem")
public class LoadOrderItemController {

    @Autowired
    private Order_ItemService orderItemService;

    @Autowired
    private Order_ItemRepository order_ItemRepository;
    
    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;

    // Hiển thị danh sách Order Items
    @GetMapping
    public String listOrderItems(Model model) {
        model.addAttribute("orderItems", order_ItemRepository.findAll()); // Lấy danh sách tất cả Order Items
        model.addAttribute("orderItem", new Order_Item()); // Tạo đối tượng mới để thêm/sửa
        model.addAttribute("products", productService.getAllProduct()); // Lấy danh sách sản phẩm
        model.addAttribute("orders", orderService.findAll()); // Lấy danh sách đơn hàng
        model.addAttribute("isEditing", false); // Không trong chế độ chỉnh sửa
        return "dashboard-orderitem"; // View tên là dashboard-orderitem.html
    }

    // Lưu Order Item mới
    @PostMapping("/save")
    public String saveOrderItem(@ModelAttribute Order_Item orderItem, 
                                 @RequestParam("productId") int productId, 
                                 @RequestParam("orderId") int orderId) {
        Product product = productService.getProductById(productId); // Lấy sản phẩm
        Order order = orderService.findById(orderId); // Lấy đơn hàng
        if (product != null && order != null) {
            orderItem.setProduct(product); // Gắn sản phẩm vào Order Item
            orderItem.setOrder(order); // Gắn đơn hàng vào Order Item
            orderItemService.saveOrder_Item(orderItem); // Lưu Order Item
        }
        return "redirect:/dashboard-orderitem"; // Chuyển về danh sách Order Items
    }

    // Hiển thị form sửa Order Item
    @GetMapping("/edit/{id}")
    public String editOrderItem(@PathVariable("id") int id, Model model) {
        Optional<Order_Item> orderItem = order_ItemRepository.findById(id);
        if (orderItem != null) {
            model.addAttribute("orderItem", orderItem.get()); // Thêm Order Item vào Model
            model.addAttribute("products", productService.getAllProduct()); // Lấy danh sách sản phẩm
            model.addAttribute("orders", orderService.findAll()); // Lấy danh sách đơn hàng
            model.addAttribute("isEditing", true); // Đặt chế độ chỉnh sửa
            return "dashboard-orderitem"; // View dashboard-orderitem.html
        }
        return "redirect:/dashboard-orderitem"; // Nếu không tìm thấy Order Item
    }
 // Cập nhật Order Item
    @PostMapping("/update/{id}")
    public String updateOrderItem(@PathVariable("id") int id, 
                                   @ModelAttribute Order_Item orderItem, 
                                   @RequestParam("productId") int productId, 
                                   @RequestParam("orderId") int orderId) {
        Optional<Order_Item> existingOrderItem = order_ItemRepository.findById(id);
        if (existingOrderItem.isPresent()) {
            Order_Item updatedItem = existingOrderItem.get();
            Product product = productService.getProductById(productId);
            Order order = orderService.findById(orderId);
            if (product != null && order != null) {
                updatedItem.setProduct(product);
                updatedItem.setOrder(order);
                updatedItem.setCount(orderItem.getCount()); // Cập nhật số lượng
                orderItemService.saveOrder_Item(updatedItem); // Lưu thay đổi
            }
        }
        return "redirect:/dashboard-orderitem";
    }

    // Xóa Order Item
    @PostMapping("/delete/{id}")
    public String deleteOrderItem(@PathVariable("id") int id) {
        orderItemService.deleteById(id); // Xóa Order Item
        return "redirect:/dashboard-orderitem"; // Chuyển về danh sách Order Items
    }
}
