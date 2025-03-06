<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/perform.css">
    <link rel="stylesheet" href="css/reset.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
</head>
<body class="perform">
    
        <nav id="nav">
        <!-- <select option></select>
        <option>ì¼ê°</option>
        <option>ì£¼ê°</option>
        <option>ìê°</option> -->
    
         

            
            <!-- <li>ì¤ì  íì¸í</li> -->

            </nav>


                
                <!-- divë¡ ê°ì¸ê³  relative, absolute ì¬ì© -->
                <div id="cor">
                <!-- <button id="del">ì­ì </button>
                <button id="fix">ìì </button> -->
                <!-- <button id="join">ë±ë¡</button> -->
                    <div id="sch">
                    <select id="sel">
                    <option id="daily">ì¼ê°</option>
                    <option id="week">ì£¼ê°</option>
                    <option id="month">ìê°</option>
                    </select>
            
                    
                    <div id="cal">
                    <input type="date" id="date" value="yyyy-mm-dd" name="ë ì§ì í">
                    <input type="week" id="weeks" value="yyyy-mm-dd"  name="ë ì§ì í">
                    <input type="month" id="months" value="yyyy-mm-dd"  name="ë ì§ì í">
                    </div>  

                        <div id="set">
                        <input type="text" id="text">
                        <button id="sele">ì¡°í</button>
                        </div>
    
                    
                       

                    </div>
                









                







                </div>
                     <!-- íì´ë¸ ë°ìí ì¬ì© ìí´  -->
                      <!-- ì¼ê° íì´ë¸ -->
                <div style="overflow-x:auto;" id="tableall">
                    <br><br><br>
                    <table border="1" id="first">
                        <thead>
                            <tr>
                                <th class="daytime">ìì íëª</th>
                                <th class="daytime">06:00~08:00</th>
                                <th class="daytime">08:00~10:00</th>
                                <th class="daytime">10:00~12:00</th>
                                <th class="daytime">12:00~14:00</th>
                                <th class="daytime">14:00~16:00</th>
                                <th class="daytime">16:00~18:00</th>
                            </tr>
                        </thead>
    
                        <tbody>
                         
    
    
    
                                <tr id="budae1">
                                    <td class="name">ë¶ëì°ê°</td>
                                    <td>100</td>
                                    <td>835</td>
                                    <td>445</td>
                                    <td>366</td>
                                    <td>351</td>
                                    <td>923</td> 
                                </tr>
    
                                <tr id="nabe1">
                                    <td class="name">ë°íì  ëë² </td>
                                    <td>626</td>
                                    <td>835</td>
                                    <td>445</td>
                                    <td>366</td>
                                    <td>351</td>
                                    <td>923</td>
                                   
                                </tr>
    
                                <tr id="kimchi1">
                                    <td class="name">ê¹ì¹ì°ê°</td>
                                    <td>626</td>
                                    <td>835</td>
                                    <td>445</td>
                                    <td>366</td>
                                    <td>351</td>
                                    <td>923</td>
                                  
                                </tr>
    
                                <tr id="ttuk1">
                                    <td class="name">ë¡ë³¶ì´</td>
                                    <td>626</td>
                                    <td>835</td>
                                    <td>445</td>
                                    <td>366</td>
                                    <td>351</td>
                                    <td>923</td>
                                 
                                </tr>
    
                                <tr id="ggop1">
                                    <td class="name">ê³±ì°½ì ê³¨</td>
                                    <td>626</td>
                                    <td>835</td>
                                    <td>445</td>
                                    <td>366</td>
                                    <td>351</td>
                                    <td>923</td>
                                   
                                </tr>
                             
                        </tbody>
    
                       </table>
    
    
    
    
                       <!-- <table border=1>" 
                                            
                        + "<thead>"
                           
                            +"<tr>"
                                +"<th>" + day + "</th>"
                                +"<th>06:00~08:00</th>"
                                +"<th>08:00~10:00</th>"
                                +"<th>10:00~12:00</th>"
                                +"<th>12:00~14:00</th>"
                                +"<th>14:00~16:00</th>"
                                +"<th>16:00~18:00</th>"
                            
                            +"</tr>"
                          +"</thead>" -->
    
    
    
    
    
    
    
    
    
                        <!-- ì£¼ê° íì´ë¸ -->
                       <br>
                       <table border=1 id="second">
                        <thead>
                  <tr>
                      <th class="wektime">ìì íëª</th>
                      <th class="wektime">ììì¼</th>
                      <th class="wektime">íìì¼</th>
                      <th class="wektime">ììì¼</th>
                      <th class="wektime">ëª©ìì¼</th>
                      <th class="wektime">ê¸ìì¼</th>
                      <th class="wektime">í ìì¼</th>
                      <th class="wektime">ì¼ìì¼</th>
                  </tr>
                       </thead>
                       <tbody>
                        <tr id="budae2">
                            <td class="name">ë¶ëì°ê°</td>
                            <td >200</td>
                            <td >835</td>
                            <td >445</td>
                            <td >366</td>
                            <td >366</td>
                            <td >366</td>
                            <td >366</td>
                            
                    </tr>
                    <tr id="nabe2">
                        <td class="name">ë°íì ëë² </td>
                        <td >626</td>
                        <td >835</td>
                        <td >445</td>
                        <td >366</td>
                        <td >366</td>
                        <td >366</td>
                        <td >366</td>
                        
                </tr>
                <tr id="kimchi2">
                    <td class="name">ê¹ì¹ì°ê°</td>
                    <td >626</td>
                    <td >835</td>
                    <td >445</td>
                    <td >366</td>
                    <td >366</td>
                    <td >366</td>
                    <td >366</td>
                    
            </tr>
            <tr id="ttuk2">
                <td class="name">ë¡ë³¶ì´</td>
                <td >626</td>
                <td >835</td>
                <td >445</td>
                <td >366</td>
                <td >366</td>
                <td >366</td>
                <td >366</td>
                
        </tr>
        <tr id="ggop2">
            <td class="name">ê³±ì°½ì ê³¨</td>
            <td >626</td>
            <td >835</td>
            <td >445</td>
            <td >366</td>
            <td >366</td>
            <td >366</td>
            <td >366</td>
            
    </tr>
                       </tbody>
                        </table>
    
    
    
    
    
                         <!-- ìê° íì´ë¸ -->
                        <br>
                       <table border="1" id="third">
                        <thead>
                            <tr>
                                <th class="montime">ìì íëª</th>
                                <th class="montime">1ì£¼ì°¨</th>
                                <th class="montime">2ì£¼ì°¨</th>
                                <th class="montime">3ì£¼ì°¨</th>
                                <th class="montime">4ì£¼ì°¨</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr id="budae3">
                                    <td class="name">ë¶ëì°ê°</td>
                                    <td >400</td>
                                    <td >835</td>
                                    <td >445</td>
                                    <td >366</td>
                                    
                            </tr>
                            <tr id="nabe3">
                                <td class="name">ë°íì ëë² </td>
                                <td >626</td>
                                <td >835</td>
                                <td >445</td>
                                <td >366</td>
                                
                        </tr>
                        <tr id="kimchi3">
                            <td class="name">ê¹ì¹ì°ê°</td>
                            <td >626</td>
                            <td >835</td>
                            <td >445</td>
                            <td >366</td>
                            
                    </tr>
                    <tr id="ttuk3">
                        <td class="name">ë¡ë³¶ì´</td>
                        <td >626</td>
                        <td >835</td>
                        <td >445</td>
                        <td >366</td>
                        
                </tr>
                <tr id="ggop3">
                    <td class="name">ê³±ì°½ì ê³¨</td>
                    <td >626</td>
                    <td >835</td>
                    <td >445</td>
                    <td >366</td>
                    
            </tr>
                        </tbody>
                       </table>
                       
                       
                </div>
    
    
    
    
    
    
    
    
    
            
                
           <!-- ë° ì°¨í¸ -->
           <div id="Chartall">
                
            <!-- ì¼ê° ì°¨í¸ -->
           <div id="Chart1">

                   

            <canvas id="myChart" width="1120%" height="450%"></canvas>
            </div>




            
             <!-- ì£¼ê° ì°¨í¸ -->
            <div id="Chart2">

                <!-- <div id="but2">
                <button id="dadd2">ë°ì´í° ì¶ê°</button>
                <button id="ddel2">ë°ì´í° ì­ì </button>
                </div> -->

            <canvas id="myChart2" width="1120%" height="450%"></canvas>
            </div>




            
             <!-- ìê° ì°¨í¸ -->
            <div id="Chart3">

            <!-- <div id="but3">
                <button id="dadd3">ë°ì´í° ì¶ê°</button>
                <button id="ddel3">ë°ì´í° ì­ì </button>
            </div> -->

            
            <canvas id="myChart3" width="1120%" height="450%"></canvas>
            </div>

            </div>




























            
        
            <!-- <br><br><br>
            <input type="text" id="comm" placeholder="ëê¸ì ìë ¥íì¸ì">
            <br>
            <button>ë±ë¡</button> -->
</body>
<footer>
          <!-- <button id="page">1</button> &nbsp; <button id="page2">2</a></button> &nbsp; <button id="page3">3</a></button>
          &nbsp; <button id="page4">4</a></button>  -->



         


</footer>
<script src="../js/perform.js"></script>


</html>