import 'package:shared_preferences/shared_preferences.dart';

saveUserID(String userID) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString("userid", userID);
}

getUserID() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var userID = pref.getString("userid");
  return userID;
}

SaveTeamName(String TeamName) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString("teamname", TeamName);
}

getTeamName() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  var TeamName = pref.getString("teamname");
  return TeamName;
}