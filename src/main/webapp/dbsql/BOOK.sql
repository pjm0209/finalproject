select * from book;

--------------------------------------------------------------------------------------------------------------------------------------------
<INSERT>
insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+10000, 'MBTI Form M 자가채점용', 6800, '어세스타', '검사자료', '어세스타', 'Y', 'MBTI® Form M 자가채점용은 검사지, 답안지, 프로파일이 일체형으로 구성',
'MBTI® Form M 자가채점용은 검사지, 답안지, 프로파일이 일체형으로 구성되어 있으며 검사를 실시한 후에 결과를 바로 확인할 수 있는 자가채점용 검사입니다.
MBTI® Form M 자가채점용은 총 93문항이며 글로벌 기준에 맞추어 유형 해석 지문을 최소화한 버전입니다.');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval, 'MBTI Form M 고등학생용 검사지, 프로파일(자가채점용)', 6800, '어세스타', '검사자료', '어세스타', 'Y', 'MBTI® Form M 고등학생용은 검사지, 답안지, 프로파일이 일체형으로 구성',
'MMBTI® Form M 고등학생용은 검사지, 답안지, 프로파일이 일체형으로 구성되어 있으며, 검사를 실시한 후에 결과를 바로 확인할 수 있는 자가채점용 검사입니다.
MBTI® Form M은 총 93문항이며 문항 선발 방법, 채점 방법, 척도의 중간점수를 결정하는 방법 등이 개선되어 내담자의 최적유형(best-fit type)을 찾아갈 수 있도록 해 줍니다.
MBTI® Form M 고등학생용은 학교생활에 초점을 맞추어 프로파일이 구성된 점에서 한국형 일반용과 차이가 있습니다.');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+10000, 'MBTI Form M 학교단체용 답안지, 프로파일(자동채점용)_고등학생용', 6800, '어세스타', '검사자료', '어세스타', 'Y',
'MBTI Form M 고등학생용 자동채점 답안지, 프로파일로 MBTI Form M 학교단체용 검사지(자동채점용)와 함께 사용',
'MBTI Form M 고등학생용 자동채점 답안지, 프로파일로 MBTI Form M 학교단체용 검사지(자동채점용)와 함께 사용할 수 있습니다');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+10000, 'MBTI Form M 학교단체용 답안지, 프로파일(자동채점용)_대학생용', 6000, '어세스타', '검사자료', '어세스타', 'Y',
'MBTI Form M 대학생용 자동채점 답안지, 프로파일로 MBTI Form M 학교단체용 검사지(자동채점용)와 함께 사용',
'MBTI Form M 대학생용 자동채점 답안지, 프로파일로 MBTI Form M 학교단체용 검사지(자동채점용)와 함께 사용할 수 있습니다');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+20000, '성격유형과 팀', 13000, '어세스타', '도서', '어세스타', 'Y',
'MBTI 관련 서적',
'MBTI는 개인 대상으로도 활용되지만, 서로 다른 재능을 가진 개인들이 함께 모여 일하는 팀에 적용될 때 더욱 빛을 발합니다. 이 책의 목적은 본인과 리더를 포함한 팀 구성원들의 성격유형이 업무 상황에 어떤 영향을 주는지 이해하고, 이를 팀 빌딩에 활용함으로써 팀이 목표한 바를 이루어가도록 하는 것입니다. 세부적으로 팀의 6가지 주요 이슈인 의사소통, 팀 문화, 리더십, 변화, 문제 해결 및 갈등 관리, 스트레스 관리를 16가지 성격유형과 연결하여 개인 및 팀의 효율성 증진을 도울 수 있는 내용으로 구성되어 있습니다.

* 목차
1. 서론
  ? 팀과 팀 빌딩
  ? MBTI와 MBTI가 팀에 주는 유익

2. 선호지표 이해
  ? 본인의 선호지표 확인하기
  ? 업무 상황에서의 선호지표 확인하기
  ? 6가지 주요 팀 이슈와 MBTI 선호지표
3. 성격유형 이해
  ? 16가지 성격유형

4. 유형도표와 5가지 렌즈 이해
  ? 유형도표 살펴보기
  ? 5가지 렌즈
  ? 팀 분석
  ? 맺는 말');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+20000, '성격유형과 중년기 심리', 13000, '한국MBTI연구소', '도서', 'Eleanor S. Corlett, Nancy B. Millner', 'Y',
'MBTI 관련 서적',
'본서는 융 이론과 MBTI 유형론 관점에서, 위기이자 기회의 시기인 중년기 여정을 항해하는 모든 사람들을 돕고자 마련된 지침서라 할 수 있습니다. 저자들은 풍부한 강연, 워크숍, 면담을 통해 유형별 중년기 사례를 분석하고 Jung과 Stein이론에 근거하여 중년기에 진정한 자신을 찾도록 격려합니다.

* 목차
제1부 중년기 : 그 영역의 탐구
        1장 중년기 개관
        2장 Jung의 유형론 렌즈
        3장 인생의 전반기 조망
        4장 중년기 여정을 조명하기

제2부 중년기 이야기
        5장. 중년기에 보이는 각 성격유형의 장점과 도전

제3부 더 깊이 더 멀리
        6장. 영성의 선물
        7장. 성격유형의 선물
        8장. 중년기 열등기능과 그림자
        9장. 중년기 발달 영역 확장하기
        10장. 중년기 여정과 만다라');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+20000, '성격유형과 진로발달', 15000, '어세스타', '도서', '어세스타', 'Y',
'본서는 진로 및 인력개발 분야에서 사람들을 전문적으로 돕기 위해 제작됨',
'본서는 진로 및 인력개발 분야에서 사람들을 전문적으로 돕기 위해 제작되었습니다. 전문가가 성격유형 이론을 적용하여 사람들의 진로발달 과정을 돕고 진로관련 전문성을 증대시킬 수 있도록 하는 목적을 지닙니다.

* 목차
Ⅰ. 진로발달에서의 성격유형 활용 전략

Ⅱ. 진로발달 과정

Ⅲ. 내담자에게 맞는 진로발달 설정하기

Ⅳ. 내담자의 유형발달 촉진하기

Ⅴ. 진로상담자의 유형발달 촉진하기');


insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+20000, '성장하는 아이들', 13000, '어세스타', '도서', 'Elizabeth Murphy', 'Y',
'Elizabeth Murphy는 어른이 아이의 자연스러운 선천적 선호를 이해함으로써 관계가 긍정적으로 발전할 수 있다고 설명',
'Elizabeth Murphy는 어른이 아이의 자연스러운 선천적 선호를 이해함으로써 관계가 긍정적으로 발전할 수 있다고 설명하고 있습니다. 이 책은 Carl Jung의 심리유형론을 기초로 아이들의 일상생활에서 나타나는 다양한 유형 관련 사례와 함께 다음과 같은 내용을 포함하고 있습니다. 

* 목차
융의 성격유형 이론과 아이들의 발달

양육과 교육에서의 유형 활용

다양한 유형 아이들과의 긍정적 관계 향상을 위한 제안');


insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+20000, '융의심리유형론 열등기능과 감정기능', 12000, '어세스타', '도서', 'Marie-Louise von Franz, James Hillman', 'Y',
'LECTURES ON JUNG Typology의 변역서',
'융의 심리유형론은 마리 루이제 폰 프란츠와 제임스 힐만의 체험에 바탕을 둔 강의 내용이 녹아든
LECTURES ON JUNG Typology의 변역서로 융의 유형 이론에
대해 보다 깊이있고 흥미롭게 이해할 수 있습니다.
폰 프란츠는 마음의 기능, 그 중에서도 무의식에 뿌리를 둔 열등 기능에 대한 이해를 도와
우리가 열등 기능의 부정적인 에너지에 휘말리지 않고 건강하게 살아갈 수 있도록
열등기능에 대한 융의 생각을 전하고 있습니다.
또한 제임스 힐만은 감정의 역사와 융이 이야기한 감정기능의 특징을 자신의 체험을
통해 요약하고 있습니다');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+30000, 'MBTI 성격유형 카드', 15000, '어세스타', '기타', '어세스타', 'Y',
'MBTI 성격유형 카드는 성격유형을 활용해 업무 환경 속에서 나와 팀원들의 성격 특성을 이해하고 팀/조직이 함께 발전하도록 돕는 카드 형태의 교구',
'MBTI 성격유형 카드는 성격유형을 활용해 업무 환경 속에서 나와 팀원들의 성격 특성을 이해하고 팀/조직이 함께 발전하도록 돕는 카드 형태의 교구입니다.                                                                                                                       

16가지 성격유형 별로 해당 성격유형을 잘 표현하는 키워드와 조직 내에서의 강점 및 보완할 점을 확인할 수 있습니다.

팀 단위, 조직 단위에서 여러 사람들과 업무를 함께 진행해 나갈 때에, 업무 상에서 스스로의 성장이 필요할 때 유용하게 쓰일 수 있습니다.

* 목차
구성 : 카드 상자 + 카드 총 18장 + 나무꽂이

-MBTI 선호지표 안내/ 성격유형 앱 소개 (1장)                                                                                             

-16가지 성격유형 카드 소개 (1장)                                                                                                            

-16가지 성격유형 별 카드 (16장)
(앞면 : Keywords, 조직 내에서의 나의 강점)
(뒷면 : 고성과자가 되기 위해 보완할 점(코칭 관점))

* 카드를 꽂아 놓고 볼 수 있는 나무꽂이가 들어있습니다.');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+30000, 'MBTI Type Calendar', 15000, '어세스타', '기타', '어세스타', 'Y',
'MBTI Type Calendar는 성격유형을 활용해 자아 탐색 및 상호 이해를 돕는 달력 형태의 교구',
'MBTI® Type Calendar는 성격유형을 활용해 자아 탐색 및 상호 이해를 돕는 달력 형태의 교구입니다. 16가지 성격유형 중 두 가지 유형의 연관 키워드와 강·약점, 자주 듣는 말을 비교하여 볼 수 있습니다. 개인의 최적 유형 탐색과 더불어 2인 1조 상황에서 MBTI®를 활용하여 서로를 이해하는 데 효과적인 실습 도구입니다. 가족, 친구, 연인, 동료와 나의 성격유형을 비교하고 차이를 이해하고 싶을 때, 검사결과 유형이 본인의 생각과 달라 최적 유형을 찾고 싶을 때 유용하게 쓰일 수 있습니다.

* 목차
? 교구 사용 안내
? 4가지 선호지표 설명
? 16가지 성격유형 비교
   (앞면: Keywords, 특징)
   (뒷면: 사각지대(Blind spot), 자주 듣는 말)');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+30000, 'MBTI 상징이미지_엽서', 7500, '어세스타', '기타', '어세스타', 'Y',
'주기능별 이미지와 그와 관련된 융의 ‘심리유형론’의 번역문을 제시',
'주기능별 이미지와 그와 관련된 융의 ‘심리유형론’의 번역문을 제시하였습니다.
본 엽서는 총 8장의 낱장으로 구성되어 있어 상황에 따라 편리하고 간편하게 휴대할 수 있습니다');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+30000, '유형카드', 700, '어세스타', '기타', '어세스타', 'Y',
'각 유형별 특징을 집약하여 한 장의 카드에 제시해 줌으로써 각 유형별 이해를 보다 쉽게 할 수 있도록 도와줍니다',
'각 유형별 특징을 집약하여 한 장의 카드에 제시해 줌으로써 각 유형별 이해를 보다 쉽게 할 수 있도록 도와줍니다');

insert into book(BOOK_NO, BOOK_TITLE, BOOK_PRICE, BOOK_PUBLISHER, BOOK_CATEGORY, BOOK_WRITER, BOOK_USEFLAG, BOOK_EXPLAINS, BOOK_DETAILS)
values(book_seq.nextval+30000, '16가지 성격유형 도표', 8500, '어세스타', '기타', '어세스타', 'Y',
'A1사이즈로 코팅된 종이로 그룹의 결과 유형 분포표를 한 눈에 보기 쉽게 확인할 수 있는 자료입니다',
'A1사이즈로 코팅된 종이로 그룹의 결과 유형 분포표를 한 눈에 보기 쉽게 확인할 수 있는 자료입니다');

--------------------------------------------------------------------------------------------------------------------------------------------