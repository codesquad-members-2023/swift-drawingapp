# swift-drawingapp
# 학습 계획
## 아이패드 앱 프로젝트 (Step 3-1)
## 학습
- [x] 뷰를 생성하는 팩토리 방식에 대해 학습
- [x] MVC 구조 학습
- [x] 로그 함수 학습
- [x] 프로토콜(Protocol) 역할과 표현 방식에 대해 학습
- [ ] iOS 메인 런루프 동작 학습

## 구현
- [x] 고유아이디 구현
- [x] UIKit을 import하지 않고, 독립적인 타입으로 선언
- [x] CustomStringConvertible 프로토콜을 추가하고 구현
- [x] viewDidLoad() 함수에서 팩토리에서 모델 객체 4종류를 생성하고 print()가 아닌 시스템 로그 함수로 출력
<img width="1384" alt="스크린샷 2023-04-03 오후 3 04 11" src="https://user-images.githubusercontent.com/115064144/229424506-b599bd5c-4c76-47d3-9517-a3df1431024d.png">



## 속성 변경 동작 (Step 3-2)
## 학습
- [ ] class와 struct 차이 학습
- [ ] 탭 제스처 인식기 학습
- [ ] 터치 이벤트 동작 학습
- [ ] 강의자료 '좌표 시스템' 시청하고 학습

## 구현
- [ ] 선택한 사각형 속성을 변경하면, 화면에 색상과 투명도가 바뀌도록 구현
- [ ] 배경색 버튼은 16진수로 표현
- [ ] 투명도 10단계로 나눠서 표현
- [ ] 좌,우 버튼에 투명도 조절 기능 구현
- [ ] Subscript로 index넘기면 사각형 모델 return


## 관찰자(Observer) 패턴 (Step 3-3)
## 학습
- [ ] 강의자료 시청
- [ ] NotificationCenter 동작 방식을 학습
- [ ] loosed coupled 구조 장점 학습

## 구현
- [ ] NotificationCenter 동작 방식 프로젝트에 적용
- [ ] viewDidLoad에서 Observe를 등록
- [ ] 사각형 추가, 속성 바뀔 때마다 화면 업데이트
- [ ] 속성 변경시 모델 값이 변할 때마다 변화에 대해 NotificationCenter에 Post


## 사진 추가하기 (Step 3-4)
## 학습
- [ ] PhotoPicker 학습
- [ ] UIPickerViewControler 학습
- [ ] ImageView 학습

## 구현
- [ ] 사진 앨범에서 원하는 사진 연동
- [ ] 원하는 사진의 속성 변경시, 화면에 이미지 투명도가 바뀌도록 구현
- [ ] 사진 추가하기 버튼 추가
