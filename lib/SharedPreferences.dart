import 'package:shared_preferences/shared_preferences.dart';

saveUserID(String userID) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString("userid", userID);
}

getUserID() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var userID = await pref.getString("userid");
  return userID;
}

SaveTeamName(String TeamName) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString("teamname", TeamName);
}

getTeamName() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var TeamName = await pref.getString("teamname");
  return TeamName;
}

setCheckedIn(bool isCheckedIn) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setBool("isCheckedIn", isCheckedIn);
}

Future<bool?> getCheckedin() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var isCheckedIn = await pref.getBool("isCheckedIn");
  return isCheckedIn;
}
