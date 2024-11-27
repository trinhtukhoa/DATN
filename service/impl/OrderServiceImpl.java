package WebProject.WebProject.service.impl;

import java.util.Arrays;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import WebProject.WebProject.entity.Order;
import WebProject.WebProject.repository.OrderRepository;
import WebProject.WebProject.service.OrderService;
@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderRepository orderRepository;
	@Override
	public void saveOrder(Order order) {
		// TODO Auto-generated method stub
		orderRepository.save(order);
	}
	@Override
	public List<Order> getAllOrderByUser_Id(String id) {
		// TODO Auto-generated method stub
		return orderRepository.findAllByUser_id(id);
	}
	@Override
	public Order findById(int id) {
		return orderRepository.findById(id);
	}
	@Override
	public List<Order> findAll() {
		return orderRepository.findAll();
	}
	@Override
	public List<Order> findTop5RecentOrder() {
		return orderRepository.findTop5RecentOrder();
	}
	@Override
	public List<String> findTop5RecentCustomer() {
		return orderRepository.findTop5RecentCustomer();
	}
	@Override
	public Page<Order> findAll(Pageable pageable) {
		return orderRepository.findAll(pageable);
	}
	@Override
	public void deleteById(int id) {
		orderRepository.deleteById(id);
	}
	@Override
	public List<Order> findAllByPayment_Method(String payment_Method) {
		return orderRepository.findAllByPayment_Method(payment_Method);
	}
	@Override
	public List<Order> findTop5OrderByPaymentMethod(String payment_method) {
		return orderRepository.findTop5OrderByPaymentMethod(payment_method);
	}
	 @Override
	    @Transactional
	    public void updateOrderStatus(int orderId, String status) {
	        // Lấy thông tin đơn hàng từ cơ sở dữ liệu
	        Order order = orderRepository.findById(orderId);
	        
	        // Danh sách trạng thái hợp lệ
	        List<String> validStatuses = Arrays.asList("Pending", "Shipper", "Delivery");

	        // Kiểm tra trạng thái mới có hợp lệ không
	        if (!validStatuses.contains(status)) {
	            throw new IllegalArgumentException("Invalid status: " + status);
	        }

	        // Cập nhật trạng thái và lưu vào cơ sở dữ liệu
	        order.setStatus(status);
	        orderRepository.save(order);
	    }
	
}
