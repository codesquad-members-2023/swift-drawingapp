# MVC 디자인 패턴

## 디자인 패턴 ?

- 객체끼리 소통을 함에 있어서 체계없이 중구난방으로 서로의 메세지를 주고받으면 이게 뭔 소린가 싶다. 그래서 여러개의 객체가 역할과 책임을 부여받고 이렇게 분류를 해놓는 것이 프로그램이 동작하는데에 있어서  효율적이더라. 그래서 만들어진게 DESIGN PATTERN. 그 수많은 패턴 중 하나가 MVC.

## MVC ?

- 객체의 역할을 크게 3가지로 ***”간단히”*** 분류해보자.
    
    ### MODEL 의 역할
    
    - 데이터 관리
    - 데이터의 저장소이며 컨트롤러의 요청에 따라 사용자가 요청한 내용을 업데이트 한다.
    - 표시 형식에 의존하지 않는다. 다시 말해, 사용자에게 어떻게 보일지에 대해 신경쓰지 않아도 된다.
    - MVC에서 모델은 여러 개의 뷰(view)를 가질 수 있다.
    
    ### VIEW 의 역할
    
    <img width="463" alt="스크린샷 2023-03-27 오후 4 03 08" src="https://user-images.githubusercontent.com/88966578/227872196-c1a4cc6c-80db-4e85-8a32-e4c3505524ad.png">

    
    이녀석들이 전부 View다. 
    
    - 사용자에게 보여지는 인터페이스 역할
    - 뷰는 보여줄 값(모델)을 ***“컨트롤러”*** 로부터 받아와 사용자에게 보여준다.
    - MVC의 뷰는 여러 개의 컨트롤러(controller)를 가지고 있다.
    
    ### CONTROLLER
    
    - Model 과 View 사이의 중간다리 ( 눈에 보이지 않아 )
    - 사용자는 컨트롤러를 사용하여 모델의 상태를 바꾼다.
    - 모델의 상태가 바뀌면 모델은 등록된 뷰에 자신의 상태가 바뀌었다는 것을 알리고 뷰는 거기에 맞게 사용자에게 모델의 상태를 보여 준다.
    - View와 Model의 직접적인 연결을 없애고 중계 역할을 함으로써 유지보수에 용이
    
    
    <img width="542" alt="스크린샷 2023-03-27 오후 4 35 57" src="https://user-images.githubusercontent.com/88966578/227872571-342b6bde-bfe8-4160-8e48-5ea3b32b047a.png">

    모델, 뷰, 컨트롤러의 관계를 묘사하는 간단한 다이어그램.
    
    ### MODEL - VIEW - CONTROLLER 흐름 
    
    포커게임에서 USER가 화면에 있는 덱의 View를 터치하면 덱에서 한장 카드를 한장 뽑는 흐름을 생각하면 
    
    1 ) USER 가 VIEW(덱)을 터치하는 이벤트 발생 
    
    2 ) VIEW -[이벤트전달]-> CONTROLLER 
    
    3 ) CONTROLLER  -[값 변경]-> Model(Deck Class) 
        * 덱에서 1장 감소 
        
    4 ) Model(Deck Class) -[변경사항 업데이트]-> CONTROLLER 

    5 ) CONTROLLER  -[변경사항에 따른 화면 업데이트]-> VIEW
    
    ### 주의사항 
    
    - 느슨한 연결 지향 : 유연성 확보 
    - 메세지를 보낼때 MVC 계층을 건너 뛰지마라 : 컨트롤러로 메세지를 조정할 수 있음
    - 하나의 객체에 MVC 역할을 섞지마 : 하나의 객체가 너무 많은 일을 하도록 하지마
    - 뷰 클래스에서 모델 데이터를 선언하지마 : 중복됨 
    - 모델끼리의 직접적인 상호작용은 하지마 : 모델끼리의 교환도 컨트롤러를 거쳐서 
    
# Factory Method    
    
## 개요

어떤 상황에서 조건에 따라 객체를 다르게 생성해야 할 때가 있다.

예를 들면, 사용자의 입력값에 따라 하는 일이 달라질 경우, 분기를 통해 특정 객체를 생성해야 한다. 

객체마다 하는 일이 다르기 때문에 조건문에 따라 객체를 다르게 생성하는 것은 이상한 일이 아니다.

팩토리 메서드 패턴은 이렇게 분기에 따른 객체의 생성을 직접하지 않고,

팩토리라는 클래스에 위임하여 팩토리 클래스가 객체를 생성하도록 하는 방식을 말한다.

팩토리는 말 그대로 객체를 찍어내는 공장을 의미한다.

- 객체를 생성하기 위해 인터페이스를 정의하지만, 어떤 클래스의 인스턴스를 생성할지에 대한 결정은 서브클래스가 내리도록 한다.
    - <팩토리 메소드란 쉽게 말하면 객체를 생성 반환하는 메서드이다.>
    
- 다시 말해서 팩토리메서드 패턴이란 **하위 클래스에서 팩토리 메서드를 오버라이딩해서 객체를 반환**하게 하는 패턴이다.

## PhoneFactory 예시

<img width="605" alt="스크린샷 2023-03-27 오후 5 52 57" src="https://user-images.githubusercontent.com/88966578/227893776-e3ee53be-f4dd-4e1d-bf27-361d3b7a032c.png">

- 프로토콜로 빈 메서드만 구현을 해놓고, 팩토리에 채택시켜 사용.
- 특정 팩토리만 사용가능한 것도 아니고 , 형태도 똑같고 , 더 심플해지고 ..
- Plane에서 프로토콜만 알고 어떤 팩토리가 어떻게 구현되어있는지 몰라도 됨. 테스트하는게 가능한 구조
- 테스트하는게 유리한 구조.
- 항상 추상화된 프로토콜 타입을 사용하여 쓰는 구조.

## 테스트 하기 어려운 것들.

- 일단 리턴타입이 없는 경우. 테스트하려면 실행결과를 확인할 수밖에 없음. 이러면 단위 테스트 하기가 어려워.

## 테스트 하기 유리한 것들.

- 가짜 매개변수나 객체를 넘겨주면서 큰덩어리의 ‘일부분만’ 테스트 할 수 있는 구조.

# Observer Pattern 

[SRC 1: [https://velog.io/@haero_kim/옵저버-패턴-개념-떠먹여드립니다](https://velog.io/@haero_kim/%EC%98%B5%EC%A0%80%EB%B2%84-%ED%8C%A8%ED%84%B4-%EA%B0%9C%EB%85%90-%EB%96%A0%EB%A8%B9%EC%97%AC%EB%93%9C%EB%A6%BD%EB%8B%88%EB%8B%A4)]

[SRC 2: [https://ko.wikipedia.org/wiki/옵서버_패턴](https://ko.wikipedia.org/wiki/%EC%98%B5%EC%84%9C%EB%B2%84_%ED%8C%A8%ED%84%B4)]

<img width="253" alt="스크린샷 2023-03-28 오전 10 56 35" src="https://user-images.githubusercontent.com/88966578/228112914-40d915a9-e90b-4c6c-91c6-a915f2929f41.png">
딱 걸렸다. 이 자식.

## 개요

이벤트들을 감시하여, 이벤트가 발생할 때마다 미리 정의 해놓은 어떠한 동작을 즉각 수행하게 해주는 프로그래밍 패턴을 옵저버 패턴이라고 한다.

```swift
ex) A 라는 버튼이 클릭될 때마다 화면에 'Hello'를 출력하는 동작 
```

프로토콜을 적절히 사용하여 이러한 패턴을 구현해 볼 수 있다. 

## 옵저버 패턴 구현

둘 사이에 **’옵저버’역할 프로토콜**을 하나 끼워넣어 구현한다. 상호작용을 해야 할 클래스 A , B 가 있을 때 

**A 는 옵저버를 상속하여 이벤트가 발생할 때마다 실행되게 할 메소드를 구현**해둔다. 그리고 **B에서 옵저버타입의 객체를 생성**하여, 이벤트가 **발생할 때마다 옵저버객체가 A가 구현한 인터페이스 메소드를 호출**
하면 된다.

## 마음에 와 닿지 않는다.

와 닿게 해보자. 

- class Counter 는 1~100 까지 숫자를 센다.
- 5의 배수마다 옵저버가 class EventPrinter에게 알려준다.

```swift
protocol EventListener {
    func onEvent(count: Int)
}
```

- ↑ 프로토콜을 만들어 줬다. 이 녀석이 옵저버 역할을 할 녀석이다.

```swift
class EventPrinter: EventListener {
    func onEvent(count: Int) {
        print("\(count)",terminator: " ")
    }

    func start(){
        Counter(listener: self).count()
    }
}
```

- ↑ 리스너를 상속받아 콜백 메소드. onEvent ()를 구현함 (5의 배수 출력).

```swift
class Counter {
    
    private let listener: EventListener 

        init(listener: EventListener) {
            self.listener = listener
        }
    
    func count() {
        for i in 1...100 {  // 1부터 100까지 숫자 세기
            if (i % 5 == 0) {
                listener.onEvent(count: i)
            }
        }
    }
}

EventPrinter().start() 
```

- ↑ Counter 안에서 옵저버 역할을 하는 listener가 관찰하고 있다가 5의 배수마다 onEvent를 호출하는 구조

<img width="269" alt="스크린샷 2023-03-28 오전 11 33 45" src="https://user-images.githubusercontent.com/88966578/228113071-64dcdc49-99bf-4b40-ba43-f25361768030.png">
<img width="507" alt="스크린샷 2023-03-28 오전 11 30 42" src="https://user-images.githubusercontent.com/88966578/228113101-af7d0ca7-946f-426e-95de-cac0336e7006.png">
옵저버. 보고완료.
