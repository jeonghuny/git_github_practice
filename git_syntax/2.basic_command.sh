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



5번 case

2) 기존 수정본 백업본 만들고 로컬 작업 취소