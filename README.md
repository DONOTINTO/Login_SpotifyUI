# Login_SpotifyUI
Spotify 어플의 로고 및 UX/UI를 참고하여 만든 간단한 회원가입 및 로그인 앱 입니다.
- MVC 패턴으로 코드를 작성했습니다.

---
## 사용 라이브러리
- SnapKit
    - UI Constraint 코드를 간결하고 가독성 좋게 하기 위하여 사용하였습니다.
- Realm
    - 회원가입를 완료한 유저 정보 DB를 쌓기 위하여 사용하였습니다.

---
## 구현 기능
- TextField 기본 색상 = Gray
- TextField 활성화 색상 = LightGray
- TextField 에러 색상 = Green

<br/>

- [x] UI 구현  
    - [x] EntryView  
    - [x] SignUpView  
    - [x] LoginView  
    - [x] SuccessAlertView  
- [x] Model  
    - [ ] Register : 가입한 회원 정보 모델  
- [ ] 기능 구현  
    - [ ] 진입화면  
        - [ ] 로그인버튼 클릭 애니메이션  
        - [ ] 회원가입버튼 클릭 애니메이션  
    - [ ] 회원가입  
        - [ ] 회원가입 View 진입 시 아이디 입력 TextField 활성화 및 색상 변경
        - [ ] 회원가입 버튼 클릭  
            - [ ] 아이디 중복 확인  
                - [ ] 중복 시 아이디 TextField 색상 변경  
                - [ ] TextField 하단에 '이미 사용중인 아이디' 노출 
            - [ ] 비밀번호, 비밀번호 확인 입력값 일치 확인    
                - [ ] 불일치 시 비밀번호, 비밀번호 TextField 색상 변경  
                - [ ] 비밀번호 확인 레이블 하단에 "비밀번호를 확인해주세요" 텍스트 노출  
            - [ ] 전화번호 중복 확인  
                - [ ] 중복 시 전화번호 TextField 색상 변경  
                - [ ] TextField 하단에 '이미 가입된 비밀번호' 노출  
            - [ ] 전화번호 입력  
                - [ ] 키보드 숫자 키패드  
                - [ ] 숫자 입력만 인식
            - [ ] 버튼 클릭 애니메이션 적용  
            - [ ] 중복 또는 불일치로 인한 TextField 색상 변경을 Text 수정 시 다시 활성화 색상 변경  
            - [ ] 회원가입 완료 및 확인 VC 띄우기  
    - [ ] 회원가입 성공 알림창 확인 시 알림창 닫기 -> 로그인 화면으로 전환  
    - [ ] 로그인  
        - [ ] 로그인 View 진입 시 아이디 입력 TextField 활성화 및 색상 변경  
        - [ ] 로그인하기 버튼 클릭  
            - [ ] 아이디 및 비밀번호 Register 리스트에서 데이터 확인  
                - [ ] 아이디 없을 시 아이디 TextField 하단에 '등록된 아이디가 없습니다' 노출  
                - [ ] 아이디 없을 시 아이디 TextField 에러 색상으로 변경  
                - [ ] 아이디 존재/비밀번호 불일치 시 비밀번호 TextField 하단에 '비밀번호를 확인해주세요' 노출  
                - [ ] 아이디 존재/비밀번호 불일치 시 비밀번호 TextField 에러 색상으로 변경  
            - [ ] 아이디 및 비밀번호 수정 시 TextField 에러 색상을 활성화 색상으로 변경  
            - [ ] 로그인 버튼 클릭 애니메이션  
            - [ ] 로그인 성공 시 현재 화면 닫기  
        - [ ] 비밀번호 입력 시 *로 표시  
        - [ ] 비밀번호 체크 토글 버튼 클릭 시 비밀번호 텍스트 노출 또는 비밀번호 텍스트 * 로 변경  

---
## 실행 첫 화면
<img src="https://user-images.githubusercontent.com/123792519/230764560-447d6025-cb71-489e-9d4d-deeefc7e7d64.png" width="200" height="432"/>

<br/>

**(3)** 


## 로그인 화면
<img src="https://user-images.githubusercontent.com/123792519/230764622-8a9c6d9f-cc6a-476d-9c40-4192aa2bafe2.png" width="200" height="432"/> <img src="https://user-images.githubusercontent.com/123792519/230764624-63bb913d-8e71-48a7-8d23-046aedc34b17.png" width="200" height="432"/> <img src="https://user-images.githubusercontent.com/123792519/230764625-07b54cd1-0fc9-4169-be42-d5fa80eb8b93.png" width="200" height="432"/>

## 회원가입 화면
<img src="https://user-images.githubusercontent.com/123792519/230765296-534a211b-dcba-40e0-a867-a410d4c2d03c.png" width="200" height="432"/> <img src="https://user-images.githubusercontent.com/123792519/230765333-f19c9234-030f-4188-9d27-76a6c558ff98.png" width="200" height="432"/> <img src="https://user-images.githubusercontent.com/123792519/230765338-76de83b2-811e-4b9d-a0b7-f4bc7544b72f.png" width="200" height="432"/> <img src="https://user-images.githubusercontent.com/123792519/230765339-f91c3f71-b30c-465f-a7a4-f9971cd12ed3.png" width="200" height="432"/>

## 회원가입 완료 화면
<img src="https://user-images.githubusercontent.com/123792519/230765396-22c57a04-5b66-4569-9749-814172091feb.png" width="200" height="432"/>
