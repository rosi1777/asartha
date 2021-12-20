import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelperFunctions {
  static String sharedPreferenceUserImageKey = "USERIMAGE";
  static String sharedPreferencePartnerImageKey = "PARTNERIMAGE";

  //------Save User Preferences----
  static Future<void> saveUserImageSharedPreference(String imageUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(sharedPreferenceUserImageKey, imageUrl);
  }

  //------Save Partner Preferences----
  static Future<void> savePartnerImageSharedPreference(String imageUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(sharedPreferencePartnerImageKey, imageUrl);
  }

  //------ Get User Shared Preferences
  static Future<String> getUserImageSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferenceUserImageKey) ??
        'https://firebasestorage.googleapis.com/v0/b/asartha-285a1.appspot.com/o/PngItem_1503945.png?alt=media&token=6f598ef5-2fd1-40b7-aa2a-963e8ea76784';
  }

  //------ Get Partner Shared Preferences
  static Future<String> getPartnerImageSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferencePartnerImageKey) ??
        'https://firebasestorage.googleapis.com/v0/b/asartha-285a1.appspot.com/o/PngItem_1503945.png?alt=media&token=6f598ef5-2fd1-40b7-aa2a-963e8ea76784';
  }
}
