class NotificationModel {
  NotificationModel({
    this.id,
    this.sentFrom,
    this.business,
    this.isReceived,
    this.isRead,
    this.title,
    this.body,
    this.inputData,
    this.noticeClass,
    this.createdAt,
  });

  String id;
  String sentFrom;
  String business;
  bool isReceived;
  bool isRead;
  String title;
  String body;
  dynamic inputData;
  String noticeClass;
  DateTime createdAt;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        sentFrom: json["sent_from"],
        business: json["business"],
        isReceived: json["is_received"],
        isRead: json["is_read"],
        title: json["title"],
        body: json["body"],
        inputData: json["input_data"],
        noticeClass: json["notice_class"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sent_from": sentFrom,
        "business": business,
        "is_received": isReceived,
        "is_read": isRead,
        "title": title,
        "body": body,
        "input_data": inputData,
        "notice_class": noticeClass,
        "created_at": createdAt.toIso8601String(),
      };
}
