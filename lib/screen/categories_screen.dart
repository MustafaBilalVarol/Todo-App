import 'package:flutter/material.dart';
import 'package:to_do_app/model/category_model.dart';
import 'package:to_do_app/screen/home_screen.dart';
import 'package:to_do_app/services/category_services.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> _categoryList = List<Category>.empty(growable: true);
  @override
  var categoryNameController = TextEditingController();
  var categorydescriptionController = TextEditingController();

  var editcategoryNameController = TextEditingController();
  var editcategorydescriptionController = TextEditingController();

  var _category = Category();
  var categoryServices = CategoryService();

  _showFromDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("İptal")),
              MaterialButton(
                  color: Colors.blue,
                  onPressed: () async {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text("Kaydet")),
            ],
            title: Text("Kategori Formu"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Kategori",
                      labelText: "Kategori",
                    ),
                    controller: categoryNameController,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "  Acıklaması",
                      labelText: "Acıklaması",
                    ),
                    controller: categorydescriptionController,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen())),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text("Kategoriler"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
          color: Colors.cyan,
          elevation: 2,
        ),
        itemCount: 1,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFromDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
