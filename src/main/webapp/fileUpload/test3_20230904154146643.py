money = 2000
card = 1
if money >= 3000 or card:
    print("택시를 타고 가라")
else:
    print("걸어가라")


pocket = ['paper', 'cellphone', 'money']
if 'money' in pocket:
     print("택시를 타고 가라")
else:
     print("걸어가라")

if 'money' in pocket:
     pass 
else:
     print("카드를 꺼내라")

print('================')
pocket = ['paper', 'cellphone']
card = 1
if 'money' in pocket:
      print("택시를 타고가라")
elif card: 
      print("택시를 타고가라!!")
else:
    print("걸어가라")


score=100
if score >= 60:
    message = "success"
else:
    message = "failure"

print(message)

#파이썬의 조건부 표현식(conditional expression)을 사용
#참인 경우 if 조건문 else 거짓인 경우
score=55
message = "success" if score >= 60 else "failure"
print(message)

print('========continue========')
a = 0
while a < 10:
     a = a+1
     if a % 2 == 0: continue
     print(a)

print('========break=======')
a = 0
while a < 10:
     a = a+1
     if a % 2 == 0: break
     print(a)

print('--------for--------')
test_list = ['one', 'two', 'three'] 
for i in test_list: 
    print(i)

print('-------------')
a = [(1,2), (3,4), (5,6)]
for (first, last) in a:
    print(first + last)

#a 리스트의 요솟값이 튜플이기 때문에 각각의 요소가 자동으로 (first, last) 변수에 
#대입된다.

#튜플을 사용한 변수값 대입 방법과 매우 비슷한 경우
(first, last) = (1, 2)
 
marks = [90, 25, 67, 45, 80]

number = 0 
for mark in marks: 
    number = number +1 
    if mark >= 60: 
        print("%d번 학생은 합격입니다." % number)
    else: 
        print("%d번 학생은 불합격입니다." % number)


print('=====================')
#range(시작 숫자, 끝 숫자) 형태를 사용하는데, 이때 끝 숫자는 포함되지 않는다.
#range(10)은 0부터 10 미만의 숫자를 포함하는 range 객체를 만들어 준다.
a = range(10) #0~9
print(a)

sum = 0 
for i in range(1, 11): 
    sum = sum + i 
 
print(sum)

print('===== 2~4 =====')
for i in range(2,5):
     print(i)

print('=====================')
marks = [90, 25, 67, 45, 80]
for number in range(len(marks)):
    if marks[number] < 60: 
        continue
    print("%d번 학생 축하합니다. 합격입니다." % (number+1))

for i in range(2,10): 
     for j in range(1, 10): 
         print(i*j, end=" ") 
     print('') 

# 매개변수 end를 넣어 준 이유는 해당 결괏값을 출력할때 다음줄로 넘기지 않고 
# 그 줄에 계속해서 출력하기 위해서. 


#리스트 안에 for문을 포함하는 리스트 내포(List comprehension) 사용
# [표현식 for 항목 in 반복가능객체 if 조건문]
print('------------------------')
a = [1,2,3,4]
result = []
for num in a:
     result.append(num*3)

print(result)

result = [num * 3 for num in a]
print(result)

result = [num * 3 for num in a if num % 2 == 0]
print(result)


#for문을 2개 이상 사용하는 것도 가능.
#[표현식 for 항목1 in 반복가능객체1 if 조건문1
#        for 항목2 in 반복가능객체2 if 조건문2
#        ...
#        for 항목n in 반복가능객체n if 조건문n]

#구구단의 모든 결과를 리스트에 담고 싶다면 리스트 내포를 사용하여 구현
print('====================')
result = [x*y for x in range(2,10)
              for y in range(1,10)]
print(result)

