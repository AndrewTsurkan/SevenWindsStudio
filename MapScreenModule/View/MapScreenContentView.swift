import UIKit
import YandexMapsMobile
import MapKit

fileprivate enum Constants {
    static let placemarkColorText: UIColor = .init(red: 132/255, green: 99/255, blue: 64/255, alpha: 1)
}
final class MapScreenContentView: UIView {
    //MARK: - Private properties -
    private let mapView = YMKMapView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Public -
extension MapScreenContentView{
    func addPlacemark(latitude: Double, longitude: Double, text: String, id: Int) {
        guard let image = UIImage(named: "placemark_icon") else { return }
        let placemark = mapView.mapWindow.map.mapObjects.addPlacemark()
        placemark.geometry = YMKPoint(latitude: latitude, longitude: longitude)
        placemark.setIconWith(image)
        
        placemark.setTextWithText(
            text,
            style: YMKTextStyle(
                size: 10,
                color: Constants.placemarkColorText,
                outlineWidth: 1,
                outlineColor: nil,
                placement: .bottom,
                offset: 0,
                offsetFromIcon: true,
                textOptional: false))
    }
}

//MARK: - UI -
private extension MapScreenContentView {
    func setupUI() {
        setupMapView()
        makeConstraints()
    }
    
    func makeConstraints() {
        mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupMapView() {
        addSubview(mapView)
        mapView.mapWindow.map.move(
            with: YMKCameraPosition(
                target: YMKPoint(latitude: 44.584018, longitude: 44.615646),
                zoom: 10,
                azimuth: 0,
                tilt: 0)
        )
    }
}

//MARK: - Private -
extension MapScreenContentView {
    
}
