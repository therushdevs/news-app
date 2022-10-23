
import '../models/category_model.dart';

List<CategoryModel> getCategories(){
  List <CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = CategoryModel();

  categoryModel.categoryName = "Business";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YnVzaW5lc3N8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1499364615650-ec38552f4f34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZW50ZXJ0YWlubWVudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGdlbmVyYWx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1549890762-0a3f8933bc76?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGhlYWx0aHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1564325724739-bae0bd08762c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c2NpZW5jZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1587280501635-68a0e82cd5ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHNwb3J0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl = "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dGVjaG5vbG9neXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";
  category.add(categoryModel);

  return category;
}