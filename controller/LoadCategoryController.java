package WebProject.WebProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import WebProject.WebProject.entity.Category;
import WebProject.WebProject.service.CategoryService;

@Controller
@RequestMapping("dashboard-category")
public class LoadCategoryController {

    @Autowired
    private CategoryService categoryService;

    // Hiển thị danh sách các category
    @GetMapping
    public String listCategories(Model model) {
        model.addAttribute("categories", categoryService.findAll()); // Danh sách các Category
        model.addAttribute("category", new Category()); // Khởi tạo đối tượng Category mới để hiển thị form
        model.addAttribute("isEditing", false); // Không trong chế độ chỉnh sửa
        return "dashboard-category"; // View tên là dashboard-category.html
    }

    // Hiển thị form thêm mới Category
    @GetMapping("/save")
    public String showForm(Model model) {
        model.addAttribute("category", new Category()); // Đối tượng Category mới
        model.addAttribute("isEditing", false); // Thêm mới không phải chỉnh sửa
        return "dashboard-category"; // View dashboard-category.html
    }

    // Lưu Category mới
    @PostMapping("/save")
    public String saveCategory(@ModelAttribute Category category) {
        categoryService.saveCategory(category); // Lưu category
        return "redirect:/dashboard-category"; // Chuyển về danh sách
    }

    // Hiển thị form sửa Category
    @GetMapping("/edit/{id}")
    public String editCategory(@PathVariable("id") int id, Model model) {
        Category category = categoryService.getCategoryById(id); // Lấy Category theo ID
        if (category != null) {
            model.addAttribute("category", category); // Thêm đối tượng vào Model
            model.addAttribute("isEditing", true); // Đặt chế độ chỉnh sửa
            return "dashboard-category"; // View dashboard-category.html
        }
        return "redirect:/dashboard-category"; // Nếu không tìm thấy Category
    }

    // Cập nhật Category
    @PostMapping("/update/{id}")
    public String updateCategory(@PathVariable("id") int id, @ModelAttribute Category category) {
        category.setId(id); // Gán lại ID cho Category
        categoryService.updateCategory(category); // Cập nhật Category
        return "redirect:/dashboard-category"; // Chuyển về danh sách
    }

    // Xóa Category
    @PostMapping("/delete/{id}")
    public String deleteCategory(@PathVariable("id") int id) {
        categoryService.deleteCategoryId(id); // Xóa Category theo ID
        return "redirect:/dashboard-category"; // Chuyển về danh sách
    }
}
