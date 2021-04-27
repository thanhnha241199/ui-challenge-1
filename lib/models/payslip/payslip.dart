class PayslipModel {
  PayslipModel({
    this.start,
    this.end,
    this.amount,
  });

  String start;
  String end;
  String amount;

  factory PayslipModel.fromJson(Map<String, dynamic> json) => PayslipModel(
        start: json["start"],
        end: json["end"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
        "amount": amount,
      };
}
