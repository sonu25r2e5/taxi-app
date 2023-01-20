import 'package:ClimateChange/assistant/requestAssistant.dart';
import 'package:geolocator/geolocator.dart';

class AssistantMethods {
  static Future<String> searchCoodinateAddress(Position position) async {
    String placeAdress = "";
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyBWJxlR_b_snGDqUHo6Ga-mQTKrQiqBUrk";
    var response = await RequestAssistant.getRequest(url);

    if (response != "failed") {
      placeAdress = response["results"][0]["formatted_address"];
    }
    return placeAdress;
  }
}
