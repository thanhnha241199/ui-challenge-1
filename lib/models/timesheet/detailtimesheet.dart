// To parse this JSON data, do
//
//     final detailTimeSheetModel = detailTimeSheetModelFromJson(jsonString);

import 'dart:convert';

DetailTimeSheetModel detailTimeSheetModelFromJson(String str) =>
    DetailTimeSheetModel.fromJson(json.decode(str));

String detailTimeSheetModelToJson(DetailTimeSheetModel data) =>
    json.encode(data.toJson());

class DetailTimeSheetModel {
  DetailTimeSheetModel({
    this.infor,
    this.detail,
    this.notes,
    this.attachment,
  });

  Infor infor;
  List<Detail> detail;
  List<Note> notes;
  List<Attachment> attachment;

  factory DetailTimeSheetModel.fromJson(Map<String, dynamic> json) =>
      DetailTimeSheetModel(
        infor: Infor.fromJson(json["infor"]),
        detail:
            List<Detail>.from(json["detail"].map((x) => Detail.fromJson(x))),
        notes: List<Note>.from(json["notes"].map((x) => Note.fromJson(x))),
        attachment: List<Attachment>.from(
            json["attachment"].map((x) => Attachment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "infor": infor.toJson(),
        "detail": List<dynamic>.from(detail.map((x) => x.toJson())),
        "notes": List<dynamic>.from(notes.map((x) => x.toJson())),
        "attachment": List<dynamic>.from(attachment.map((x) => x.toJson())),
      };
}

class Attachment {
  Attachment({
    this.file,
    this.time,
    this.day,
  });

  List<FileElement> file;
  String time;
  String day;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        file: List<FileElement>.from(
            json["file"].map((x) => FileElement.fromJson(x))),
        time: json["time"],
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {
        "file": List<dynamic>.from(file.map((x) => x.toJson())),
        "time": time,
        "day": day,
      };
}

class FileElement {
  FileElement({
    this.file,
  });

  String file;

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "file": file,
      };
}

class Detail {
  Detail({
    this.day,
    this.toalschedule,
    this.toalactual,
    this.elementdetail,
  });

  String day;
  String toalschedule;
  String toalactual;
  List<Elementdetail> elementdetail;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        day: json["day"],
        toalschedule: json["toalschedule"],
        toalactual: json["toalactual"],
        elementdetail: List<Elementdetail>.from(
            json["elementdetail"].map((x) => Elementdetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "toalschedule": toalschedule,
        "toalactual": toalactual,
        "elementdetail":
            List<dynamic>.from(elementdetail.map((x) => x.toJson())),
      };
}

class Elementdetail {
  Elementdetail({
    this.description,
    this.time,
    this.schedule,
    this.actual,
  });

  String description;
  String time;
  String schedule;
  String actual;

  factory Elementdetail.fromJson(Map<String, dynamic> json) => Elementdetail(
        description: json["description"],
        time: json["time"],
        schedule: json["schedule"],
        actual: json["actual"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "time": time,
        "schedule": schedule,
        "actual": actual,
      };
}

class Infor {
  Infor({
    this.name,
    this.manager,
  });

  String name;
  String manager;

  factory Infor.fromJson(Map<String, dynamic> json) => Infor(
        name: json["name"],
        manager: json["manager"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "manager": manager,
      };
}

class Note {
  Note({
    this.description,
    this.time,
    this.day,
  });

  String description;
  String time;
  String day;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        description: json["description"],
        time: json["time"],
        day: json["day"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "time": time,
        "day": day,
      };
}
