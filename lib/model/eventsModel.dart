class EventsModel {
  String event;

  EventsModel({
    required this.event,
  });

  Map<String, dynamic> tojson() => {
        'event': event,
      };

  static EventsModel fromJson(Map<String, dynamic> json) =>
      EventsModel(event: json['event']);
}
