// Color 팩토리를 따로 분리한 이유는
// 요구사항인 선택한 사각형을 랜덤색상으로 바꿀때
// 랜덤색상을 생성시 타입메소드로 사용하기 위함입니다.

struct RandomColorFactory {
    static func createColor() -> Color {
        let randomRange = 0...255.0
        let red = Double.random(in: randomRange)
        let green = Double.random(in: randomRange)
        let blue = Double.random(in: randomRange)
        return Color(red: red, green: green, blue: blue)
    }
}
