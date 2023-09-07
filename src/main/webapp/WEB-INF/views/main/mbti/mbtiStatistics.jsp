<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<c:set var="sumCount" value="0"/>

<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['MBTI', 'SCORE'],
          <c:forEach var="map" items="${list}">
          	['${map["MBTI_TYPE"]}', ${map["COUNT"]}],
          	<c:set var="sumCount" value="${sumCount+map['COUNT']}"/>
          </c:forEach>
        ]);

		var options = {
			title:"검사한 인원 : ${sumCount}명",
			slices: {
	            0: { color: '#6c51ff' },
	            1: { color: '#3ac906' },
	            2: { color: '#b9b136' },
	            3: { color: '#86c501' },
	            4: { color: '#009bff' },
	            5: { color: '#015eac' },
	            6: { color: '#163fbb' },
	            7: { color: '#03cecb' },
	            8: { color: '#6524d7' },
	            9: { color: '#f15d09' },
	            10: { color: '#d300ff' },
	            11: { color: '#de1764' },
	            12: { color: '#ff8900' },
	            13: { color: '#64aa0c' },
	            14: { color: '#ff74e7' },
	            15: { color: '#f6be06' }
	        }
		};

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data,options);
      }
</script>
<section>
	<div>
		<div class="mbtiRatio">
			<h1>MBTI 비율</h1>
		</div>
	</div>
	<div id="piechart" style="width: 1400px; height: 800px;"></div>
	<div>
		<div class="mbtiRatio">
			<h1>한국 MBTI 순위 통계</h1>
		</div>
	</div>
	<table id="tbMbtiStatistics">
		<tbody>
			<tr>
				<th data-align="center"><strong>순위</strong></th>
				<th data-align="center"><strong>유형</strong></th>
				<th data-align="center"><strong>비율(총 104,484명)</strong></th>
			</tr>
			<tr>
				<td class="has-text-align-center" data-align="center">1</td>
				<td class="has-text-align-center" data-align="center"><a
					href="<c:url value='/main/mbti/mbtiResult?mbtiType=ISFJ'/>">ISFJ</a></td>
				<td class="has-text-align-center" data-align="center"><strong>9.08%</strong>(9484명)</td>
			</tr>
			<tr>
				<td class="has-text-align-center" data-align="center">2</td>
				<td class="has-text-align-center" data-align="center"><a
					href="<c:url value='/main/mbti/mbtiResult?mbtiType=ISTJ'/>">ISTJ</a></td>
				<td class="has-text-align-center" data-align="center"><strong>8.89%</strong>(9289명)</td>
			</tr>
			<tr>
				<td class="has-text-align-center" data-align="center">3</td>
				<td class="has-text-align-center" data-align="center"><a
					href="<c:url value='/main/mbti/mbtiResult?mbtiType=INFP'/>">INFP</a></td>
				<td class="has-text-align-center" data-align="center"><strong>8.07%</strong>(8435명)</td>
			</tr>
			<tr>
				<td class="has-text-align-center" data-align="center">4</td>
				<td class="has-text-align-center" data-align="center"><a
					href="<c:url value='/main/mbti/mbtiResult?mbtiType=INFJ'/>">INFJ</a></td>
				<td class="has-text-align-center" data-align="center"><strong>7.68%</strong>(8021명)</td>
			</tr>
			<tr>
				<td class="has-text-align-center" data-align="center">5</td>
				<td class="has-text-align-center" data-align="center"><a
					href="<c:url value='/main/mbti/mbtiResult?mbtiType=ENFP'/>">ENFP</a></td>
				<td class="has-text-align-center" data-align="center"><strong>7.36%</strong>(7695명)</td>
			</tr>
			<tr>
				<td class="has-text-align-center" data-align="center">6</td>
				<td class="has-text-align-center" data-align="center"><a
					href="<c:url value='/main/mbti/mbtiResult?mbtiType=ISFP'/>">ISFP</a></td>
				<td class="has-text-align-center" data-align="center"><strong>7.13%</strong>(7447명)</td>
			</tr>
			<tr>
				<td class="has-text-align-center" data-align="center">7</td>
				<td class="has-text-align-center" data-align="center"><a
					href="<c:url value='/main/mbti/mbtiResult?mbtiType=ENFJ'/>">ENFJ</a></td>
				<td class="has-text-align-center" data-align="center"><strong>6.61%</strong>(6910명)</td>
			</tr>
			<tr>
				<td class="has-text-align-center" data-align="center">8</td>
				<td class="has-text-align-center" data-align="center"><a
					href="<c:url value='/main/mbti/mbtiResult?mbtiType=ESFJ'/>">ESFJ</a></td>
				<td class="has-text-align-center" data-align="center"><strong>6.31%</strong>(6598명)</td>
			</tr>
			<tr>
				<td class="has-text-align-center" data-align="center">9</td>
				<td class="has-text-align-center" data-align="center"><a
					href="<c:url value='/main/mbti/mbtiResult?mbtiType=ESTJ'/>">ESTJ</a></td>
				<td class="has-text-align-center" data-align="center"><strong>6.11%</strong>(6381명)</td>
			</tr>
			<tr>
				<td class="has-text-align-center" data-align="center">10</td>
				<td class="has-text-align-center" data-align="center"><a
					href="https://testmoa.com/estj/"></a><a
					href="<c:url value='/main/mbti/mbtiResult?mbtiType=ISTP'/>">ISTP</a></td>
				<td class="has-text-align-center" data-align="center"><strong>5.37%</strong>(6241명)</td>
			</tr>
			<tr>
				<td class="has-text-align-center" data-align="center">11</td>
				<td class="has-text-align-center" data-align="center"><a
					href="<c:url value='/main/mbti/mbtiResult?mbtiType=INTJ'/>">INTJ</a></td>
				<td class="has-text-align-center" data-align="center"><strong>5.97%</strong>(5607명)</td>
			</tr>
			<tr>
				<td class="has-text-align-center" data-align="center">12</td>
				<td class="has-text-align-center" data-align="center"><a
					href="<c:url value='/main/mbti/mbtiResult?mbtiType=ESFP'/>">ESFP</a></td>
				<td class="has-text-align-center" data-align="center"><strong>5.21%</strong>(5444명)</td>
			</tr>
			<tr>
				<td class="has-text-align-center" data-align="center">13</td>
				<td class="has-text-align-center" data-align="center"><a
					href="<c:url value='/main/mbti/mbtiResult?mbtiType=INTP'/>">INTP</a></td>
				<td class="has-text-align-center" data-align="center"><strong>4.92%</strong>(5143명)</td>
			</tr>
			<tr>
				<td class="has-text-align-center" data-align="center">14</td>
				<td class="has-text-align-center" data-align="center"><a
					href="<c:url value='/main/mbti/mbtiResult?mbtiType=ENTJ'/>">ENTJ</a></td>
				<td class="has-text-align-center" data-align="center"><strong>4.87%</strong>(5084명)</td>
			</tr>
			<tr>
				<td class="has-text-align-center" data-align="center">15</td>
				<td class="has-text-align-center" data-align="center"><a
					href="<c:url value='/main/mbti/mbtiResult?mbtiType=ENTP'/>">ENTP</a></td>
				<td class="has-text-align-center" data-align="center"><strong>3.61%</strong>(3767명)</td>
			</tr>
			<tr>
				<td class="has-text-align-center" data-align="center">16</td>
				<td class="has-text-align-center" data-align="center"><a
					href="<c:url value='/main/mbti/mbtiResult?mbtiType=ESTP'/>">ESTP</a></td>
				<td class="has-text-align-center" data-align="center"><strong>2.81%</strong>(2938명)</td>
			</tr>
		</tbody>
	</table>
	<div id="pMbtiDiv">
		<p id="mbti">
			(2023년 7월 25일 기준)<br>
			출처 : MBTI 검사, 테스트모아 표본집단 104,484명
		</p>
	</div>
</section>
<%@ include file="../inc/bottom.jsp"%>