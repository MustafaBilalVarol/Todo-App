import 'package:flutter/material.dart';
import '../model/helper_model.dart';

class CreateToDo extends StatefulWidget {
  final Note? note;
  const CreateToDo({Key? key, this.note}) : super(key: key);

  @override
  State<CreateToDo> createState() => _CreateToDoState();
}

class _CreateToDoState extends State<CreateToDo> {
  late String baslik;
  late String aciklama;
  late String tarih;

  @override
  void initState() {
    super.initState();
    baslik = widget.note?.baslik ?? '   ';
    aciklama = widget.note?.aciklama ?? '  ';
  }

  DateTime? _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Başlık"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Açıklama"),
            ),
            Text(_dateTime != null
                ? "${_dateTime?.year}-${_dateTime?.month}-${_dateTime?.day}"
                : "Zaman Seç"),
            ElevatedButton(
              child: Text('Tarih Seç'),
              onPressed: () async {
                DateTime? _newDate = await showDatePicker(
                  context: context,
                  initialDate: _dateTime!,
                  firstDate: DateTime(1999),
                  lastDate: DateTime(2023),
                );

                if (_newDate != null) {
                  setState(() {
                    tarih = _newDate as String;
                    _dateTime = _newDate;
                  });
                }
              },
            ),
            PopupMenuButton(
                icon: Icon(Icons.catching_pokemon),
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      const PopupMenuItem(
                        child: Text('seçenek'),
                      ),
                    ]),
            SizedBox(height: 17),
            _buildSaveBtn()
          ],
        ),
      ),
    );
  }

  FlatButton _buildSaveBtn() => FlatButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Row(
        children: [Text("Kaydet"), Icon(Icons.save_alt)],
      ));
  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Kart Oluştur"),
    );
  }
}
