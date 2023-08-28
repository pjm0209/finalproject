// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["ISFP","ISFJ","ISTP","ISTJ","INFP","INFJ","INTP","INTJ",
    		 "ESFP","ESFJ","ESTP","ESTJ","ENFP","ENFJ","ENTP","ENTJ"],
    datasets: [{
      data: [12,12,12,12,12,12,12,12,
      		 12,12,12,12,12,12,12,12],
      backgroundColor: ['#b9b136', '#86c501', '#3ac906','#6c51ff','#009bff','#015eac','#03cecb','#163fbb',
      					'#f15d09','#6524d7','#d300ff','#de1764','#ff74e7','#f6be06','#64aa0c','#ff8900'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});
