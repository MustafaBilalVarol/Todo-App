final String tableNotes = 'notes';

 class Product {
  static final List<String> values = [
    /// Add all fields
    id1, tit, des, dat
  ];

  static String id1 = '_id';
  static String tit = 'title';
  static String des = 'description';
  static String dat = 'time';
}

class Note {
  final int? id;
  final String baslik;
  final String aciklama;

  const Note({
    this.id,
    required this.baslik,
    required this.aciklama,
  });

  Note copy({
    int? id,
    String? baslik,
    String? aciklama,
  }) =>
      Note(
        id: id ?? this.id,
        baslik: baslik ?? this.baslik,
        aciklama: aciklama ?? this.aciklama,
      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[Product.id1] as int?,
        baslik: json[Product.tit] as String,
        aciklama: json[Product.des] as String,
      );

  Map<String, Object?> toJson() => {
        Product.id1: id,
        Product.tit: baslik,
        Product.des: aciklama,
      };
}
