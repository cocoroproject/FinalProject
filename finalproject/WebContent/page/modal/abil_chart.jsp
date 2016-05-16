<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
<script type="text/javascript">
var chart = AmCharts.makeChart( "chartdiv", {
	  "type": "serial",
	  "theme": "light",
	  "dataProvider": [ {
	    "member": "김동현",
	    "rank": 5
	  }, {
	    "member": "오연주",
	    "rank": 7
	  }, {
	    "member": "정상효",
	    "rank": 9
	  }, {
	    "member": "최지웅",
	    "rank": 8
	  }, {
	    "member": "고석진",
	    "rank": 6
	  } ],
	  "valueAxes": [ {
	    "gridColor": "#FFFFFF",
	    "gridAlpha": 0.2,
	    "dashLength": 0
	  } ],
	  "gridAboveGraphs": true,
	  "startDuration": 1,
	  "graphs": [ {
	    "balloonText": "[[category]]: <b>[[value]]</b>",
	    "fillAlphas": 0.8,
	    "lineAlpha": 0.2,
	    "type": "column",
	    "valueField": "rank"
	  } ],
	  "chartCursor": {
	    "categoryBalloonEnabled": false,
	    "cursorAlpha": 0,
	    "zoomable": false
	  },
	  "categoryField": "member",
	  "categoryAxis": {
	    "gridPosition": "start",
	    "gridAlpha": 0,
	    "tickPosition": "start",
	    "tickLength": 10
	  },
	  "export": {
	    "enabled": true
	  }

	} );
</script>
<style type="text/css">
#chartdiv {
	width		: 100%;
	height		: 500px;
	font-size	: 11px;
}					
</style>
</head>
<body>
	<div id="chartdiv"></div>
</body>
</html>