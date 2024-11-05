import UIKit

final class ListViewController: UIViewController {
    //MARK: - Private properties -
    let contenView = ListContentView()
    var output: ListViewOutput?
    
    override func loadView() {
        super.loadView()
        view = contenView
    }
}

//MARK: - Public -
extension ListViewController {
    func setOutput(output: ListViewOutput) {
        self.output = output
    }
}

//MARK: - ListViewInput -
extension ListViewController: ListViewInput {
    
}
