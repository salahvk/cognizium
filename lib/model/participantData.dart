class Participants {
  String zone;
  String name;
  String father;
  String contactNo;
  String address;
  String age;

  Participants({
    required this.zone,
    required this.name,
    required this.father,
    required this.contactNo,
    required this.address,
    required this.age,
  });

  Map<String, dynamic> tojson() => {
        'zone': zone,
        'name': name,
        'father': father,
        'contactNo': contactNo,
        'address': address,
        'age': age,
      };

  static Participants fromJson(Map<String, dynamic> json) => Participants(
      zone: json['zone'],
      name: json['name'],
      father: json['father'],
      contactNo: json['contactNo'],
      age: json['age'],
      address: json['address']);
}
