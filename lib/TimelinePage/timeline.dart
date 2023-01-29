import 'package:intl/intl.dart';

class Timeline {
  bool? isEnabled;
  DateTime? dateTimeStart, dateTimeEnd;
  String? title;
  String? body;
  String? duration;
  String? time;
  String? formattedDateTime;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  Timeline(
      {this.title,
      this.body,
      this.formattedDateTime,
      this.duration,
      this.isEnabled}) {
    dateTimeStart = dateFormat.parse(formattedDateTime!);
    int hours = int.parse(duration!.split(":")[0]);
    int minutes = int.parse(duration!.split(":")[1]);
    dateTimeEnd = dateTimeStart!.add(Duration(hours: hours, minutes: minutes));

    time =
        "${DateFormat("hh:mm a").format(dateTimeStart!)} - ${DateFormat("hh:mm a").format(dateTimeEnd!)}";
  }
}
