import 'package:distance_geolocator/service/distance.dart';
import 'package:flutter/foundation.dart';

class DistanceProvider with ChangeNotifier{
  double result = 0;

  getdistance(double latnow, double longnow, double latdesti, double longdesti)async{
    Distance().getDistanceWithGeolocator(latnow, longnow, latdesti, longdesti).then((value){
      result = value;
      notifyListeners();
    });
  }
}