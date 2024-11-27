package WebProject.WebProject.service.impl;

import WebProject.WebProject.entity.Cart;
import WebProject.WebProject.repository.CartRepository;
import WebProject.WebProject.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServicempl implements CartService {

    @Autowired
    private CartRepository cartRepository;

    @Override
    public void deleteById(int id) {
        cartRepository.deleteById(id);
    }

    @Override
    public List<Cart> GetAllCartByUser_id(String user_id) {
        return cartRepository.findAllByUser_id(user_id);
    }

    @Override
    public void saveCart(Cart cart) {
        cartRepository.save(cart);
    }

    @Override
    public Cart getCartById(int id) {
        return cartRepository.findById(id).orElse(null);
    }
}
