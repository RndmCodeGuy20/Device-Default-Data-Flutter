String getTimeZone() {
  final DateTime now = DateTime.now();
  final String timeZone = now.timeZoneName;
  return timeZone;
}
