<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HHMES 대시보드</title>
    <header>
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/dashboard.css">
        <script src="js/dashboard.js"></script>
    </header>
</head>

<body>
    <div class="dashboard">
        <div class="dashboardcontainer">
            <h4>실시간 생산현황</h4>
            <div class="dashboardlayer">
                <div class="prodstatus-layer"></div>
                <div class="prodstatus-layer"></div>
            </div>
        </div>
        <div class="dashboardcontainer">
            <h4>실시간 품질관리</h4>
            <div class="dashboardlayer">
                <div class="qualitycontrol-layer"></div>
            </div>
        </div>
        <div class="dashboardcontainer">
            <h4>올해 실적현황</h4>
            <div class="dashboardlayer">
                <div class="perfstatus-layer"></div>
            </div>
        </div>
        <div class="dashboardcontainer">
            <h4>작업현황</h4>
            <div class="dashboardlayer">
                <div class="workstatus-layer">
                    <select name="" id="" class="workstatus-select">
                        <option value="">완제품 선택</option>
                        <option value="">부대찌개</option>
                        <option value="">김치찌개</option>
                        <option value="">밀푀유나베</option>
                        <option value="">떡볶이</option>
                        <option value="">곱창전골</option>
                    </select>
                    <div class="workstatus-page">
                        <div class="workstatus-page-graph"></div>
                        <div class="workstatus-page-title"></div>
                        <div class="workstatus-page-list"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>