import UIKit
import OSLog

class DrawingViewController: UIViewController {
    var tapGestureRecognizer = UITapGestureRecognizer()
    var rectangleFactory: RectangleFactory?
    var plane = Plane()
    var selectedView: [UIView] = []
    var figureViews: [UIView] = []
    var logger: Logger = Logger(subsystem: "com.inwoo.DrawingApp", category: "ViewController")
    
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var figureInsperctorView: UIView!
    @IBOutlet weak var figureInspectorHideButton: UIButton!
    @IBOutlet weak var colorChanger: UIButton!
    @IBOutlet weak var rectangleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        self.view.addGestureRecognizer(tapGestureRecognizer)
        figureInspectorHideButton.layer.cornerRadius = CGFloat(15)
        rectangleButton.layer.cornerRadius = 40
        rectangleButton.layer.cornerCurve = .continuous
        colorChanger.layer.borderWidth = 2
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if rectangleFactory == nil {
            let safeAreaPoint = getSafeAreaPoint()
            guard let screenSize = getScreenSize() else {
                return
            }
            rectangleFactory = RectangleFactory(deviceSafeArea: safeAreaPoint, deviceScreenSize: screenSize)
        }
    }
    
    @IBAction func changeColor(_ sender: UIButton) {
        let randomColor = RandomColorFactory.createColor()
        
        let viewIndices = findIndex(of: selectedView)
        plane.changeColor(indicies: viewIndices, with: randomColor)
        
        selectedView.forEach {
            guard let alpha = Alpha(rawValue: Double($0.alpha)) else {
                return
            }
            $0.backgroundColor = convertToUIColor(by: randomColor, with: alpha)
        }
    }
    
    @IBAction func createRectangleView(_ sender: UIButton) {
        guard let rectangle = rectangleFactory?.create() else { return }
        plane.add(element: rectangle)
        
        let rectangleView = converToView(by: rectangle)
        
        self.figureViews.append(rectangleView)
        self.view.addSubview(rectangleView)
        self.view.bringSubviewToFront(sender)
    }
    
    @IBAction func hideInspector(_ sender: Any) {
        
    }
    
    @IBAction func isValuechanged(_ sender: UISlider) {
        let value = Double(sender.value)
        let viewIndices = findIndex(of: selectedView)
        
        plane.changeAlpha(indices: viewIndices, with: value)
        
        selectedView.forEach {
            $0.alpha = CGFloat(value)
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
}

extension DrawingViewController {
    private func findIndex(of views: [UIView]) -> [Int] {
        var viewIndices: [Int] = []
        views.forEach {
            if let index = figureViews.firstIndex(of: $0) {
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
        let screenWidth = screenBounds.size.width
        let screenHeight = screenBounds.size.height
        return Size(width: screenWidth, height: screenHeight)
    }
}
