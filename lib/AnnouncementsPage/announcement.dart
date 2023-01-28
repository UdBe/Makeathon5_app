import 'package:intl/intl.dart';

class Announcement {
  List months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  String? body;
  String? time;
  String? date;
  String? formattedDateTime;
  DateTime? dateTime;

  Announcement({this.body, this.formattedDateTime}) {
    dateTime = dateFormat.parse(formattedDateTime!);
    date = "${dateTime!.day} ${months[dateTime!.month]}";
    time = DateFormat("h mm a").format(dateTime!);
  }
}
