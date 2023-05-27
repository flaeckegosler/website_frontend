class AgendaItem {
  final String agendaDate;
  final String agendaDateDisplay;
  final String agendaLocation;

  AgendaItem({
    required this.agendaDate,
    required this.agendaDateDisplay,
    required this.agendaLocation,
  });

  factory AgendaItem.fromJson(Map<String, dynamic> json) {
    return AgendaItem(
      agendaDate: json['agenda_date'] as String,
      agendaDateDisplay: json['agenda_date_display'] as String,
      agendaLocation: json['agenda_location'] as String,
    );
  }
}
