class BusinessModel {
  BusinessModel({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
