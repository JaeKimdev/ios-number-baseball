
# 숫자 야구

## 📖 목차
1. [소개](#-소개)
2. [타임라인](#-타임라인)
3. [시각화된 프로젝트 구조](#-시각화된-프로젝트-구조)
4. [실행 화면](#-실행-화면)
5. [트러블 슈팅](#-트러블-슈팅)
6. [참고 링크](#-참고-링크)

## 🌱 소개

`Gundy`와 `mene` 팀이 만든 3개의 숫자로 하는 숫자 야구 게임입니다.

## ⏰ 타임라인

### Step 1
<center><img width="500" src="https://i.imgur.com/8AAQX3g.png"></center>
<center><img width="500" src="https://i.imgur.com/elgGZzm.png"></center>
<center><img width="500" src="https://i.imgur.com/ztw2KGa.png"></center>

### Step 2
<center><img width="500" src="https://i.imgur.com/ZkAWQfy.png"></center>
<center><img width="500" src="https://i.imgur.com/OViDjYc.png"></center>

## 👀 시각화된 프로젝트 구조

<div align="center" dir="auto">
<p dir="auto">
<center><img width="500" alt="스크린샷 2022-08-16 오후 4 35 22" src="https://user-images.githubusercontent.com/84453688/184835561-b17d400a-cddf-4b65-bcaf-2084e28b7c6a.png"></center>
</p>
</div>

<br>

| 승리 조건 | 스트라이크 / 볼 판정 |
|:--:|:--:|
|<img src="https://i.imgur.com/GOT8pGE.png" width="450">|<img src="https://i.imgur.com/mZfpg4X.png" width="450">|

<div align="center" dir="auto">
<p dir="auto">
<sub>이미지 출처: play.google.com/store/apps/details?id=com.snownaul.baseballgame&hl=en&gl=US<sub>
</p>
</div>

## 💻 실행 화면

| 사용자 승리 | 컴퓨터 승리 | 잘못된 입력 |
|:--:|:--:|:--:|
|<img src="https://i.imgur.com/Lc1z4VO.gif" width="300">|<img src="https://i.imgur.com/p6eklQT.gif" width="300">|<img src="https://i.imgur.com/XHoPvFt.gif" width="300">|

## ❓ 트러블 슈팅

- #### 함수의 역할 분리
    하나의 함수가 너무 많은 기능을 가지게 되는 경우, 별도의 함수로 분리하는 과정을 거쳤습니다. `compareNumber` 함수에서 `checkResult`를, `inputNumbers` 함수에서 `checkDuplication` 함수와 `checkNumberRange` 함수를 분리한 것이 대표적입니다.
    함수를 분리하는 과정에서 지역 변수는 사용하지 못하게 되기 때문에 반환부를 추가하는 등의 방법으로 새로 생기는 문제들을 해결하였습니다.
- #### 함수 호출 위치
    함수를 호출함에 있어 적절한 위치를 고민하였습니다. 함수의 역할을 분리하고난 다음에도 `compare` 함수 내부에서 `checkResult` 함수를 호출하였습니다. `compare` 함수는 반환이 없는 함수였기 때문에 지역 변수인 strike와 ball을 사용하기 위함이었는데, 주된 함수로 보이는 `startGame` 함수에서 `compare` 함수와 `checkResult` 함수를 호출함이 더욱 적절해 수정하였습니다. 이 과정에서 생기는 지역 변수 사용 불가 문제는 `compare` 함수를 (Int, Int) 타입의 튜플 값을 반환하게 하여 해결하였습니다.
- #### 숫자를 담을 `Collection Type` **Set**와 **Array** 의 선택
    Set를 사용해 1-9까지의 랜덤한 숫자를 3개가 될때까지 추가하고 Array로 변환하여 사용하는 방법과, 1-9까지의 숫자가 들어있는 Array를 `shuffled` 메소드를 사용하여 섞어준 후 3개의 숫자를 뽑아서 사용하는 방법을 생각하여 보았습니다. Array 사용 시, Set에 insert하기 위해 루프를 돌리지 않아도 되고 Set를 Array로 변환하는 과정을 거치지 않아도 되어 최종적으로는 Array를 사용하는 것으로 결정하였습니다.
- #### 반복문 탈출 조건
    초기에는 반복문 탈출 조건으로 변수 `remainCount`가 0이 될 경우 반복문을 종료하게 하여 `strike`가 3개인 경우에도 `remainCount = 0` 코드를 실행하게 하였습니다. 이는 적절하지 않아 보여 `remainCount`가 0이거나 `strike`가 3개인 경우 `break`로 탈출 조건을 수정하였습니다. 이를 위해 `compare` 함수를 (Int, Int) 타입의 튜플 값을 반환하게 하여 `gameScore` 지역 상수에 할당하였습니다.
- #### 남은 기회 초기화
    항상 게임을 한 번만 진행하여 몰랐던 문제점인 게임이 끝나고, 새로운 게임을 이어갈 때 남은 기회가 초기화 되지 않는 이슈를 발견하였습니다. 초기화할 수 있도록 `startGame` 함수 내부에 초기화 코드를 추가하여 해결했습니다.
- #### 남은 기회 출력
    사용자 승리시에도 남은 기회가 출력되는 문제가 있어, 해당 부분을 `checkResult` 함수 내부에 조건문을 추가하여 승리 시에는 출력되지 않도록 변경하였습니다.

## 🔗 참고 링크

- [Swift API Design Guidelines - Naming](https://swift.org/documentation/api-design-guidelines/)
- [Swift Language Guide - Optionals, nil, Optional Binding](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
- [Swift Language Guide - Collection Types](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html)
- [누구나 쉽게 입문할 수 있는 Git 입문](https://backlog.com/git-tutorial/kr/intro/intro1_1.html)
- [Git Book](https://git-scm.com/book/ko/v2)

---

[🔝 맨 위로 이동하기](#숫자-야구)
