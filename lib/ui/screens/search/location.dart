import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  // Singleton pattern
  static final GeolocatorService _instance = GeolocatorService._internal();
  factory GeolocatorService() => _instance;
  GeolocatorService._internal();

  Position? _currentPosition;

  Future<Position> getCurrentPosition() async {
    if (_currentPosition == null) {
      // Request location permission
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // Get current position
      _currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }
    return _currentPosition!;
  }

  // Additional helper functions
  double getLatitude() => _currentPosition?.latitude ?? 0.0;
  double getLongitude() => _currentPosition?.longitude ?? 0.0;
}
