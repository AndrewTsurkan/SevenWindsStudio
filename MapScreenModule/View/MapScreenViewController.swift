import UIKit
import MapKit

final class MapScreenViewController: UIViewController {
    //MARK: - Private properties -
    private let contentView = MapScreenContentView()
    var output: MapScreenViewOutput?
    
    //MARK: - Life cycle -
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output?.onViewDidLoad()
        setupNavigationBar()
    }
}


//MARK: - Public -
extension MapScreenViewController {
    func setOutput(output: MapScreenViewOutput) {
        self.output = output
    }
}

//MARK: - MapScreenViewInput -
extension MapScreenViewController: MapScreenViewInput {
    func addPlacemark(data: ListEntity) {
        guard let latitudeString = data.point?.latitude,
              let longitudeString = data.point?.longitude,
              let longitude = Double(longitudeString),
              let latitude = Double(latitudeString),
        let text = data.name else { return }
        contentView.addPlacemark(latitude: latitude, longitude: longitude, text: text, id: data.id!)
    }
}

//MARK: - Private -
private extension MapScreenViewController {
    func setupNavigationBar() {
        navigationItem.title = "Map"
    }
}
