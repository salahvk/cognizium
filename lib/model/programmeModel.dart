class ProgrammeModel {
  String? programme;
  List<Participants2>? participants;

  ProgrammeModel({this.participants, this.programme});

  ProgrammeModel.fromJson(Map<String, dynamic> json) {
    programme = json['programme'];
    if (json['participant'] != null) {
      participants = <Participants2>[];
      json['participant'].forEach((v) {
        participants!.add(Participants2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['programme '] = programme;
    if (participants != null) {
      data['participant'] = participants!.map((v) => v.tojson()).toList();
    }
    return data;
  }
}

class Participants2 {
  String name;
  String place;
  String team;

  Participants2({
    required this.name,
    required this.place,
    required this.team,
  });

  Map<String, dynamic> tojson() => {'name': name, 'place': place, 'team': team};

  static Participants2 fromJson(Map<String, dynamic> json) => Participants2(
      name: json['name'], place: json['place'], team: json['team']);
}
