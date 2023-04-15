struct RandomPointFactory {
    typealias FigureProperty = Id
    let safeArea: Point
    let screen: Size
    
    init(_ safeArea: Point, _ screen: Size) {
        self.safeArea = safeArea
        self.screen = screen
    }
    
    func make() -> Point {
        let fixedFigureWidth: Double = 150
        let fixedFigureHeight: Double = 120
        let rangeOfX = safeArea.x...(screen.width - fixedFigureWidth)
        let rangeOfY = safeArea.y...(screen.height - fixedFigureHeight)
        let pointX = Double.random(in: rangeOfX)
        let pointY = Double.random(in: rangeOfY)
        return Point(x: pointX, y: pointY)
    }
}
