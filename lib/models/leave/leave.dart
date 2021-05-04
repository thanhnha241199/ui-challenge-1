class LeaveModel {
  LeaveModel({
    this.name,
    this.start,
    this.end,
    this.hours,
    this.description,
    this.label1,
    this.label2,
  });

  String name;
  String start;
  String end;
  String hours;
  String description;
  String label1;
  String label2;

  factory LeaveModel.fromJson(Map<String, dynamic> json) => LeaveModel(
        name: json["name"],
        start: json["start"],
        end: json["end"],
        hours: json["hours"],
        description: json["description"],
        label1: json["label1"],
        label2: json["label2"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "start": start,
        "end": end,
        "hours": hours,
        "description": description,
        "label1": label1,
        "label2": label2,
      };
}
