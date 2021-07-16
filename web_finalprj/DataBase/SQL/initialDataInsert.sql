-- 초기데이터 전부 삽입하는 sql

--*************************************
-- 영화테이블 INSERT
--*************************************
CREATE SEQUENCE movie_seq;
-- DROP SEQUENCE movie_seq;

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '#위왓치유' , 'V siti, #WeWatchYou', 
 '평범한 집처럼 꾸며진 3개의 세트장, 12살로 설정한 페이크 계정을 만들고 컴퓨터 모니터 앞에 선 배우들. 
 계정 계설과 동시에 전 세계 남성이 접촉해왔으며 열흘 간 나체사진 요구, 가스라이팅, 협박, 그루밍 등을 시도하는 남성은 총 2,458명이었다. 
 그리고 우린 그 중 21명과 대면하게 된다. 범죄의 형식이 온라인으로 확산된 언택트 시대. 
 성에 대한 가치관이 형성되지 않은 아동·청소년들에게 일어나는 충격적인 디지털 성범죄를 추적한다. 
 그리고, 가해자들의 처벌까지 이어질 수 있을까? 디지털 성범죄자 검거 프로젝트 <#위왓치유>',
'2D(자막)', '바르보라 차르포바, 비트 클루삭', '다큐멘터리', 104, 19, '바르보라 차르포바(감독), 비트 클루삭(감독)', 
to_date('21/06/05','YY/MM/DD'), 1757, 103, 9.09);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '그 여름, 가장 차가웠던' , 'Summer Is the Coldest Season',  
 '3년 전 엄마가 살해된 후, 소녀 ‘자허’와 아빠의 삶은 엉망이다.
 친구들에게 왕따를 당하고, 아빠와도 마음 속 이야기를 하지 않게 된 소녀,
 그러던 어느 날 우연히 자신의 엄마를 죽인 소년 ‘유레이’와 마주치게 된다.
 예상보다 빨리 석방된 그를 보고 소녀는 분노에 휩싸이고,
 복수하고 싶은 마음으로 그에게 의도적으로 접근하게 되는데…',
'2D(자막)', '주순', '드라마', 100, 0, '등은희, 이감', to_date('21/06/17','YY/MM/DD'), 4411, 109, 7.69);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '그레타 툰베리' , 'I Am Greta',  
 '기후 변화 법안 마련 촉구를 위해 금요일마다 학교를 결석하며 의회 앞에서 홀로 시위를 시작한 15세 소녀 ‘그레타 툰베리’. 
 그녀가 쏘아 올린 ‘미래를 위한 금요일’ 운동은 전 세계로 퍼져나가는데… 평범한 10대 소녀에서 
 어른들의 무감각한 환경 의식에 일침을 가하는 세계적인 청소년 환경운동가가 되기까지! 700만을 움직인 그녀의 외침에 주목하라!',
'2D(자막)', '나타 그로스만', '다큐멘터리', 102, 0, '나타 그로스만', to_date('21/06/17','YY/MM/DD'), 1255, 124, 3.57);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '극장판 귀멸의 칼날 무한열차편', 'Demon Slayer: Kimetsu no Yaiba the Movie - Mugen Train', 
 '혈귀로 변해버린 여동생 ‘네즈코’를 인간으로 되돌릴 단서를 찾아 비밀조직 귀살대에 들어간 ‘탄지로’
 ‘젠이츠’, ‘이노스케’와 새로운 임무 수행을 위해 무한열차에 탑승 후
 귀살대 최강 검사 염주 ‘렌고쿠’와 합류한다.
 달리는 무한열차에서 승객들이 하나 둘 흔적 없이 사라지자
 숨어있는 식인 혈귀의 존재를 직감하는 ‘렌고쿠’.
 귀살대 ‘탄지로’ 일행과 최강 검사 염주 ‘렌고쿠’는
 어둠 속을 달리는 무한열차에서 모두의 목숨을 구하기 위해
 예측불가능한 능력을 가진 혈귀와 목숨을 건 혈전을 시작하는데…',
'2D(자막)', '소토자키 하루오', '애니메이션', 117, 15, 
'하아네 나츠키(카마도 탄지로 목소리), 키토 아카리(카마도 네즈코 목소리), 시모노 히로(아가츠마 젠이츠 목소리 역), 마츠오카 요시츠구(하시바라 이노스케 목소리 역),
히노 사토시(렌고쿠 코쥬로 목소리 역), 히라카와 다이스케(엔무 목소리 역)', 
to_date('21/01/27','YY/MM/DD'), 2141067, 8507, 9.28);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '까치발' , 'Tiptoeing',  
 '까치발로 걸음마를 시작한 딸 ‘지후’
 엄마 ‘우정’은 의사에게 충격적인 선언을 듣는다!
 “아이가 뇌성마비일 수 있어요”
 크면서 자연스레 없어질 수 있다는 말 한마디에 모든 것을 걸었지만
 6살이 된 지금까지도 ‘지후’는 까치발로 걷는데…
 엄마에게 ‘괜찮아’라는 말을 듣고 싶은 딸들의 이야기',
'2D', '권우정', '다큐멘터리', 79, 12, '권우정(본익 역), 정지후(본익 역), 정인섭(본익 역), 신유진(본익 역), 우진아(본익 역)', 
to_date('21/06/03','YY/MM/DD'), 1913, 58, 9);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '낫아웃' , 'NOT OUT',  
 '“내 꿈은 얼마예요?”
기적이 일어났고, 끝까지 가고 싶었다.
 특별할 것 없던 열아홉 고교 야구 입시생 ‘광호’는
 봉황대기 결승전 결승타의 주인공이 된다,
 잘 될 것 같았던 신인 드래프트에서 탈락한 ‘광호’.
 야구를 계속하기 위해서는 돈이 필요하다고 생각한 ‘광호’는
 친구에게 불법 휘발유를 파는 일을 소개받아 악착같이 돈을 모으기 시작한다.
 하지만 뭐하나 뜻대로 되지 않자,
 결국 ‘광호’는 친구에게 위험한 제안을 하는데….',
'2D(자막)', '이정곤', '드라마', 107, 15, 
'정재광(광호 역), 정승길(승길 역), 김희창(감독 역), 이규성(민철 역), 송이재(수현 역), 조우겸(성태 역), 허정도(사장 역), 최희승(희승 역)', 
to_date('21/06/03','YY/MM/DD'), 9006, 178, 8.12);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '노매드랜드' , 'Nomadland',  
'전 세계가 동행한 가슴 벅찬 여정, 길이 계속되는 한 우리의 삶도 계속된다.
모든 것이 무너진 후에야 비로소 열리는 새로운 길 그리고 희망
경제적 붕괴로 도시 전체가 무너진 후 홀로 남겨진 ‘펀’.(프란시스 맥도맨드)
 추억이 깃든 도시를 떠나 작은 밴과 함께 한 번도 가보지 않은 낯선 길 위의 세상으로 떠난다.
 그 곳에서 ‘펀’은 각자의 사연을 가진 노매드들을 만나게 되고,
 광활한 자연과 길 위에서의 삶을 스스로 선택한 그들과 만나고 헤어지며
 다시 살아가기 위한 여정을 시작하는데…',
'2D', '클로이 자오', '드라마', 108, 12, 
'프란시스 맥도맨드(펀 역), 데이빗 스트라탄(데이브 역), 린다 메이(린다 역), 밥 웰스(밥 역), 샬린 스완키(스완키 역)', 
to_date('21/04/15','YY/MM/DD'), 82054, 972, 8.48);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '더 파더' , 'The Father', 
'나는 런던에서 평화롭게 삶을 보내고 있었다.
 무료한 일상 속 나를 찾아오는 건 딸 ‘앤’ 뿐이다.
 그런데 앤이 갑작스럽게 런던을 떠난다고 말한다.
 그 순간부터 앤이 내 딸이 아닌 것처럼 느껴졌다.
 잠깐, 앤이 내 딸이 맞기는 한 걸까?
 기억이 뒤섞여 갈수록 지금 이 현실과 사랑하는 딸,
 그리고 나 자신까지 모든 것이 점점 더 의심스러워진다.',
'2D(자막)', '플로리안 젤러', '드라마', 97, 12, 
'안소니 홉킨스(안소니 역), 올리비아 콜맨(앤 역), 마크 게티스(남자 역), 올리비아 윌리암스(여자 역), 이모겐 푸츠(로라 역), 루퍼스 스웰(폴 역), 에비 레이(루시 역)', 
to_date('21/04/07','YY/MM/DD'), 46000, 611, 8.93);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '루카' , 'Luca', 
'바다 밖은 위험해?! 아니, 궁금해!
이탈리아 리비에라의 아름다운 해변 마을,
 바다 밖 세상이 궁금하지만, 두렵기도 한 호기심 많은 소년 ‘루카’
 자칭 인간세상 전문가 ‘알베르토’와 함께 모험을 감행하지만,
 물만 닿으면 바다 괴물로 변신하는 비밀 때문에 아슬아슬하기만 하다.
 새로운 친구 ‘줄리아’와 함께 젤라또와 파스타를 실컷 먹고
 스쿠터 여행을 꿈꾸는 여름은 그저 즐겁기만 한데…
 과연 이들은 언제까지 비밀을 감출 수 있을까?
 함께라서 행복한 여름,
 우리들의 잊지 못할 모험이 시작된다!',
'2D ATMOS(자막), 2D Dolby(자막), 2D(더빙), 2D(자막)', '엔리코 카사로사', '애니메이션, 모험, 코미디', 95, 0, 
'제이콥 트렘블레이, 잭 딜러 그레이저, 엠마 버만', 
to_date('21/06/17','YY/MM/DD'), 152422, 736, 9.20);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '메이드 인 루프탑' , 'Made in Rooftop',
'“나도 쿨해질거야 이제!”
 3년 동안 지지고 볶은 남자친구 ‘정민’에게 가.짜. 이별 통보를 한 지
 30분 만에 한 개의 캐리어와 함께 집에서 쫓겨난 밀.당.실.패 취준생 ‘하늘’.
 이별 1일차, 갈 곳 없어 무작정 쳐들어간 친구 ‘봉식’의 옥탑방에서
 헤어진 연인과 쿨하게 밀당을 이어보는데…
 “내가 하는 건 다 힙해!”
 BJ를 하며 번 돈으로 플.렉.스.하며 원룸보다 작은 옥탑방을 명품샵으로 꾸미고
 ‘마흔 전에 죽기’를 목표로 세운 채 오늘만 사는 자.유.영.혼. 힙스터 ‘봉식’.
 썸 1일차, 연애 따윈 필요 없다고 다짐 또 다짐했건만
 적극적으로 대시하는 썸남에게 자꾸만 눈이 가는데…
 쿨하고 힙한 청춘들의 하이텐션 썸머 로맨스가 시작된다!',
'2D', '김조광수', '드라마, 멜로/로맨스, 코미디', 87, 15, 
'이홍내, 정휘, 곽민규, 염문경, 이정은, 강정우', 
to_date('21/06/23','YY/MM/DD'), 1190, 231, 8.13);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '발신제한' , 'HARD HIT', 
'평범한 출근길, 의문의 발신번호 표시제한 전화 한 통,
“지금 당신의 의자 밑에는 폭탄이 설치되어 있습니다”
 은행센터장 성규(조우진)는 아이들을 차에 태우고 출발한 평범한 출근길에
 한 통의 발신번호 표시제한 전화를 받는다.
 전화기 너머 의문의 목소리는 차에 폭탄이 설치되어 있고,
 자리에서 일어날 경우 폭탄이 터진다고 경고하는데…
 의문의 전화를 보이스피싱이라고 대수롭지 않게 여기던 성규는
 곧 회사 동료의 차가 같은 방식으로 폭파되는 것을 바로 눈 앞에서 목격하고,
 졸지에 부산 도심 테러의 용의자가 되어 경찰의 추격을 받게 된다.
 내리면 폭탄이 터지는 절체절명의 순간,
 경찰의 추격 속 의문의 발신자와의 전화마저 끊을 수 없는 상황에 놓이게 되는데…!',
'2D', '김창주', '드라마, 스릴러', 94, 15, 
'조우진, 이재인, 진경, 김지호', 
to_date('21/06/23','YY/MM/DD'), 96668, 1604, 7.9);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '뱅드림! 로젤리아 에피소드 1 약속' , 'BanG Dream! Episode of Roselia I：Promise', 
'너희들, Roselia에 전부를 걸 각오는 됐어?
 "페스"에 출전하기 위해 밴드 결성을 결심한 미나토 유키나.
 그런 그녀 앞에 각자의 소망을 품은 멤버들이 모인다.
 다섯 멤버는 Roselia로서 정상을 노린다.
 이것은 그녀들의 결성부터 FUTURE WORLD FES에 도전하기까지의 "약속"을 그린 이야기.',
'2D(자막)', '코다이 카키모토', '애니메이션', 77, 0, 
'아이바 아이나, 쿠도 하루카, 나카시마 유키, 사쿠라가와 메구, 시자키 카논', 
to_date('21/06/03','YY/MM/DD'), 16974, 870, 8.35);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '분노의 질주 더 얼티메이트' , 'Fast ＆ Furious 9 THE FAST SAGA', 
'기다림은 끝났다!
전 세계가 기다려온 단 하나의 액션블록버스터!
도미닉(빈 디젤)은 자신과 가장 가까웠던 형제 제이콥(존 시나)이 사이퍼(샤를리즈 테론)와 연합해
 전 세계를 위기로 빠트릴 위험천만한 계획을 세운다는 사실을 알게 되고,
 이를 막기 위해 다시 한 번 패밀리들을 소환한다.
 가장 가까운 자가 한순간, 가장 위험한 적이 된 상황
 도미닉과 패밀리들은 이에 반격할 놀라운 컴백과 작전을 세우고
 지상도, 상공도, 국경도 경계가 없는 불가능한 대결이 시작되는데…',
'2D(자막)', '저스틴 린', '액션', 142, 12, 
'빈 디젤(도미닉 토레토 역), 존 시나(제이콥 토레토 역), 성강(한 역), 샤를리즈 테론(샤를리즈 테론), 미셸 로드리게즈(테리 "오티즈" 토레토 역), 조다나 브류스터(미아 토레토 역), 나탈리 엠마뉴엘(램지 역), 엘렌 미렌(막달레나 쇼 역)', 
to_date('21/05/19','YY/MM/DD'), 2263166, 6966, 7.62);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '아야와 마녀' , 'Earwig and the Witch', 
'마녀지망생 ‘아야’의 신비롭고 미스터리한 모험이 시작된다!
‘동료 마녀 12명을 완전히 따돌리면 아이를 찾으러 오겠다’는 수수께끼 같은 편지와 함께 성 모어발트의 집에 맡겨진 아야. 
10살이 된 어느 날, 아야는 갑자기 찾아온 마법사 벨라와 맨드레이크를 따라 미스터리한 저택에 발을 들이게 된다. 순간이동할 수 있는 문부터 비밀의 방까지 신비로움으로 가득 찬 그곳에서의 생활이 시작되고, 
아야는 벨라를 돕는 조건으로 마법을 배우기로 한다. 하지만 마법은 알려주지 않고 잔심부름만 시키는 마녀 벨라.
 벨라를 골탕 먹이기 위한 마녀지망생 아야와
 말하는 고양이 토마스의 아주 특별한 주문이 시작된다!',
'2D(자막), 2D(더빙)', '미야자키 고로', '애니메이션, 가족, 판타지', 83, 0, 
'히라사와 코코로/이성은(아야 역), 테라지마 시노부/성선녀(벨라 야가 역), 토요카와 에츠시/민응식(맨드레이크 역), 하마다 가쿠/서반석(토마스 역)', 
to_date('21/06/10','YY/MM/DD'), 28849, 281, 7.03);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '애플' , 'Mila, Apples', 
'당신을 사로잡을 가장 특별한 여운.
 원인 모를 단기 기억상실증 유행병에 걸린 ‘알리스’에게 유일하게 남은 기억은 이름도 집 주소도 아닌 한 입 베어 문 사과의 맛.
 며칠이 지나도 그를 찾아오는 가족이 나타나지 않자 무연고 환자로 분류된 ‘알리스’에게 병원에서는 새로운 경험들로 기억을 만들어내는 ‘인생 배우기’ 프로그램을 제안한다.
 그러던 어느 날 ‘알리스’는 자신처럼 이 프로그램에 참여하고 있는 ‘안나’를 만난다.
 괜찮아요, 다들 잊고 사니까요.',
'2D', '크리스토스 니코우', '드라마', 90, 12, 
'알리스 세르베탈리스, 소피아 게오르고바실리', 
to_date('21/05/26','YY/MM/DD'), 7713, 210, 7.86);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '야구소녀' , 'Baseball Girl', 
'“사람들이 내 미래를 어떻게 알아요? 나도 모르는데…”
고교 야구팀의 유일한 여자이자 최고구속 134km, 볼 회전력의 강점으로 ‘천재 야구소녀’라는 별명을 얻으며 주목받았던 야구선수
‘주수인’(이주영). 고교 졸업 후 오로지 프로팀에 입단해 계속해서 야구를 하는 것이 꿈이지만 여자라는 이유로 제대로 된 평가도 기회도 잡지 못한다.
엄마, 친구, 감독까지 모두가 꿈을 포기하라고 할 때, 야구부에 새로운 코치 ‘진태’(이준혁)가 부임하고 수인에게도 큰 변화가 찾아오는데…
 “전 해보지도 않고 포기 안 해요”
 꿈을 향해 던지는 단 하나의 스트라이크
 주수인 파이팅!',
'2D', ',최윤태', '드라마', 105, 12, 
'이주영(주수인 역), 이준혁(최진태 역), 염혜란(신해숙 역), 송영규(주귀남 역), 곽동연(이정호 역), 주해은(한방글 역), 박연수(주수영 역), 김종수(박감독 역)', 
to_date('21/06/18','YY/MM/DD'), 37432, 1872, 8.12);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '여고괴담 여섯번째 이야기 모교' , 'WHISPERING CORRIDORS 6 : THE HUMMING', 
'고교시절의 기억을 잃은 ‘은희(김서형)’는
 모교에 교감으로 부임한 후부터
 알 수 없는 환영과 환청에 시달리기 시작한다.
 피해자임에도 불구하고 문제아로 내몰린 ‘하영(김현수)’은
 홀리듯 들어간 학교의 폐쇄된 화장실에서 귀신 소리를 듣게 되고
 그 곳에서 같은 아픔을 가진 ‘은희(김서형)’와 마주친다.
 두 사람은 학교에서 벌어지는 기이한 일들이
 화장실에 있는 존재와 연관됐음을 알게 되고,
 곧 죽음의 공포와 마주하게 된다.
 기억 속에 감춰진 충격적인 진실이 밝혀진다!',
'2D', '이미영', '미스터리, 공포', 108, 15, 
'김서형(노은희 역), 김현수(김하영 역), 최리(김소연 역), 김형서(여고생 은희 역), 서혜원(안미숙 역), 박세현(여고생 재연 역), 이지원(한예지 역), 김지혜(엄문정 역)', 
to_date('21/06/17','YY/MM/DD'), 77363, 1117, 5.45);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '인트로덕션' , 'INTRODUCTION', 
'1.
 아들은 아버지가 불러서 한의원을 찾았다
 도착했을 때 아버지는 환자들 때문에 바빴고
 아들은 하루 종일을 기다려야 했다.
 2.
 딸은 독일로 패션디자인을 공부하러 갔다
 어머니는 독일에 사는 옛 친구의 집에 딸이 묵게 하려고 같이 동행했다
 친구 집에 묵게 된다면 방세를 절약할 수 있을 것이다
 3.
 아들은 어머니가 갑자기 불러서 동해안의 횟집으로 찾아갔다
 어머니는 나이 든 남자배우와 함께 있었다
 그 배우는 오랜 전에 아버지의 한의원을 찾아갔을 때 만난 적 있는 사람이었다',
'2D', '홍상수', '한국', 66, 12, 
'신석호, 박미소, 예지원, 기주봉, 서영화, 김민희, 조윤희, 하성국', 
to_date('21/05/27','YY/MM/DD'), 5498, 184, 8.00);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '청춘선거' , 'Vote Young Ones', 
'제주 최초 여성 도지사에 출마한 만 32세 고은영.
 바꾸고 싶어서, 바뀌고 싶어서 선거에 뛰어든 사람들.
 맨땅에 헤딩하면 어떤가. 맨날 후달리면 어떤가.
 ‘청춘’을 유일한 ‘선거전략’으로 삼았다?
 무모하지만 판타스틱했던 청춘들이 온다
 
 판타스틱 청.춘.박.두.',
'2D', '민환기', '다큐멘터리', 99, 12, 
'고은영, 윤경미, 오수경, 김기홍, 안재홍, 박정경수, 김순애, 이선자', 
to_date('21/06/17','YY/MM/DD'), 844, 285, 8.60);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '캐시트럭' , 'Wrath of Man', 
'캐시트럭을 노리는 무장 강도에 의해 아들을 잃은 H(제이슨 스타뎀).
 분노에 휩싸인 그는 아들을 죽인 범인의 단서를 찾기 위해
 현금 호송 회사에 위장 취업한다.
 첫 임무부터 백발백중 사격 실력을 자랑하며,
 단숨에 에이스로 급부상한 H.
 캐시트럭을 노리는 자들을 하나 둘 처리하며,
 아들을 죽인 범인들과 점점 가까워지는데…
 자비는 없다, 분노에 가득 찬 응징만이 남았다.
 그의 분노가 폭발한다!',
'2D(자막)', '가이 리치', '액션', 119, 19, 
'제이슨 스타뎀, 스콧 이스트우드, 조쉬 하트넷, 포스트 말론, 홀트 맥칼라니, 제프리 도노반', 
to_date('21/06/09','YY/MM/DD'), 224508, 648, 8.14);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '컨저링 3 악마가 시켰다' , 'The Conjuring The Devil Made Me Do It', 
'모든 것은 악마가 시켰다!
1981년, 미국 역사상 최초로 잔혹한 살인사건의 용의자가 악마가 살해하도록 시켰다고 주장하는 초유의 사태가 일어난다! 그리고 사건의 배후에는 악마에게 빙의된 소년이 있었는데…
 초자연 현상 연구가 워렌 부부의 사건 파일 중 여전히 미스터리로 남아있는 실화!
 진실 혹은 거짓? 살인사건의 범인, 인간인가 악마인가...',
'2D(자막)', '마이클 차베즈', '공포, 미스터리, 스릴러', 111, 15, 
'베라 파미가(로레인 역), 패트릭 윌슨(에디 역), 줄리안 힐리아드(데이빗 역), 로우리 오코너(어니 역), 샬린 아모이아(주디 역), 유지니 본듀란트', 
to_date('21/06/03','YY/MM/DD'), 738430, 2696, 6.66);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '콰이어트 플레이스2' , 'A Quiet Place Part II', 
'소리 없이 맞서 싸워라!
실체를 알 수 없는 괴생명체의 공격으로 일상의 모든 것이 사라진 세상,
 아이들 대신 죽음을 선택한 아빠의 희생 이후 살아남은 가족들은 위험에 노출된다.
 갓 태어난 막내를 포함한 아이들과 함께 소리 없는 사투를 이어가던 엄마 ‘에블린’은
 살아남기 위해 새로운 은신처를 찾아 집 밖을 나서지만,
 텅 빈 고요함으로 가득한 바깥은 더 큰 위험이 도사리고 있는데...',
'2D(자막)', '존 크래신스키', '스릴러', 97, 15, 
'에밀리 블런트, 킬리언 머피, 밀리센트 시몬스, 노아 주프, 디몬 하운수, 웨인 듀발', 
to_date('21/06/16','YY/MM/DD'), 444209, 5053, 8.47);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '크루엘라' , 'Cruella', 
'처음부터 난 알았어. 내가 특별하단 걸
 그게 불편한 인간들도 있겠지만 모두의 비위를 맞출 수는 없잖아?
 그러다 보니 결국, 학교를 계속 다닐 수가 없었지
 
 우여곡절 런던에 오게 된 나, 에스텔라는 재스퍼와 호레이스를 운명처럼 만났고
 나의 뛰어난 패션 감각을 이용해 완벽한 변장과 빠른 손놀림으로 런던 거리를 싹쓸이 했어
 
 도둑질이 지겹게 느껴질 때쯤, 꿈에 그리던 리버티 백화점에 낙하산(?)으로 들어가게 됐어
 거리를 떠돌았지만 패션을 향한 나의 열정만큼은 언제나 진심이었거든
 
 근데 이게 뭐야, 옷에는 손도 못 대보고 하루 종일 바닥 청소라니
 인내심에 한계를 느끼고 있을 때, 런던 패션계를 꽉 쥐고 있는 남작 부인이 나타났어
 천재는 천재를 알아보는 법! 난 남작 부인의 브랜드 디자이너로 들어가게 되었지
 
 꿈을 이룰 것 같았던 순간도 잠시, 세상에 남작 부인이 ‘그런 사람’이었을 줄이야…
 
 그래서 난 내가 누군지 보여주기로 했어
 잘가, 에스텔라
 
 난 이제 크루엘라야!',
'2D(자막)', '크레이그 질레스피', '드라마, 범죄, 코미디', 133, 12, 
'엠마 스톤(크루엘라 역), 엠마 톰슨(바로네스 역), 마크 스트롱(보리스 역), 폴 월터 하우저(호러스 역), 에밀리 비샴(캐서린 역), 조엘 프라이(재스퍼 역), 커비 하월 바티스트(아니타 역), 제이미 드메트리우(제럴드 역)', 
to_date('21/05/26','YY/MM/DD'), 1277427, 4457, 9.29);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '클라이밍' , 'Climbing', 
'“너는 나고, 나는 너야”
세 달 전 교통사고를 겪은 세현은 세계 클라이밍 대회를 앞두고
 회복되지 않는 컨디션과 경쟁에 대한 압박으로 악몽에 시달린다.
 그러던 어느 날 밤, 사고 당시 고장 났던 세현의 핸드폰으로 전화가 걸려온다.
 
 다름 아닌, 바로 ''나''로부터.
 
 연락을 주고받을수록 서로 연결되어 있음을 느끼는 두 사람.
 급기야 세현은 또 다른 세현의 임신이 자신에게도 영향을 끼친다는 것을 알게 되고,
 그 이후 악몽처럼 기이한 일들이 일어나기 시작한다.',
'2D(자막)', '김혜미', '애니메이션', 77, 15, 
'김민지(최세현 목소리 역), 박송이(노인화 목소리 역), 박송이(김아인/여자의사 목소리 역), 구지원(이우인 목소리 역), 박주광(코치/남자의사 목소리 역), 김민지(아이 목소리 역)', 
to_date('21/06/16','YY/MM/DD'), 4677, 151, 6.45);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '킬러의 보디가드 2' , 'Hitman''s Wife''s Bodyguard', 
'2배로 고통받는 짠내 폭발 보디가드
안식년인데 왜 쉬지를 못하니!
미치광이 킬러 ‘다리우스’의 경호를 맡은 후
 매일 밤 그의 악몽을 꾸는 보디가드 ‘마이클’ 앞에 나타난 무대포 직진녀 ‘소니아’
 남편 ‘다리우스’가 납치되었다며 다짜고짜 그를 구하러 가야 한다고 하는데…
 
 한 명도 버거운데 그의 와이프까지 플러스?!
 설상가상으로 유럽 전역을 위기로 몰아넣는 사건들이 연속적으로 터지고
 인터폴의 비밀스러운 의뢰까지 추가되는데..
 
 2배 더 강력한, 2배 더 골때리는, 2배 더 커진
 모두가 기다린 1+1 트리플 환장 액션 블록버스터가 온다!',
'2D(자막)', '패트릭 휴즈', '액션, 코미디, 범죄', 117, 19, 
'라이언 레이놀즈(마이클 브라이스 역), 사무엘 L.잭슨(다리우스 킨케이드 역), 셀마 헤이엑(소니아 킨케이드 역), 모건 프리먼(시니어 역), 안토니오 반데라스(아리스토텔레스 파파도풀로스 역), 게리 올드만(블라디슬라프 투코비치 역), 프랭크 그릴로(바비 오닐 역), 톰 호퍼(마그누손 역)', 
to_date('21/06/23','YY/MM/DD'), 35481, 714, 7.77);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '패터슨', 'Paterson', 
'미국 뉴저지 주의 소도시 ‘패터슨’에 사는 버스 운전사의 이름은 ‘패터슨’이다.
 매일 비슷한 일상을 보내는 패터슨은 일을 마치면 아내와 저녁을 먹고 애완견 산책 겸 동네 바에 들러 맥주 한 잔으로 하루를 마무리한다.
 그리고 일상의 기록들을 틈틈이 비밀 노트에 시로 써내려 간다.',
'2D(자막)', '짐 자무쉬', '드라마', 118, 12, 
'라담 드라이버(패터슨 역), 골쉬프테 파라하니(로라 역), 리즈원 맨지(도니 역), 카라 헤이워드(여학생 역), 자레드 길만(남학생 역), 스털링 제린스(젊은 시인 역), 나가세 마사토시(일본 시인 역), 메소드 맨(메소드 맨 역)', 
to_date('17/12/21','YY/MM/DD'), 29264, 900, 8.30);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '프로페서 앤 매드맨' , 'The Professor and the Madman', 
'역사의 첫 페이지를 연 꿈의 프로젝트,
그 시작에는 두 천재가 있었다!
빅토리아 시대, 대영제국의 부활을 위해 세상을 정의할 ''옥스퍼드 사전 편찬 프로젝트''가 시작된다. 
책임자로 부임한 이는 수십 개의 언어를 구사하는 괴짜 교수 제임스 머리(멜 깁슨). 
그는 영어를 쓰는 모든 이들로부터 단어와 예문을 모으자는 파격적인 제안을 내놓는다. 전국에서 편지가 빗발치던 어느 날, 
머리는 고전을 풍부하게 인용한 수백 개 예문이 담긴 편지를 발견한다. 보낸 이는 닥터 윌리엄 마이너(숀 펜), 
그의 천재적인 능력으로 불가능해 보였던 사전 편찬 작업엔 속도가 붙는다. 하지만 윌리엄이 정신병원에 구금된 미치광이라는 사실이 밝혀지게 되는데...',
'2D(자막)', 'P.B 셰므란', '드라마, 미스터리, 스릴러', 124, 15, 
'멜 깁슨(제임스 머리 역), 숀 펜(윌리엄 마이너 역), 나탈리 도머(일라이자 역), 스티브 쿠건(프레디 역), 에디 마산(먼시 역), 제니퍼 엘(에이다 머리 역), 스티븐 딜레인(리처드 브라이언 역), 제레미 어바인(찰스 홀 역)', 
to_date('21/06/02','YY/MM/DD'), 17043, 270, 9.00);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '플로리다 프로젝트' , 'The Florida Project', 
'2018년 우리를 행복하게 할 가장 사랑스러운 걸작!
"안심하세요 나랑 있으면 안전해요"
 플로리다 디즈니월드 건너편 ‘매직 캐슬’에 사는
 귀여운 6살 꼬마 ‘무니’와 친구들의
 디즈니월드 보다 신나는 무지개 어드벤처!',
'2D(자막)', '션 베이커', '드라마', 111, 15, 
'윌렘 대포(바비 역), 브루클린 프린스(무니 역), 브리아 비나이트(핼리 역), 크리스토퍼 리베라(스쿠티 역), 발레리아 코토(젠시 역), 멜라 머더(애슐리 역), 케일럽 랜드리 존스(잭 역), 에이든 말릭(딕키 역)', 
to_date('18/03/07','YY/MM/DD'), 93936, 1754, 8.65);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '학교 가는 길' , 'A Long Way to School', 
'전국 특수학교 재학생의 절반은
 매일 왕복 1~4시간 거리를 통학하며
 전쟁 같은 아침을 맞이한다
 
 장애 학생 수에 비해 턱없이 부족한 특수학교
 아이를 위해 거리로 나선 엄마들은
 무릎까지 꿇는 강단으로 맞서는데…
 
 세상을 바꾼 사진 한 장,
 엄마들의 용기 있는 외침이 시작된다!',
'2D', '김정인', '다큐멘터리', 99, 12, 
'이은자, 정난모, 조부용, 장민희, 김남연', 
to_date('21/05/05','YY/MM/DD'), 21534, 509, 9.60);

INSERT INTO movie(id, title, subtitle, summary, type, director, genre, runningtime, rating, actor, playdate, rcnt, gcnt, grade)
 VALUES (movie_seq.NEXTVAL, '혼자 사는 사람들' , 'Aloners', 
'집에서도 밖에서도 늘 혼자가 편한 진아.
 사람들은 자꾸 말을 걸어오지만, 진아는 그저 불편하다.
 회사에서 신입사원의 1:1 교육까지 떠맡자 괴로워 죽을 지경.
 그러던 어느 날, 출퇴근길에 맨날 말을 걸던 옆집 남자가
 아무도 모르게 혼자 죽었다는 걸 알게 된다.
 그 죽음 이후, 진아의 고요한 일상에 작은 파문이 이는데…
 
 저마다 1인분의 외로움을 간직한, 우리들 이야기',
'2D', '홍성은', '드라마', 90, 12, 
'공승연(진아 역), 정다은(수진 역), 서현우(성훈 역), 김모범(옆집남자 역), 김혜나(팀장 역), 변진수(성훈친구2 역), 정성민(성훈 친구3 역)', 
to_date('21/05/19','YY/MM/DD'), 12275, 378, 8.74);

--*************************************
-- 영화관테이블 INSERT
--*************************************
CREATE SEQUENCE branch_seq;

-- 서울 지점.
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '서울', '강남');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '서울', '강남대로(씨티)');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '서울', '강동');

-- 경기 지점.
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '경기', '고양스타필드');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '경기', '김포한강신도시');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '경기', '남양주');

-- 인천지점
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '인천', '검단');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '인천', '송도');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '인천', '영종');

-- 대전/충청/세종
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '대전/충청/세종', '공주');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '대전/충청/세종', '논산');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '대전/충청/세종', '대전');

-- 부산/대구/경상
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '부산/대구/경상', '경북도청');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '부산/대구/경상', '경산하양');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '부산/대구/경상', '구미강동');

-- 광주/전라
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '광주/전라', '광주상무');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '광주/전라', '광주하남');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '광주/전라', '목포하당');

-- 강원
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '강원', '남춘천');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '강원', '속초');
INSERT INTO branch(id, location, name) VALUES (branch_seq.NEXTVAL, '강원', '원주');

--*************************************
-- 상영관테이블 INSERT
--*************************************
CREATE SEQUENCE theater_seq;
-- DROP SEQUENCE theater_seq;

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 1, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 1, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 2, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 2, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 3, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 3, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 4, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 4, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 5, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 5, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 6, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 6, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 7, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 7, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 8, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 8, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 9, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 9, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 10, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 10, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 11, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 11, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 12, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 12, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 13, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 13, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 14, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 14, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 15, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 15, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 16, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 16, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 17, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 17, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 18, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 18, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 19, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 19, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 20, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 20, '2관');

INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 21, '1관');
INSERT INTO theater(id, bid, name) VALUES(theater_seq.NEXTVAL, 21, '2관');

--*************************************
-- 영화상영관테이블 INSERT
--*************************************
CREATE SEQUENCE movie_t_seq;

-- 위왓치유(ID : 1) / 강남 1관(ID : 1)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 1, 1, TO_DATE('21/09/12','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 2, 1, TO_DATE('21/09/13','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 3, 1, TO_DATE('21/09/14','YY/MM/DD'));
-- 강남 2관 (tid : 2)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 4, 2, TO_DATE('21/09/15','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 5, 2, TO_DATE('21/09/15','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 6, 2, TO_DATE('21/09/15','YY/MM/DD'));

-- 강남대로 1관 (tid : 3)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 8, 3, TO_DATE('21/09/15','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 9, 3, TO_DATE('21/09/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 10, 3, TO_DATE('21/09/20','YY/MM/DD'));
-- 위왓치유(ID : 1) / 강남대로 2관(ID : 4)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 1, 4, TO_DATE('21/09/15','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 13, 4, TO_DATE('21/09/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 14, 4, TO_DATE('21/09/20','YY/MM/DD'));

-- 강동 1관 (tid : 5)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 17, 5, TO_DATE('21/09/15','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 18, 5, TO_DATE('21/09/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 19, 5, TO_DATE('21/09/20','YY/MM/DD'));
-- 강동 2관 (tid : 6)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 22, 6, TO_DATE('21/09/15','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 23, 6, TO_DATE('21/09/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 24, 6, TO_DATE('21/09/20','YY/MM/DD'));

-- 그 여름, 가장 차가웠던(ID : 2) / 고양스타필드 1관(ID :7)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 27, 7, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 28, 7, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 29, 7, TO_DATE('21/10/20','YY/MM/DD'));
-- 고양스타필드 2관 (tid : 8)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 2, 8, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 3, 8, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 4, 8, TO_DATE('21/10/20','YY/MM/DD'));

-- 김포한강신도시 1관 (tid : 9)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 7, 9, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 8, 9, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 9, 9, TO_DATE('21/10/20','YY/MM/DD'));
-- 그 여름, 가장 차가웠던(ID : 2) / 김포한강신도시 2관(ID :10)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 11, 10, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 13, 10, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 14, 10, TO_DATE('21/10/20','YY/MM/DD'));

-- 남양주 1관 (tid : 11)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 12, 11, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 3, 11, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 4, 11, TO_DATE('21/10/20','YY/MM/DD'));
-- 남양주 2관 (tid : 12)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 5, 12, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 6, 12, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 7, 12, TO_DATE('21/10/20','YY/MM/DD'));

-- 그레타 툰베리(ID : 3) / 검단 1관(ID :13)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 3, 13, TO_DATE('21/09/24','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 2, 13, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 6, 13, TO_DATE('21/10/18','YY/MM/DD'));
-- 검단 2관 (tid : 14)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 11, 14, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 13, 14, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 24, 14, TO_DATE('21/10/20','YY/MM/DD'));

-- 송도 1관 (tid : 15)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 22, 15, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 23, 15, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 14, 15, TO_DATE('21/10/20','YY/MM/DD'));

-- 그레타 툰베리(ID : 3) / 송도 2관(ID : 16)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 30, 16, TO_DATE('21/10/10','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 23, 16, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 13, 16, TO_DATE('21/10/18','YY/MM/DD'));

-- 영종 1관 (tid : 17)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 12, 17, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 3, 17, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 24, 17, TO_DATE('21/10/20','YY/MM/DD'));
-- 영종 2관 (tid : 18)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 10, 18, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 30, 18, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 4, 18, TO_DATE('21/10/20','YY/MM/DD'));

-- 위왓치유(ID : 1) / 공주 1관(ID : 19)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 11, 19, TO_DATE('21/09/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 13, 19, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 15, 19, TO_DATE('21/10/18','YY/MM/DD'));
-- 공주 2관 (tid : 20)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 17, 20, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 16, 20, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 18, 20, TO_DATE('21/10/20','YY/MM/DD'));

-- 논산 1관 (tid : 21)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 29, 21, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 28, 21, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 25, 21, TO_DATE('21/10/20','YY/MM/DD'));
-- 위왓치유(ID : 1) / 논산 2관(ID : 22)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 1, 22, TO_DATE('21/09/12','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 2, 22, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 3, 22, TO_DATE('21/10/18','YY/MM/DD'));

-- 대전 1관 (tid : 23)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 4, 23, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 5, 23, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 6, 23, TO_DATE('21/10/20','YY/MM/DD'));
-- 대전 2관 (tid : 24)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 6, 24, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 8, 24, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 9, 24, TO_DATE('21/10/20','YY/MM/DD'));

-- 그 여름, 가장 차가웠던(ID : 2) / 경북도청 1관(ID :25)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 11, 25, TO_DATE('21/10/01','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 22, 25, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 30, 25, TO_DATE('21/10/18','YY/MM/DD'));
-- 경북도청 2관 (tid : 26)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 12, 26, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 13, 26, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 14, 26, TO_DATE('21/10/20','YY/MM/DD'));

-- 경산하양 1관 (tid : 27)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 15, 27, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 16, 27, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 17, 27, TO_DATE('21/10/20','YY/MM/DD'));
-- 그 여름, 가장 차가웠던(ID : 2) / 경산하양 2관(ID :28)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 19, 28, TO_DATE('21/09/20','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 20, 28, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 4, 28, TO_DATE('21/10/18','YY/MM/DD'));

-- 구미강동 1관 (tid : 29)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 5, 29, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 6, 29, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 7, 29, TO_DATE('21/10/20','YY/MM/DD'));
-- 구미강동 2관 (tid : 30)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 7, 30, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 8, 30, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 9, 30, TO_DATE('21/10/20','YY/MM/DD'));

-- 그레타 툰베리(ID : 3) / 광주상무 1관(ID :31)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 10, 31, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 20, 31, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 21, 31, TO_DATE('21/10/20','YY/MM/DD'));
-- 광주상무 2관 (tid : 32)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 22, 32, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 30, 32, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 6, 32, TO_DATE('21/10/20','YY/MM/DD'));

-- 광주하남 1관 (tid : 33)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 7, 33, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 8, 33, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 9, 33, TO_DATE('21/10/20','YY/MM/DD'));
-- 그레타 툰베리(ID : 3) / 광주하남 2관(ID : 34)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 10, 34, TO_DATE('21/10/21','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 19, 34, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 18, 34, TO_DATE('21/10/18','YY/MM/DD'));

-- 목포하당 1관 (tid : 35)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 7, 35, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 13, 35, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 14, 35, TO_DATE('21/10/20','YY/MM/DD'));
-- 목포하당 2관 (tid : 36)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 21, 36, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 23, 36, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 24, 36, TO_DATE('21/10/20','YY/MM/DD'));

-- 남춘천 1관 (tid : 37)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 1, 37, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 3, 37, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 5, 37, TO_DATE('21/10/20','YY/MM/DD'));
-- 남춘천 2관 (tid : 38)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 7, 38, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 9, 38, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 11, 38, TO_DATE('21/10/20','YY/MM/DD'));

-- 속초 1관 (tid : 39)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 13, 39, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 15, 39, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 17, 39, TO_DATE('21/10/20','YY/MM/DD'));
-- 속초 2관 (tid : 40)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 19, 40, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 21, 40, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 23, 40, TO_DATE('21/10/20','YY/MM/DD'));

-- 원주 1관 (tid : 41)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 24, 41, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 26, 41, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 28, 41, TO_DATE('21/10/20','YY/MM/DD'));
-- 원주 2관 (tid : 42)
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 29, 42, TO_DATE('21/10/02','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 30, 42, TO_DATE('21/10/18','YY/MM/DD'));
INSERT INTO movie_theater(id, mid, tid, enddate) VALUES(movie_t_seq.NEXTVAL, 2, 42, TO_DATE('21/10/20','YY/MM/DD'));

--*************************************
-- 영화이미지테이블 INSERT
--*************************************
CREATE SEQUENCE Image_files_seq;

-- 위왓치유
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 1, 'movie_image.jpg', '/resources/images/movie/1/poster/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 1, 'movie_image (1).jpg', '/resources/images/movie/1/poster/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 1, 'movie_image (2).jpg', '/resources/images/movie/1/poster/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 1, 'movie_image (3).jpg', '/resources/images/movie/1/poster/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 1, 'movie_image (4).jpg', '/resources/images/movie/1/poster/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 1, 'movie_image (5).jpg', '/resources/images/movie/1/poster/');

INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 1, 'movie_image.jpg', '/resources/images/movie/1/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 1, 'movie_image (1).jpg', '/resources/images/movie/1/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 1, 'movie_image (2).jpg', '/resources/images/movie/1/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 1, 'movie_image (3).jpg', '/resources/images/movie/1/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 1, 'movie_image (4).jpg', '/resources/images/movie/1/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 1, 'movie_image (5).jpg', '/resources/images/movie/1/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 1, 'movie_image (6).jpg', '/resources/images/movie/1/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 1, 'movie_image (7).jpg', '/resources/images/movie/1/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 1, 'movie_image (8).jpg', '/resources/images/movie/1/stillcut/');

--  그 여름, 가장 차가웠던
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image.jpg', '/resources/images/movie/2/poster/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (1).jpg', '/resources/images/movie/2/poster/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (2).jpg', '/resources/images/movie/2/poster/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (3).jpg', '/resources/images/movie/2/poster/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (4).jpg', '/resources/images/movie/2/poster/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (5).jpg', '/resources/images/movie/2/poster/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (6).jpg', '/resources/images/movie/2/poster/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (7).jpg', '/resources/images/movie/2/poster/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (8).jpg', '/resources/images/movie/2/poster/');

INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image.jpg', '/resources/images/movie/2/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (1).jpg', '/resources/images/movie/2/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (2).jpg', '/resources/images/movie/2/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (3).jpg', '/resources/images/movie/2/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (4).jpg', '/resources/images/movie/2/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (5).jpg', '/resources/images/movie/2/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (6).jpg', '/resources/images/movie/2/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (7).jpg', '/resources/images/movie/2/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (8).jpg', '/resources/images/movie/2/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (9).jpg', '/resources/images/movie/2/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (10).jpg', '/resources/images/movie/2/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 2, 'movie_image (11).jpg', '/resources/images/movie/2/stillcut/');

--  그레타 툰베리 (I Am Greta)
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image.jpg', '/resources/images/movie/3/poster/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image (1).jpg', '/resources/images/movie/3/poster/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image (2).jpg', '/resources/images/movie/3/poster/');

INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image.jpg', '/resources/images/movie/3/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image (1).jpg', '/resources/images/movie/3/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image (2).jpg', '/resources/images/movie/3/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image (3).jpg', '/resources/images/movie/3/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image (4).jpg', '/resources/images/movie/3/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image (5).jpg', '/resources/images/movie/3/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image (6).jpg', '/resources/images/movie/3/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image (7).jpg', '/resources/images/movie/3/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image (8).jpg', '/resources/images/movie/3/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image (9).jpg', '/resources/images/movie/3/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image (10).jpg', '/resources/images/movie/3/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image (11).jpg', '/resources/images/movie/3/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image (12).jpg', '/resources/images/movie/3/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image (13).jpg', '/resources/images/movie/3/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image (14).jpg', '/resources/images/movie/3/stillcut/');
INSERT INTO Image_files(id, mid, name, path) VALUES(Image_files_seq.NEXTVAL, 3, 'movie_image (15).jpg', '/resources/images/movie/3/stillcut/');

--*************************************
-- 시간테이블 INSERT
--*************************************
CREATE SEQUENCE time_seq;

INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 1, TO_DATE('21/07/14', 'YY/MM/DD'), '11:30:00', '13:14:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 1, TO_DATE('21/07/14', 'YY/MM/DD'), '13:34:00', '15:18:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 1, TO_DATE('21/07/14', 'YY/MM/DD'), '17:40:00', '19:10:00');

INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 2, TO_DATE('21/07/14', 'YY/MM/DD'), '11:40:00', '13:24:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 2, TO_DATE('21/07/14', 'YY/MM/DD'), '13:44:00', '15:28:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 2, TO_DATE('21/07/14', 'YY/MM/DD'), '17:40:00', '19:10:00');

INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 3, TO_DATE('21/07/14', 'YY/MM/DD'), '11:20:00', '13:04:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 3, TO_DATE('21/07/14', 'YY/MM/DD'), '13:04:00', '15:08:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 3, TO_DATE('21/07/14', 'YY/MM/DD'), '17:40:00', '19:10:00');

INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 4, TO_DATE('21/07/14', 'YY/MM/DD'), '11:30:00', '13:14:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 4, TO_DATE('21/07/14', 'YY/MM/DD'), '13:34:00', '15:18:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 4, TO_DATE('21/07/14', 'YY/MM/DD'), '17:40:00', '19:10:00');

INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 5, TO_DATE('21/07/14', 'YY/MM/DD'), '11:30:00', '13:14:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 5, TO_DATE('21/07/14', 'YY/MM/DD'), '13:34:00', '15:18:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 5, TO_DATE('21/07/14', 'YY/MM/DD'), '17:40:00', '19:10:00');

INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 6, TO_DATE('21/07/14', 'YY/MM/DD'), '11:30:00', '13:14:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 6, TO_DATE('21/07/14', 'YY/MM/DD'), '13:34:00', '15:18:00');
INSERT INTO time(id, mtid, moviedate, starttime, endtime) VALUES(time_seq.NEXTVAL, 6, TO_DATE('21/07/14', 'YY/MM/DD'), '17:40:00', '19:10:00');

--UPDATE time SET moviedate = TO_DATE('21/07/14', 'YY/MM/DD');


--*************************************
-- 좌석테이블 INSERT
--*************************************
CREATE SEQUENCE seat_seq;

-- 강남 1관 A
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'A', 1, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'A', 2, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'A', 3, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'A', 4, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'A', 5, 'n');

INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'A', 6, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'A', 7, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'A', 8, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'A', 9, 'n');

INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'A', 10, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'A', 11, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'A', 12, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'A', 13, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'A', 14, 'n');

-- 강남 1관 B
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'B', 1, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'B', 2, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'B', 3, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'B', 4, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'B', 5, 'n');

INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'B', 6, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'B', 7, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'B', 8, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'B', 9, 'n');

INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'B', 10, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'B', 11, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'B', 12, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'B', 13, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'B', 14, 'n');

-- 강남 1관 C
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'C', 1, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'C', 2, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'C', 3, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'C', 4, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'C', 5, 'n');

INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'C', 6, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'C', 7, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'C', 8, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'C', 9, 'n');

INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'C', 10, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'C', 11, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'C', 12, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'C', 13, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'C', 14, 'n');

-- 강남 1관 D
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'D', 1, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'D', 2, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'D', 3, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'D', 4, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'D', 5, 'n');

INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'D', 6, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'D', 7, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'D', 8, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'D', 9, 'n');

INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'D', 10, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'D', 11, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'D', 12, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'D', 13, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'D', 14, 'n');

-- 강남 1관 E
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'E', 1, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'E', 2, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'E', 3, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'E', 4, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'E', 5, 'n');

INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'E', 6, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'E', 7, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'E', 8, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'E', 9, 'n');

INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'E', 10, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'E', 11, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'E', 12, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'E', 13, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'E', 14, 'n');

-- 강남 1관 F
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'F', 1, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'F', 2, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'F', 3, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'F', 4, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'F', 5, 'n');

INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'F', 6, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'F', 7, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'F', 8, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'F', 9, 'n');

INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'F', 10, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'F', 11, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'F', 12, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'F', 13, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'F', 14, 'n');

-- 강남 1관 G
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'G', 1, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'G', 2, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'G', 3, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'G', 4, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'G', 5, 'n');

INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'G', 6, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'G', 7, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'G', 8, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'G', 9, 'n');

INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'G', 10, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'G', 11, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'G', 12, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'G', 13, 'n');
INSERT INTO seat(id, tid, seatrow, seatcol, reserved) VALUES (seat_seq.NEXTVAL, 1, 'G', 14, 'n');

--*************************************
-- 회원테이블 INSERT (SEQUENCE 없는 상태)
--*************************************
INSERT INTO ACCOUNT (id, username, nickname, email, phone, password, gender, age, joindate) VALUES(1, '어드민', '어드민', 'admin@admin.com', '010-1234-1234', 'admin', 'F', 25, SYSDATE);

--*************************************
-- 예매테이블 INSERT
--*************************************
CREATE SEQUENCE res_seq;

INSERT INTO reservation(id, sid, timeid, aid, rdate,  rcnt, totalpay, payment)
	VALUES(res_seq.NEXTVAL, 1, 1, 1, SYSDATE, 1, 13000, 'k');
INSERT INTO reservation(id, sid, timeid, aid, rdate,  rcnt, totalpay, payment)
	VALUES(res_seq.NEXTVAL, 3, 2, 1, SYSDATE, 1, 13000, 'k');
INSERT INTO reservation(id, sid, timeid, aid, rdate,  rcnt, totalpay, payment)
	VALUES(res_seq.NEXTVAL, 8, 8, 1, SYSDATE, 1, 13000, 'k');
INSERT INTO reservation(id, sid, timeid, aid, rdate,  rcnt, totalpay, payment)
	VALUES(res_seq.NEXTVAL, 5, 10, 1, SYSDATE, 1, 13000, 'k');
	
--*************************************
-- line테이블 INSERT
--*************************************
CREATE SEQUENCE line_seq;

--*************************************
-- 포스트테이블 INSERT
--*************************************
CREATE SEQUENCE post_seq;
CREATE SEQUENCE merge_seq;

--*************************************
-- 게시판 구분 테이블 INSERT
--*************************************
CREATE SEQUENCE board_type_seq;
INSERT INTO board_type(id, name) VALUES (board_type_seq.NEXTVAL, '영화리뷰');

--*************************************
-- 게시판 테이블 INSERT
--*************************************
CREATE SEQUENCE board_seq;

--*************************************
-- 페이 테이블 INSERT
--*************************************
CREATE SEQUENCE pay_seq;

INSERT INTO pay(id, price) VALUES(pay_seq.NEXTVAL, 10000);
INSERT INTO pay(id, price) VALUES(pay_seq.NEXTVAL, 13000);