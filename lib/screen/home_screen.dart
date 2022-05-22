import 'package:flutter/material.dart';
import 'package:to_do_app/helpers/draw_navigaton.dart';
import '../model/helper_model.dart';
import 'crate_to_do.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yapılacaklar Listesi"),
        ),
        drawer: DrawerNavigation(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => CreateToDo()));
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => Card(
            color: Colors.cyan,
            elevation: 2,
          ),
          itemCount: 1,
        ));
  }
}
