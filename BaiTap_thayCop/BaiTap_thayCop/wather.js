google.charts.load('current', {'packages':['corechart']});

function parseTimeString(timeString) {
    const [datePart, timePart] = timeString.split('T');
    const [year, month, day] = datePart.split('-');
    const [hour, minute, second] = timePart.split(':');
    return new Date(year, month - 1, day, hour, minute, second);
}

function drawChart(json) {
    const dataArray = [['Time', json.name]];
    json.data.forEach(item => {
        dataArray.push([parseTimeString(item.t), item.v]);
    });

    const data = google.visualization.arrayToDataTable(dataArray);
    const options = {
        title: json.name,
        legend: { position: 'bottom' },
        hAxis: { title: 'Time' },
        vAxis: { title: 'Temperature (°C)' },
        curveType: 'function'
    };

    const chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
    chart.draw(data, options);
}

function fetchWeatherData() {
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                const json = JSON.parse(xhr.responseText);
                drawChart(json);
            } else {
                console.error('Lỗi khi lấy dữ liệu từ API:', xhr.status);
            }
        }
    };

    xhr.open("GET", "WeatherService.asmx/GetWeatherData", true);
    xhr.send();
}
