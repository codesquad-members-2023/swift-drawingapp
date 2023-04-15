class RectangleFactory {
    private let pointFactory: RandomPointFactory
    
    init?(safeArea: Point?, screen: Size) {
        guard let safeArea = safeArea else {
            return nil
        }
        self.pointFactory = RandomPointFactory(safeArea, screen)
    }
    
    func makeRectangle() -> Rectangle {
        let id = RandomIdFactory.make()
        let size = Size(width: 150, height: 120)
        let point = pointFactory.make()
        let color = RandomColorFactory.make()
        let alpha = RandomAlphaFactory.make()
        return Rectangle(size: size, id: id, point: point, color: color, alpha: alpha)
    }
}
