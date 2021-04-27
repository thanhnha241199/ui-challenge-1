class SupportModel {
  SupportModel({
    this.message,
    this.time,
    this.issender,
  });

  String message;
  String time;
  bool issender;

  factory SupportModel.fromJson(Map<String, dynamic> json) => SupportModel(
        message: json["message"],
        time: json["time"],
        issender: json["issender"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "time": time,
        "issender": issender,
      };
}
