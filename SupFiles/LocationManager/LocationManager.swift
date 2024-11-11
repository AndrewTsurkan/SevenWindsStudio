import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func getCurrentLocation(completion: @escaping (CLLocation?) -> Void) {
        DispatchQueue.global().async { [weak self] in
            if CLLocationManager.locationServicesEnabled() {
                self?.locationManager.startUpdatingLocation()
            } else {
                print(Localizable.locationUnknowed)
            }
        }
        
        completion(locationManager.location)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last?.coordinate else {
            print(Localizable.locationError)
            return
        }
        print("\(Localizable.location) \(location.latitude), \(location.longitude)")
    }
        
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("\(Localizable.locationError): \(error.localizedDescription)")
    }
    
    func calculateDistance(from latitude1: Double, longitude1: Double, to latitude2: Double, longitude2: Double) -> Double {
        let R = 6371.0

        let lat1 = latitude1 * .pi / 180.0
        let lon1 = longitude1 * .pi / 180.0
        let lat2 = latitude2 * .pi / 180.0
        let lon2 = longitude2 * .pi / 180.0

        let dLat = lat2 - lat1
        let dLon = lon2 - lon1

        let a = sin(dLat / 2) * sin(dLat / 2) +
                cos(lat1) * cos(lat2) *
                sin(dLon / 2) * sin(dLon / 2)
        let c = 2 * atan2(sqrt(a), sqrt(1 - a))

        let distance = R * c
        return distance
    }
}
