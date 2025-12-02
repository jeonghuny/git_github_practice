<2025/12/02>

git
- 분산 버전 관리 시스템으로서, 소스 코드의 변경사항을 추적하는 데 사용
- 로컬 시스템과 원격 시스템을 두어, 로컬에서 작업 후 원격공간과 동기화

GitHub
- Git의 리포지토리를 온라인상에서 관리하기 위한 플랫폼(웹사이트)

Pull Request (피알)

A브랜치는 feature브랜치라고도 한다.
그때마다 만들어지는 브랜치들 (기능)

merge는 feature에서 main브랜치로 합침.
branch 새로운 버전의 코드 이력

깃허브 pubic으로 만들어도 읽기는 가능하나 쓰기는 불가능(권한있는 자만 가능)

[git 실습]

git add . 말고
git add [tab키] 누르면 -> git add .\test_folder\test1.txt -> 자동으로 생김
: 변경사항을 working directory -> staging area로 반영

git commit -m "최대한 자세하게 쓰도록!!" 하게되면
: commit하면 local repositoy로 옮겨짐.

git log (기록 확인)
: commit한 난수값 확인 가능 , 저장소에 난수값 확인 가능

[터미널 창에서 깃 주소 클론]
1) 경로 설정 후
2) git clone https://github.com/jeonghuny/git_github_practice.git


# .은 모든 변경사항을 의미. 특정파일만 add하는 것도 가능
# add는 staging area로 변경사항을 이동
git add .

# commit은 변경이력(commitId) 발생.
# commit은 staging area는 비워지고, local repository에 변경이력 발생
git commit -m "메세지"

# 로컬에 존재하는 브랜치를 가지고 push
git push origin 브랜치명

[public 권한이라면]
내 repository에 push할수 있는 권한 O
push 할때는 원격으로부터 로컬으로 토큰발급 받아야함

# git의 인증방법 2가지
# 1. 웹을통한인증(토큰간접발급)
# 2. 직접토큰발급
1) 수동발급
- github의 settings -> Developer Settings -> personal access tokens
  -> tokens (classic) -> Gererate new token
- classic으로 만들기
git:https://github.com
jeonghuny
token 값

# 사용자지정
git config --list 로 유저명과 email명 확인
git config --global user.name "유저명"
git config --global user.email "email명"
# git 설정정보 조회
git config --list

# git프로젝트 생성방법2가지
# 1.원격에서 repo생성 후 clone
# 2.로컬에 이미 만들어진 프로젝트 
# 2-1).git폴더를 생성
git init
# 2-2)원격지 주소를 추가
git remote add origin 원격지주소

1. 회사에 처음 입사했을때 => clone만
2. 내 개인프로젝트를 로컬에서 진행하다가 업로드 하는 경우
 2-1) github repo생성 -> clone
 2-2) github repo생성 + 내 로컬에 프로젝트를 github upload


★ [저장소를 지운다면]
★ 숨겨진 .git 폴더에
★ 1) 원격정보
★ 2) commit ID 남아 있음

 .git 삭제시 기록 삭제됨 -> .git재생성(깡통)

..git폴더가 로컬이 원격으로부터 clone 받을때 자동으로 만들어짐

# master로 만들어지는 이유
로컬 git은 .git을 만든다면 master로 만듬
원격에서 로컬로 clone받을때는 .git의 branch를 main으로 만듬

# .git 폴더가 있는 위치에서만 add commit등 가능하다.

# git branch 변경 (main) -> master branch는 지양하기
git checkout -b main 

# 다른 repo에서 clone을 받아 나의 repo로 올리기
# 1.커밋이력 그대로 가져가기
 -> clone

git clone https://github.com/kimseonguk197/kafka-practice.git
cd 레포
git remote set-url origin https://github.com/jeonghuny/test1.git
git push origin main

 -- git remote set-url origin 레포주소 # 원격지 주소 변경

# 2.커밋이력 없이 가져가기
# .git 폴더 삭제 필수 (commit 정보, repo 정보 삭제됨)
git clone https://github.com/kimseonguk197/kafka-practice.git
git init
git remote add origin https://github.com/jeonghuny/test2.git
git checkout -b main # main 브랜치 생성 및 변경
# git add, git commit, git push 작업 진행


