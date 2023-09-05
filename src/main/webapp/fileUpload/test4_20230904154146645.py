def sum(a, b): 
    result = a + b 
    return result

a = sum(3, 4)
print(a)

print('--------------')
def add(a, b):
     return a+b

result = add(a=3, b=7)  # a에 3, b에 7을 전달
print(result)

#매개변수를 지정하면 순서에 상관없이 사용할 수 있다는 장점이 있다.

result = add(b=5, a=3)  # b에 5, a에 3을 전달
print(result)


#매개변수 이름 앞에 *을 붙이면 입력값을 전부 모아서 튜플로 만들어 줌
#몇 개가 입력될지 모를 때 사용
print('==============')
def sum_many(*args): 
    sum = 0 
    for i in args: 
        sum = sum + i 
    return sum 
 
print(sum_many(1,2,3))
print(sum_many(1,2,3,4,5))

#키워드 파라미터 kwargs
#키워드 파라미터를 사용할 때는 매개변수 앞에 별 두 개(**)를 붙인다. 

def print_kwargs(**kwargs):
     print(kwargs)

print_kwargs(a=1)
{'a': 1}
print_kwargs(name='foo', age=3)
{'age': 3, 'name': 'foo'}

#입력값 a=1 또는 name='foo', age=3이 모두 딕셔너리로 만들어져서 출력된다
#즉 **kwargs처럼 매개변수 이름 앞에 **을 붙이면 매개변수 kwargs는 딕셔너리가 되고 
# 모든 key=value 형태의 결괏값이 그 딕셔너리에 저장된다.

print('------------------')
def sum_and_mul(a,b): 
    return a+b, a*b

result = sum_and_mul(3,4)
print(result)
#함수의 결과값은 언제나 하나이다
#결괏값 a+b와 a*b는 튜플값 하나인 (a+b, a*b)로 돌려준다.

result1, result2 = sum_and_mul(3, 4)
print(result1)
print(result2)

#매개 변수에 초깃값 미리 설정하기
print('=======================')
def say_myself(name, old, man=True): 
    print("나의 이름은 %s 입니다." % name) 
    print("나이는 %d살입니다." % old) 
    if man: 
        print("남자입니다.")
    else: 
        print("여자입니다.")

say_myself("박응용", 27)
say_myself("박응용", 27, True)
say_myself("박응용", 27, False)


#함수 안에서 선언된 변수의 효력 범위
print('--------------------------------------')
a = 1

def vartest(a):
    a = a +1  #2

vartest(a)
print(a)   # 1

def vartest(a):
    a = a + 1 #4

vartest(3)
#print(aa)   # 오류발생

#실행해 보면 결괏값은 1이 나온다

#함수 안에서 새로 만든 매개변수는 함수 안에서만 사용하는 "함수만의 변수"이다. 
#즉 def vartest(a)에서 입력값을 전달받는 매개변수 a는 함수 안에서만 사용하는 
# 변수이지 함수 밖의 변수 a가 아니라는 뜻이다.

#함수 안에서 사용하는 매개변수는 함수 밖의 변수 이름과는 전혀 상관이 없다는 뜻이다.
#함수 안에서 선언한 매개변수는 함수 안에서만 사용될 뿐 함수 밖에서는 사용되지 않는다.

print('==============================')
#[1]
a = 1 
def vartest(a): 
    a = a +1 
    return a #2

a = vartest(a) 
print(a)   #2

#[2]
a = 1 
def vartest(): 
    global a 
    a = a+1

vartest() 
print(a)  #2

#global 명령어 사용하기
#vartest 함수 안의 global a 문장은 함수 안에서 함수 밖의 a 변수를 직접 
# 사용하겠다는 뜻이다. 

#lambda 매개변수1, 매개변수2, ... : 매개변수를 이용한 표현식
print('=================')

add = lambda a, b: a+b
result = add(3, 4)
print(result)

#add는 두 개의 인수를 받아 서로 더한 값을 돌려주는 lambda 함수. 
#def를 사용한 다음 함수와 하는 일이 완전히 동일

def add(a, b):
    return a+b

result = add(3, 4)
print(result)

#※ lambda 예약어로 만든 함수는 return 명령어가 없어도 결괏값을 돌려준다.
