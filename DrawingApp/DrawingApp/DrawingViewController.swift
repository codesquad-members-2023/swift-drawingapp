import UIKit
import OSLog

class DrawingViewController: UIViewController {
    var tapGestureRecognizer = UITapGestureRecognizer()
    var rectangleFactory: RectangleFactory?
    var plane = Plane()
    var selectedView: [UIView] = []
    var rectangleViews: [UIView] = []
    var logger: Logger = Logger(subsystem: "com.inwoo.DrawingApp", category: "ViewController")
    var rectangleCreator = UIButton()
    // 우측 투명도와 색상을 변경시켜주는 뷰를 숨겨주는 버튼입니다.
    var inspectorHider = UIButton()

    private(set) var safeArea: Point?
    private(set) var screen: Size?
    var isButtonsPlaced = false
    
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var figureInsperctorView: UIView!
    @IBOutlet weak var colorChanger: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        
        rectangleCreator = makeRectangleCreatorButton()
        inspectorHider = makeInspectorHideButton()
        self.view.addSubview(inspectorHider)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 팩토리가 viewDidAppear 최초 호출시에만 초기화 되도록 구현 했습니다.
        // viewDidAppear에서 초기화 한 이유는 SafeArea값을 팩토리에서 생성하는데 필요하기 때문입니다.
        // 최초 호출을 하도록 의도한 이유는 viewDidAppear의 재호출시 팩토리의 중복초기화를 피하기 위함입니다.
        if safeArea == nil, screen == nil {
            safeArea = getSafeAreaPoint()
            screen = getScreenSize()
        }
        
        guard var screenWidth = screen?.width, let screenHeight = screen?.height else {
            return
        }
        screenWidth -= figureInsperctorView.frame.width
        rectangleFactory = RectangleFactory(safeArea: safeArea,
                                            screen: Size(width: screenWidth, height: screenHeight))
        
        if !isButtonsPlaced {
            // 두개의 버튼을 원하는 위치에 두는 메소드입니다.
            // SafeArea가 호출된 후에 위치를 지정하도록 했습니다.
            place(button: rectangleCreator, type: .rectangleCreator)
            place(button: inspectorHider, type: .inspectorhider)
            isButtonsPlaced = true
        }
        
    }
    
    @objc func tap(_ sender: UITapGestureRecognizer) {
        guard let tappedPoint = plane.isExist(in: sender.location(in: self.view)) else {
            // 존재하지 않으면 선택 취소
            selectedView.forEach {
                $0.layer.borderWidth = 0
            }
            selectedView.removeAll()
            return
        }
        
        guard let rectangleView = self.view.hitTest(tappedPoint, with: nil) else {
            return
        }
        
        rectangleView.layer.borderWidth = 2
        rectangleView.layer.borderColor = UIColor.blue.cgColor
        selectedView.append(rectangleView)
    }
    
    @IBAction func changeColor(_ sender: UIButton) {
        let randomColor = RandomColorFactory.make()
        
        let viewIndices = findIndex(of: selectedView)
        plane.changeColor(indicies: viewIndices, with: randomColor)
        
        viewIndices.forEach {
            guard let rectangle = plane[$0] else {
                return
            }
            rectangleViews[$0].backgroundColor = convertToUIColor(by: rectangle.color,
                                                                  with: rectangle.alpha)
        }
    }
    
    @IBAction func changeAlpha(_ sender: UISlider) {
        let value = Double(sender.value)
        let viewIndices = findIndex(of: selectedView)
        
        plane.changeAlpha(indices: viewIndices, with: value)
        
        viewIndices.forEach {
            rectangleViews[$0].alpha = value
        }
    }
    
    @objc func create(_ sender: UIButton) {
        guard let rectangle = rectangleFactory?.makeRectangle() else { return }
        plane.add(element: rectangle)
        
        let rectangleView = convertToView(by: rectangle)
        
        self.rectangleViews.append(rectangleView)
        self.view.addSubview(rectangleView)
        self.view.bringSubviewToFront(sender)
    }
    
    @objc func hide(_ sender: UIButton) {
        if !figureInsperctorView.isHidden {
            figureInsperctorView.isHidden = true
        }
        else {
            figureInsperctorView.isHidden = false
        }
    }
}

extension DrawingViewController {
    // 버튼 구현을 IBAction대신 코드로 작성한 이유는 Configuration을 적용시키기 위함입니다.
    private func makeRectangleCreatorButton() -> UIButton {
        let buttonSize = CGSize(width: 106, height: 66)
        let frame = CGRect(origin: CGPoint(x: 0, y: 0),
                           size: buttonSize)
        let button = UIButton(frame: frame)
        button.addTarget(self, action: #selector(create), for: .touchUpInside)
        
        var config = UIButton.Configuration.gray()
        config.image = UIImage(systemName: "rectangle")
        config.imagePadding = 10
        config.imagePlacement = .top
        config.buttonSize = .medium
        
        var title = AttributedString("사각형")
        title.font = .systemFont(ofSize: 16.0, weight: .light)
        config.attributedTitle = title
        
        button.configuration = config
        self.view.addSubview(button)
        return button
    }
    
    // 버튼 위치를 지정해주는 함수를 작성한 이유는 SafeArea영역을 이용해
    // 원하는 위치에 두기 위해서입니다.
    private func place(button: UIButton, type: ButtonType) {
        guard let screenSize = screen, let safeAreaPoint = safeArea else {
            return
        }
        var pointX: Double = screenSize.width - button.frame.width
        var pointY: Double = 0
        
        let closure = { (button: UIButton) -> () in
            switch type {
            case .inspectorhider:
                button.frame.origin = CGPoint(x: pointX, y: safeAreaPoint.y)
            case .rectangleCreator:
                pointX /= 2
                pointY = screenSize.height - (button.frame.height + self.view.layoutMargins.bottom)
                button.frame.origin = CGPoint(x: pointX, y: pointY)
            }
        }
        
        closure(button)
    }
    
    private func makeInspectorHideButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 58, height: 34))
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.gray
        button.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        button.addTarget(self, action: #selector(hide), for: .touchUpInside)
        
        return button
    }
    
    private func findIndex(of views: [UIView]) -> [Int] {
        var viewIndices: [Int] = []
        views.forEach {
            if let index = rectangleViews.firstIndex(of: $0) {
                viewIndices.append(index)
            }
        }
        return viewIndices
    }
    
    private func convertToView(by rectangle: Rectangle) -> UIView {
        let rectangleView = UIView(
            frame: CGRect(x: rectangle.point.x,
                          y: rectangle.point.y,
                          width: rectangle.size.width,
                          height: rectangle.size.height))
        rectangleView.backgroundColor = convertToUIColor(by: rectangle.color,
                                                         with: rectangle.alpha)
        return rectangleView
    }
    
    // Color를 UIColor로 변경하여 return 하는 메소드
    private func convertToUIColor(by color: Color, with alpha: Alpha) -> UIColor {
        let red = CGFloat(color.red)
        let green = CGFloat(color.green)
        let blue = CGFloat(color.blue)
        let alphaMaxValue = 10.0
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha.rawValue / alphaMaxValue)
        return color
    }

    private func getSafeAreaPoint() -> Point {
        let safeAreaPointX = Double(self.view.layoutMargins.top)
        let safeAreaPointY = Double(self.view.layoutMargins.bottom)
        return Point(x: safeAreaPointX, y: safeAreaPointY)
    }
    
    private func getScreenSize() -> Size? {
        guard let screenBounds = self.view.window?.windowScene?.screen.bounds else {
            return nil
        }
        let screenWidth = screenBounds.size.width
        let screenHeight = screenBounds.size.height
        return Size(width: screenWidth, height: screenHeight)
    }
}

fileprivate extension DrawingViewController {
    enum ButtonType {
        case inspectorhider
        case rectangleCreator
    }
}
