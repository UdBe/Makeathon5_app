import 'package:intl/intl.dart';

class Timeline {
  bool? isActive, hasElapsed;
  DateTime? dateTimeStart, dateTimeEnd;
  String? title;
  String? body;
  String? duration;
  String? time;
  String? formattedDateTime;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  Timeline({this.title, this.body, this.formattedDateTime, this.duration}) {
    dateTimeStart = dateFormat.parse(formattedDateTime!);
    int hours = int.parse(duration!.split(":")[0]);
    int minutes = int.parse(duration!.split(":")[1]);
    dateTimeEnd = dateTimeStart!.add(Duration(hours: hours, minutes: minutes));
    DateTime now = DateTime.now();

    isActive = now.isAfter(dateTimeStart!) && now.isBefore(dateTimeEnd!);

    time =
        "${DateFormat("hh:mm a").format(dateTimeStart!)} - ${DateFormat("hh:mm a").format(dateTimeEnd!)}";

    hasElapsed = DateTime.now().isAfter(dateTimeEnd!);
  }
}
