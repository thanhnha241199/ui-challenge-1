class LeaveModel {
  LeaveModel({
    this.id,
    this.leaveType,
    this.description,
    this.startDate,
    this.endDate,
    this.isAllDay,
    this.periodInDayStart,
    this.periodInDayEnd,
    this.status,
    this.createdAt,
    this.modifiedAt,
  });

  String id;
  String leaveType;
  String description;
  DateTime startDate;
  DateTime endDate;
  dynamic isAllDay;
  dynamic periodInDayStart;
  dynamic periodInDayEnd;
  int status;
  DateTime createdAt;
  DateTime modifiedAt;

  factory LeaveModel.fromJson(Map<String, dynamic> json) => LeaveModel(
        id: json["id"],
        leaveType: json["leave_type"],
        description: json["description"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        isAllDay: json["is_all_day"],
        periodInDayStart: json["period_in_day_start"],
        periodInDayEnd: json["period_in_day_end"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        modifiedAt: DateTime.parse(json["modified_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "leave_type": leaveType,
        "description": description,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "is_all_day": isAllDay,
        "period_in_day_start": periodInDayStart,
        "period_in_day_end": periodInDayEnd,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "modified_at": modifiedAt.toIso8601String(),
      };
}
