<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HHMES 실적보고서</title>
</head>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/performancereport.css">

<body>
    <div class="inquiry_Container">
        <div class="inquiry-Particular">
            <select name="Particular-date" id="Particular-date" class="Particular-date-select">
                <option value="">전체</option>
                <option value="">일간</option>
                <option value="">주간</option>
                <option value="">월간</option>
            </select>
            <select name="Particular-production" id="Particular-production" class="Particular-production-select">
                <option value=""></option>
            </select>
        </div>
        <div class="inquiry-DayLayer">
            <input type="date" name="inquiry-startdate" id="inquiry-startdate" class="inquirydate">
            <input type="date" name="inquiry-enddate" id="inquiry-enddate" class="inquirydate">
        </div>
        <div class="inquiry-searchLayer">
            <input type="text" name="inquiry-text" id="inquiry-text" class="inquiry-text">
            <input type="submit" name="inquiry-textsubmit" id="inquiry-textsubmit" class="inquiry-textsubmit" value="Search">
        </div>
    </div>
    <div name="timeline-navigation" id="timeline-navigation" class="timeline-navigation"></div>
    <div name="prod-container" id="prod-container" class="prod-container"></div>
    <div class="chart-container">
        <div name="prod-graph" id="prod-graph" class="chartlayer"></div>
        <div name="prod-chart" id="prod-chart" class="chartlayer"></div>
    </div>
</body>

</html>