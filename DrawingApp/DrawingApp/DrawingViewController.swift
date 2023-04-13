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
    var inspectorHider = UIButton()
    
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
        if rectangleFactory == nil {
            let safeAreaPoint = getSafeAreaPoint()
            guard let screenSize = getScreenSize() else {
                return
            }
            rectangleFactory = RectangleFactory(deviceSafeArea: safeAreaPoint,
                                                deviceScreenSize: screenSize)
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
        let randomColor = RandomColorFactory.createColor()
        
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
            rectangleViews[$0].alpha = CGFloat(value)
        }
    }
    
    @objc func create(_ sender: UIButton) {
        guard let rectangle = rectangleFactory?.create() else { return }
        plane.add(element: rectangle)
        
        let rectangleView = converToView(by: rectangle)
        
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
    private func makeRectangleCreatorButton() -> UIButton {
        var title = AttributedString("사각형")
        title.font = .systemFont(ofSize: 16.0, weight: .light)
        
        var config = UIButton.Configuration.gray()
        config.attributedTitle = title
        config.image = UIImage(systemName: "rectangle")
        config.imagePadding = 10
        config.imagePlacement = .top
        config.buttonSize = .medium
        
        let frame = CGRect(x: 554, y: 748, width: 106, height: 66)
        let button = UIButton(frame: frame)
        button.configuration = config
        button.addTarget(self, action: #selector(create), for: .touchUpInside)
        
        self.view.addSubview(button)
        return button
    }
    
    private func makeInspectorHideButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 1136, y: 22, width: 58, height: 34))
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
    
    private func converToView(by rectangle: Rectangle) -> UIView {
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
        let rgbMaxValue = 255.0
        let red = CGFloat(color.red / rgbMaxValue)
        let green = CGFloat(color.green / rgbMaxValue)
        let blue = CGFloat(color.blue / rgbMaxValue)
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
        let screenWidth = screenBounds.size.width - figureInsperctorView.frame.width
        let screenHeight = screenBounds.size.height
        return Size(width: screenWidth, height: screenHeight)
    }
}
