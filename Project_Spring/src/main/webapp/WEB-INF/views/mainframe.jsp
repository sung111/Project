<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="gnb-bar">
  <div class="navopen-shadow"></div>
  <!-- 여기가 jsp가 로딩이 되는 영역 -->
  <div id="main-content"></div>
</div>

<script>
  document.addEventListener('DOMContentLoaded', function () {
	  fetch('/project/maintitle')
	  .then(response => response.text())
	  .then(html => {
	    document.getElementById('main-content').innerHTML = html;

	    const img = document.getElementById("someImage");
	    if (img) {
	      img.src = "path/to/image.png";
	    }
	  })
	  .catch(err => {
	    console.error('초기 메인타이틀 로드 실패:', err);
	  });

  });
</script>


