struct RandomAlphaFactory: RandomValueFactory {
    typealias FigureProperty = Alpha
    
    static func make() -> Alpha {
        let allAlphaCases = Alpha.allCases
        let randomIndex = Int.random(in: 0..<allAlphaCases.count)
        let randomAlpha = allAlphaCases[randomIndex]
        return randomAlpha
    }
}
