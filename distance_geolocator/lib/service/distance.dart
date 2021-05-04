import 'package:geolocator/geolocator.dart';

class Distance {

  Future<double> getDistanceWithGeolocator(double latnow, double longnow, double latdesti, double longdesti) async{
    double distanceInMeters = await Geolocator.distanceBetween(latnow, longnow, latdesti, longdesti);
    double distanceInKiloMeters = distanceInMeters/1000;
    print(distanceInKiloMeters);
    return distanceInKiloMeters;
  }

}