class TimeSheetModel {
  TimeSheetModel({
    this.start,
    this.end,
    this.scheduled,
    this.actual,
    this.label,
    this.file,
  });

  String start;
  String end;
  String scheduled;
  String actual;
  String label;
  int file;

  factory TimeSheetModel.fromJson(Map<String, dynamic> json) => TimeSheetModel(
        start: json["start"],
        end: json["end"],
        scheduled: json["scheduled"],
        actual: json["actual"],
        label: json["label"],
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
        "scheduled": scheduled,
        "actual": actual,
        "label": label,
        "file": file,
      };
}
