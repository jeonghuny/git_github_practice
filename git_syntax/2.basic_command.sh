# 현재 working 디렉토리 스테이지 에어리어 확인
git status

# .은 모든 수정/ 추가사항 add
git add .

# 특정 파일만 add할 경우 (경로까지 포함)
git add test_folder/test1.txt

# commit을 통해 메시지타이틀과 메시지내용을 커밋이력으로 생성
git commit -m "메시지제목" -m "메시지내용"
# git commit만 입력하고 엔터시 vi모드 -> 첫줄:타이틀, 두번째줄부터 내용 -> :wq 저장후 종료시 커밋ID생성
git commit

# commit 이력 확인
git log 
UI에서도 볼수 있다. changes, graph      
git log --oneline

# head하단의 로그만 보이는 것이 아니라 모든 commit이력을 조회
# head : 현재 사용하고 있는(checkout)하고 있는 commitID를 의미
git log --all
: origin/main이 main(head)보다 위에 있을경우에 모든 로그를 조회 ★노이해
: git log는 Head 하위만 조회됨
 (원격에서 변경한 사항이 있는데 내가 아직 반영을 안한 경우)

___________________________
(HEAD -> main, origin/main) 
HEAD: 현재 체크아웃되어 있는 위치 → 지금 내가 작업 중인 커밋 (Head를 이동할 수 있다.)
main: 로컬 브랜치 이름
origin/main: 원격 저장소(GitHub)의 main 브랜치 위치
의미: 현재 로컬 main 브랜치가 origin/main과 동일한 상태라는 뜻
___________________________

# 원격저장소로 업로드
git push origin 브랜치명
# 충돌발생시 충돌무시하고, 로컬기준의 코드를 원격에 덮어쓰기(절대 사용하지 말것)
git push origin 브랜치명 -- force

# 특정 commit ID로의 전환
git checkout 커밋ID
# 특정 브랜치로의 전환
git checkout 브랜치명


# 가장 최신의 커밋 취소
git reset head~1
git reset head~^

# 이미 push commit사항을 되돌리는 새로운 commit 생성 // D->C로 되돌리기 D'(=F) 로 다시 커밋
git revert 커밋 ID
: 기존 커밋된 사항이 지워지는건 아님

# 작업중인사항을 임시저장
git stash
# 임시저장한 작업사항을 다시 적용
git stash pop
# 저장한 작업목록 조회
git stash list
# 저장한목록 전체 삭제
gti stash clear


★ 5번 case에서 stash를 통한 해결책
git pull origin main => error
git stash
git pull origin main -> 변경사항 받아오기
git stash pop => 충돌 (merge commit은 아님)
git add . git commit 

# 가장 최신의 commitID에 tag가 명시
git tag 태그버전명(v1.10.4)
# 원격repo에 해당 tag의 release 생성 (commit, push와 상관없이 별도로 함)
git push origin 태그버전명

v1.10.3
1: 메이저버전
10.3 마이너버전


# 브랜치 생성
★ 현재 checkout 되어있는 브랜치를 기준으로 새로운 브랜치 생성 ★
git branch 브랜치명
ex) git branch feat/member_list
★ (현재시점의 commit을 기준으로 브랜치 만듬) ★
# 브랜치 목록조회
git branch
# 특정 브랜치로 전환
git checkout 브랜치명
# 브랜치 생성과 전환을 동시에
git checkout -b 브랜치명
# 로컬브랜치 삭제(원격은 별도로 삭제)
git branch -D 브랜치명


[예시]

1. 회원가입을 담당
2. main checkout 및 pull
- git checkout main
- git add .
- git commit -m "1"
- git pull origin main
3. feat/member 브랜치 생성 
- git checkout -b feat/member
4. commit ID2개 정도 임의로 생성
- git commit 2개 생성
- git push origin feat/member
5. origin에 push후 PR
- 원격에 가서 Pull requests 작성
 (PR 올리는 것이라고 함.)
 그 다음 PR에 대해 확인후 팀장이 Merge함 (PR생성해서 main merge하는 것)
6. 한번쓴 브랜치는 재사용 X
git checkout main
git pull origin main 한 후 다시 브랜치 만들어 사용



1. main에서 git pull
2. git branch 만들고
3. 작업하고
4. origin에 올리고
5. PR올린다.


각자 PR 내기
feat/kim

팅장 repo 생성 및 참여자 추가
각자 PR 올려보기
각자 돌아가면서 충돌해결해보기
3-1) 로컬에서 해결
3-2) 원격에서 해결