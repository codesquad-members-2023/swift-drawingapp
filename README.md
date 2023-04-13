## ✅ 기능 목록

### 1. 아이패드 앱 프로젝트

- 구현  - 27 월, 28 화, 29 수
    - [x]  프로젝트 생성 및 설정
    - [x]  뷰 모델 클래스 작성
        - [x]  고유 아이디 생성 로직
        - [x]  size 타입
        - [x]  point 타입
        - [x]  color 타입 ?
        - [x]  description 구현
        - [x]  생성자
    - [x]  팩토리 클래스 작성
    - [x]  호출 코드 작성
- 피드백 반영 - 29 수, 30 목
    - [x]  DR 프리픽스 지우기
    - [x]  protocol 구현 extension으로 처리
    - [x]  Randomize 지우고 각 타입용 팩토리 만들기
    - [x]  IDGenerator 주입하기
    - [x]  컬러 로직 바꾸기?!

### 2. 속성 변경 동작

- 구현 - 31 금
    - [x]  Plane 구조체 구현
        - [x]  var rectangles: [rect]
        - [x]  var count: Int { 사각형 전체 개수 }
        - [x]  subscript[index] → rect(전달한 index의 사각형)
        - [x]  func inquire(point) → [rect] (해당 point에 있는 사각형들)
    - [x]  UI
        - [x]  plane 표시 영역
        - [x]  사각형 생성 버튼
        - [x]  화면 우측 사이드바
        - [x]  rgb 정보 label
        - [x]  alpha slider + button 2
    - [x]  VC
        - [x]  plane
        - [x]  selectedRect
        - [x]  viewDidLoad
            - [x]  plane 초기화
            - [x]  화면에 Rectangle 표시 ? (처음엔 비어있지 않나)
        - [x]  updateUI
            - 모델 변경 사항에 따라 화면 업데이트
        - [x]  func 1 - plane 영역 tab gesture recognize →  select view
            - 탭 위치 구하기
            - plane.inquire(point) 호출
            - 가져온 배열 중 last로 selected 에 저장
            - 빈 배열이면 selected = nil
            - 선택된 사각형 border 활성화
            - rect 정보를 우측에 표시
        - [x]  func 2 - 사각형 생성
            - 사각형 생성
            - plane.rects 에 append
            - 화면 업데이트
        - [x]  func 3 - slider action
            - updateAlpha 호출
            - ~~UI 업데이트?~~
        - [x]  func 4 - button action
            - updateAlpha 호출
            - ~~UI 업데이트?~~
        - [x]  func 5 - updateAlpha(of rect: )
            - sender slider의 current value 구하기 (필요하면 매핑)
            - 조건에 따라 비활성화
            - 해당 값으로 현재 selected.color.alpha 업데이트
            - 화면 업데이트
        - [x]  Plane 유닛 테스트
- 피드백 반영

## 📗 학습 계획

### 27일 월요일, 28일 화요일

1단계

- [x]  ios 관련 학습 자료
    - [x]  ****[About App Development with UIKit](https://developer.apple.com/documentation/uikit/about_app_development_with_uikit)****
    - [x]  ****[App and environment](https://developer.apple.com/documentation/uikit/app_and_environment)****
- [ ]  ~~UUID 로직?~~
- [ ]  ~~팩토리 패턴~~
- [x]  MVC
- [x]  프로토콜 - 역할과 표현 방식
- [x]  시스템 로그 함수?
- [x]  Color

### 30일 목요일

2단계 관련

- [x]  좌표 시스템 강의

### 31일 금요일

2단계 관련

- [x]  프로토콜 some, any ([링크](https://www.youtube.com/watch?v=3sfrqRaLuWk)) →  학습 내용 정리

### 4월 3일 월요일

- [x]  터치 이벤트 처리 (Tab gesture recognizer)
- [x]  모델 업데이트를 화면에 반영하는 방법 (화면을 다시 그리는 방법)

### 4월 4일 화요일

- [x]  마스터 클래스 강의 자료 복습

### 4월 10일 월요일

- [x]  유닛 테스트
    - [x]  [https://www.kodeco.com/21020457-ios-unit-testing-and-ui-testing-tutorial](https://www.kodeco.com/21020457-ios-unit-testing-and-ui-testing-tutorial)

### 4월 11일 화요일

- [x]  클래스 수업 자료 옵저버 패턴 복습
    - [x]  kvo
    - [x]  pub-sub

### 4월 12일 수요일

- [x]  Notification center 학습

### 4월 13일 목요일

- [x]  3-3
    - [x]  요구사항 파악
    - [x]  addRect
    - [x]  select, deselect
    - [x]  setColor
    - [x]  setAlpha
- [ ]  JK 구현 리뷰

### 4월 14일 금요일

- [ ]  비동기 프로그래밍 (금요일 클래스 예습)

### POOL

- [ ]  loose coupling 의 목적과 장점

4단계

- [ ]  PhotoPicker
    - [ ]  PickerViewController
    - [ ]  권한 관련
- [ ]  UIImage, ImageView (구현에서 활용할 부분에 대해서만)
- [ ]  Data - Image, Image.init(data:)

# 작업 기록

[작업 결과 기록](https://www.notion.so/3709c4ea86a9497781c1f88b3cd9cde6)

[구현 과정 기록](https://www.notion.so/07ca80058cdb4440a90da555e18887d6)

# 학습 노트

### 구현 관련 학습

[step 3-1 학습 노트](https://www.notion.so/step-3-1-7a878935c12642cf987a5277cafc167c)

[step 3-2 학습 노트](https://www.notion.so/step-3-2-6374ffb9319240198f9d5a86b842a031)

[step 3-3 학습 노트](https://www.notion.so/step-3-3-8a1ed691cee04ef98b4d8855b04a222e)

### 수업 관련 학습

[[w4-tue] 마스터 클래스](https://www.notion.so/w4-tue-bed7dc9ccdc54c33af0955375170e283)