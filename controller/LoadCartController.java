package WebProject.WebProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import WebProject.WebProject.entity.Cart;
import WebProject.WebProject.service.CartService;
import WebProject.WebProject.entity.Product;
import WebProject.WebProject.repository.CartRepository;
import WebProject.WebProject.repository.UserRepository;
import WebProject.WebProject.service.ProductService;

@Controller
@RequestMapping("dashboard-cart")
public class LoadCartController {

    @Autowired
    private CartService cartService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private ProductService productService;

    // Hiển thị danh sách giỏ hàng
    @GetMapping
    public String listCarts(Model model) {
        model.addAttribute("cartItems", cartRepository.findAll()); // Lấy danh sách tất cả các Cart
        model.addAttribute("cart", new Cart()); // Tạo đối tượng Cart mới
        model.addAttribute("users", userRepository.findAll()); // Lấy danh sách người dùng
        model.addAttribute("products", productService.getAllProduct()); // Lấy danh sách sản phẩm
        model.addAttribute("isEditing", false); // Không trong chế độ chỉnh sửa
        return "dashboard-cart"; // View tên là dashboard-cart.html
    }

    // Lưu giỏ hàng mới
    @PostMapping("/save")
    public String saveCart(@ModelAttribute Cart cart, @RequestParam("productId") int productId, @RequestParam("userId") String userId) {
        Product product = productService.getProductById(productId);
        cart.setProduct(product); // Gán sản phẩm vào giỏ
        cart.setUser(userRepository.findById(userId).orElse(null)); // Gán người dùng
        if (cart.getProduct() != null && cart.getUser() != null) {
            cartService.saveCart(cart); // Lưu giỏ hàng
        }
        return "redirect:/dashboard-cart"; // Chuyển về danh sách giỏ hàng
    }

    // Hiển thị form sửa giỏ hàng
    @GetMapping("/edit/{id}")
    public String editCart(@PathVariable("id") int id, Model model) {
        Cart cart = cartService.getCartById(id); // Lấy Cart theo ID
        if (cart != null) {
            model.addAttribute("cart", cart); // Thêm đối tượng vào Model
            model.addAttribute("users", userRepository.findAll()); // Lấy danh sách người dùng
            model.addAttribute("products", productService.getAllProduct()); // Lấy danh sách sản phẩm
            model.addAttribute("isEditing", true); // Đặt chế độ chỉnh sửa
            return "dashboard-cart"; // View dashboard-cart.html
        }
        return "redirect:/dashboard-cart"; // Nếu không tìm thấy Cart
    }

    // Lưu thông tin chỉnh sửa giỏ hàng
    @PostMapping("/update/{id}")
    public String updateCart(@PathVariable("id") int id, @ModelAttribute Cart cart, @RequestParam("productId") int productId, @RequestParam("userId") String userId) {
        Product product = productService.getProductById(productId);
        cart.setProduct(product); // Gán sản phẩm mới
        cart.setUser(userRepository.findById(userId).orElse(null)); // Gán người dùng mới
        cart.setId(id); // Gán ID cho đối tượng cart
        if (cart.getProduct() != null && cart.getUser() != null) {
            cartService.saveCart(cart); // Lưu thông tin đã chỉnh sửa
        }
        return "redirect:/dashboard-cart"; // Chuyển về danh sách giỏ hàng
    }

    // Xóa giỏ hàng
    @PostMapping("/delete/{id}")
    public String deleteCart(@PathVariable("id") int id) {
        cartService.deleteById(id); // Xóa Cart theo ID
        return "redirect:/dashboard-cart"; // Chuyển về danh sách
    }
}
