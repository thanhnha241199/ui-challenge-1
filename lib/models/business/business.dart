class BusinessModel {
  BusinessModel({
    this.title,
    this.subtitle,
  });

  String title;
  String subtitle;

  factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
        title: json["title"],
        subtitle: json["subtitle"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
      };
}
