###########################################################
Colab의 matplotlib 한글 폰트 적용 방법
###########################################################
# 한글 나눔폰트 설치
!sudo apt install -y fonts-nanum
# 리눅스에 캐시된 폰트 갱신
!sudo fc-cache -fv
# matplotlib이 생성하는 그래프와 관련된 캐시 삭제
!rm -rf ~/.cache/matplotlib

# colab 상단 메뉴에서
Runtime > Restart runtime
########################################################### 

# 코드 상단에 사용할 폰트 추가
plt.rc('font', family='NanumBarunGothic')

# matplotlib 그래프 코드 재실행하면 한글 정상 출력
########################################################### 
