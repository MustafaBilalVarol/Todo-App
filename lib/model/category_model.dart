class Category {
  String? ad;
  String? desc;
  int? id1;

  categoryMap() {
    var mapping = Map<String, dynamic>();
    mapping["id"] = id1;
    mapping["name"] = ad;
    mapping["description"] = desc;
    return mapping;
  }
}
