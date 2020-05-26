import 'package:flutter/cupertino.dart';

import '../models/category_model.dart';

class CategoriesData {
  static List<CategoryModel> categories = new List<CategoryModel>();

  static List<CategoryModel> getCategories() {
    final List<String> _sections = [
      "General",
      "Business",
      "Science",
      "Technology",
      "Sports",
      "Entertainment",
      "Health",
    ];

    for (int i = 0; i < _sections.length; i++) {
      categories.add(CategoryModel(_sections[i]));
    }
    return categories;
  }
}
