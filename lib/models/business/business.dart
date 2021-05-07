class BusinessModel {
  BusinessModel({this.title, this.subtitle, this.select});

  String title;
  String subtitle;
  bool select;
  factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
      title: json["title"], subtitle: json["subtitle"], select: json["select"]);

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "select": select,
      };
}
