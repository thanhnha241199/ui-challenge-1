class OnboadingModel {
  OnboadingModel({
    this.image,
    this.title,
    this.subtitle,
  });

  String image;
  String title;
  String subtitle;

  factory OnboadingModel.fromJson(Map<String, dynamic> json) => OnboadingModel(
        image: json["image"],
        title: json["title"],
        subtitle: json["subtitle"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "subtitle": subtitle,
      };
}
