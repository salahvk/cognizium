class Participants {
  String zone;
  String name;
  String father;
  String contactNo;
  String place;
  String age;

  Participants({
    required this.zone,
    required this.name,
    required this.father,
    required this.contactNo,
    required this.place,
    required this.age,
  });

  Map<String, dynamic> tojson() => {
        'zone': zone,
        'name': name,
        'father': father,
        'contactNo': contactNo,
        'place': place,
        'age': age,
      };

  static Participants fromJson(Map<String, dynamic> json) => Participants(
      zone: json['zone'],
      name: json['name'],
      father: json['father'],
      contactNo: json['contactNo'],
      age: json['age'],
      place: json['place']);
}
