import 'package:flutter/material.dart';
import 'package:to_do_app/model/category_model.dart';
import 'package:to_do_app/repositories/repository.dart';

class CategoryService {
  Repository? _repository;
  CategoryService() {
    _repository = Repository();
  }
  saveCategory(Category category) async {
    return await _repository?.insertData("categories", category.categoryMap());
  }

  readCategories() async {
    return await _repository?.readData("categories");
  }
}
