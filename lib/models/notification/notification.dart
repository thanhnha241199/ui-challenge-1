class NotificationModel {
  NotificationModel({
    this.title,
    this.time,
    this.read,
  });

  String title;
  String time;
  bool read;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        title: json["title"],
        time: json["time"],
        read: json["read"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "time": time,
        "read": read,
      };
}
