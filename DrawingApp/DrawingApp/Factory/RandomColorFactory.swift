struct RandomColorFactory: RandomValueFactory {
    typealias FigureProperty = Color
    
    static func make() -> Color {
        let randomRange = 0...255.0
        let red = Double.random(in: randomRange) / randomRange.upperBound
        let green = Double.random(in: randomRange) / randomRange.upperBound
        let blue = Double.random(in: randomRange) / randomRange.upperBound
        return Color(red: red, green: green, blue: blue)
    }
}
