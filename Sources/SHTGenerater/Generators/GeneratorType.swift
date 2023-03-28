import Foundation

enum GeneratorType: String{
    case viewController
    case igViewController
    case sectionController
    case viewModel
    case cell
    case igCell
    case model
    case igModel
}

extension GeneratorType{
    var templateName: String{
        switch self {
        case .viewController:
            return "ViewController.stf"
        case .igViewController:
            return "IGViewController.stf"
        case .sectionController:
            return "SectionController.stf"
        case .viewModel:
            return "ViewModel.stf"
        case .model:
            return "Model.stf"
        case .igModel:
            return "IGModel.stf"
        case .cell:
            return "Cell.stf"
        case .igCell:
            return "IGCell.stf"
        }
    }
}

extension GeneratorType{
    var fileSuffixName: String{
        switch self {
        case .viewController:
            return "ViewController"
        case .igViewController:
            return "ViewController"
        case .sectionController:
            return "SectionController"
        case .viewModel:
            return "ViewModel"
        case .model:
            return "Model"
        case .igModel:
            return "Model"
        case .cell:
            return "Cell"
        case .igCell:
            return "Cell"
        }
    }
}
