
new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
      labels: ["1점", "2점", "3점", "4점", "5점"],
      datasets: [
        {
          label: "평가한 개수",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
          data: [15,20,45,32,24,0]
        }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text: '평점 분포도'
      }
    }
});