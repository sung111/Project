<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="chatbotPopup" class="chatbot-popup" style="display:none;">
    <div class="chatbot-header">
        <h4>HHMES 챗봇</h4>
        <button id="chatbotCloseBtn">X</button>
    </div>
    <div class="chatbot-body" id="chatbotBody">
        <p>안녕하세요! 무엇을 도와드릴까요?</p>
        <p>- 생산계획 등록 방법<br>- 재고현황 조회<br>- 시스템 사용법</p>
    </div>
    <div class="chatbot-input-layer">
        <input type="text" id="chatInput" placeholder="질문을 입력하세요..." />
        <button id="chatSendBtn">전송</button>
    </div>
</div>
