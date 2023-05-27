class AgendaItem {
  final String agendaDate;
  final String agendaLocation;

  AgendaItem({
    required this.agendaDate,
    required this.agendaLocation,
  });

  factory AgendaItem.fromJson(Map<String, dynamic> json) {
    return AgendaItem(
      agendaDate: json['agenda_date'] as String,
      agendaLocation: json['agenda_location'] as String,
    );
  }
}
