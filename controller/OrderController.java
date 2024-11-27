package WebProject.WebProject.controller;

import java.net.URI;
import java.net.URISyntaxException;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.fasterxml.jackson.databind.ObjectMapper;

import WebProject.WebProject.entity.Cart;
import WebProject.WebProject.entity.Order;
import WebProject.WebProject.entity.Order_Item;
import WebProject.WebProject.entity.Product;
import WebProject.WebProject.entity.User;
import WebProject.WebProject.service.CartService;
import WebProject.WebProject.service.OrderService;
import WebProject.WebProject.service.Order_ItemService;
import WebProject.WebProject.service.ProductService;


@Controller
public class OrderController {

    @Autowired
    CartService cartService;

    @Autowired
    ProductService productService;

    @Autowired
    Order_ItemService order_ItemService;

    @Autowired
    OrderService orderService;

    @Autowired
    private HttpSession session;

    @GetMapping("checkout")
    public String CheckOutView(Model model) {
        User user = (User) session.getAttribute("acc");
        if (user == null) {
            session.setAttribute("AddToCartErr", "Vui lòng đăng nhập trước khi thực hiện thao tác!");
            return "redirect:/home";
        } else {
            List<Cart> cartList = cartService.GetAllCartByUser_id(user.getId());
            if (!cartList.isEmpty()) {
                String totalString = session.getAttribute("Total").toString();
                int total = Integer.parseInt(totalString);
                model.addAttribute("Total", totalString);
                model.addAttribute("listCart", cartList);
                return "checkout";
            } else {
                session.setAttribute("CartIsEmpty", "CartIsEmpty");
                return "redirect:/cart";
            }
        }
    }

    // Xử lý thanh toán
    @PostMapping("checkout")
    public String CheckOut(@ModelAttribute("fullname") String fullname,
                           @ModelAttribute("country") String country,
                           @ModelAttribute("address") String address,
                           @ModelAttribute("phone") String phone,
                           @ModelAttribute("email") String email,
                           @ModelAttribute("note") String note,
                           @RequestParam(value = "payOndelivery", defaultValue = "false") boolean payOndelivery,
                           Model model) throws Exception {

        long millis = System.currentTimeMillis();
        Date bookingDate = new java.sql.Date(millis);
        @SuppressWarnings("unchecked")
        List<Cart> listCart = (List<Cart>) session.getAttribute("listCart");
        User user = (User) session.getAttribute("acc");
        String totalString = session.getAttribute("Total").toString();
        int total = Integer.parseInt(totalString);

        String paymentMethod = payOndelivery ? "Payment on delivery" : "Pending";
        String status = payOndelivery ? "Pending" : "Pending";

        Order newOrder = new Order();
        newOrder.setTotal(total);
        newOrder.setAddress(address);
        newOrder.setBooking_Date(bookingDate);
        newOrder.setCountry(country);
        newOrder.setEmail(email);
        newOrder.setFullname(fullname);
        newOrder.setNote(note);
        newOrder.setPayment_Method(paymentMethod);
        newOrder.setPhone(phone);
        newOrder.setStatus(status);
        newOrder.setUser(user);

        // Thanh toán tại nhà
        orderService.saveOrder(newOrder);
        saveOrderItems(listCart, newOrder);
        session.setAttribute("order", newOrder);
        return "redirect:/invoice";
    }

    // Hiển thị chi tiết hóa đơn
    @GetMapping("invoice")
    public String Invoice(Model model) {
        Order order = (Order) session.getAttribute("order");
        List<Order_Item> listOrderItem = order_ItemService.getAllByOrder_Id(order.getId());
        model.addAttribute("listOrder_Item", listOrderItem);
        model.addAttribute("order", order);
        return "invoice";
    }

    // Lưu sản phẩm trong đơn hàng
    private void saveOrderItems(List<Cart> listCart, Order order) {
        for (Cart cartItem : listCart) {
            Product product = cartItem.getProduct();
            product.setQuantity(product.getQuantity() - cartItem.getCount());
            product.setSold(product.getSold() + cartItem.getCount());
            productService.saveProduct(product);

            Order_Item orderItem = new Order_Item();
            orderItem.setCount(cartItem.getCount());
            orderItem.setOrder(order);
            orderItem.setProduct(product);
            order_ItemService.saveOrder_Item(orderItem);

            cartService.deleteById(cartItem.getId());
        }
    }

    @GetMapping("/invoice/{id}")
    public String InvoiceView(@PathVariable int id, Model model, HttpServletRequest request) {
        String referer = request.getHeader("Referer");
        model.addAttribute("referer", referer);
        Order order = orderService.findById(id);
        session.setAttribute("order", order);
        session.setAttribute("invoiceView", "view");
        return "redirect:/invoice";
    }

    @GetMapping("/myhistory")
    public String Myhistory(Model model, HttpServletRequest request) {
        String referer = request.getHeader("Referer");
        User user = (User) session.getAttribute("acc");
        if (user == null) {
            return "redirect:" + referer;
        } else {
            List<Order> listOrder = orderService.getAllOrderByUser_Id(user.getId());
            Collections.reverse(listOrder);
            model.addAttribute("listOrder", listOrder);
            System.out.println(listOrder);
            for (Order y : listOrder) {
                System.out.println(y.getOrder_Item());
            }
        }
        return "myhistory";
    }
}
