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
  static Future<void> savePartnerImageSharedPreference(
      String imageUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(sharedPreferencePartnerImageKey, imageUrl);
  }

  //------ Get User Shared Preferences
  static Future<String> getUserImageSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferenceUserImageKey) ?? '';
  }

  //------ Get Partner Shared Preferences
  static Future<String> getPartnerImageSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sharedPreferencePartnerImageKey) ?? '';
  }
}
