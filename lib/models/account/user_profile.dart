class UserProfileModel {
  UserProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.image,
    this.isStaff,
    this.employerCurrentBusiness,
    this.employeeCurrentBusiness,
    this.employeeCurrentBusinessEmployer,
  });

  String id;
  String firstName;
  String lastName;
  String email;
  String phone;
  dynamic image;
  bool isStaff;
  EmployeCurrentBusiness employerCurrentBusiness;
  EmployeCurrentBusiness employeeCurrentBusiness;
  EmployeeCurrentBusinessEmployer employeeCurrentBusinessEmployer;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        isStaff: json["is_staff"],
        employerCurrentBusiness:
            EmployeCurrentBusiness.fromJson(json["employer_current_business"]),
        employeeCurrentBusiness:
            EmployeCurrentBusiness.fromJson(json["employee_current_business"]),
        employeeCurrentBusinessEmployer:
            EmployeeCurrentBusinessEmployer.fromJson(
                json["employee_current_business_employer"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "image": image,
        "is_staff": isStaff,
        "employer_current_business": employerCurrentBusiness.toJson(),
        "employee_current_business": employeeCurrentBusiness.toJson(),
        "employee_current_business_employer":
            employeeCurrentBusinessEmployer.toJson(),
      };
}

class EmployeCurrentBusiness {
  EmployeCurrentBusiness({
    this.id,
    this.name,
    this.contactName,
    this.contactNumber,
    this.contactEmail,
    this.status,
    this.createdAt,
    this.modifiedAt,
    this.address,
    this.abn,
    this.website,
  });

  String id;
  String name;
  String contactName;
  String contactNumber;
  String contactEmail;
  int status;
  DateTime createdAt;
  DateTime modifiedAt;
  List<Address> address;
  dynamic abn;
  dynamic website;

  factory EmployeCurrentBusiness.fromJson(Map<String, dynamic> json) =>
      EmployeCurrentBusiness(
        id: json["id"],
        name: json["name"],
        contactName: json["contact_name"],
        contactNumber: json["contact_number"],
        contactEmail: json["contact_email"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        modifiedAt: DateTime.parse(json["modified_at"]),
        address:
            List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
        abn: json["abn"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "contact_name": contactName,
        "contact_number": contactNumber,
        "contact_email": contactEmail,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "modified_at": modifiedAt.toIso8601String(),
        "address": List<dynamic>.from(address.map((x) => x.toJson())),
        "abn": abn,
        "website": website,
      };
}

class Address {
  Address({
    this.id,
    this.address,
    this.city,
    this.state,
    this.postcode,
    this.suburb,
    this.country,
    this.isMainLocation,
  });

  String id;
  String address;
  dynamic city;
  dynamic state;
  dynamic postcode;
  dynamic suburb;
  dynamic country;
  bool isMainLocation;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        postcode: json["postcode"],
        suburb: json["suburb"],
        country: json["country"],
        isMainLocation: json["is_main_location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "city": city,
        "state": state,
        "postcode": postcode,
        "suburb": suburb,
        "country": country,
        "is_main_location": isMainLocation,
      };
}

class EmployeeCurrentBusinessEmployer {
  EmployeeCurrentBusinessEmployer({
    this.id,
    this.firstName,
    this.lastName,
  });

  String id;
  String firstName;
  String lastName;

  factory EmployeeCurrentBusinessEmployer.fromJson(Map<String, dynamic> json) =>
      EmployeeCurrentBusinessEmployer(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
      };
}
