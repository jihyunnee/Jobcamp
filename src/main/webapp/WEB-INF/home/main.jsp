<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta id="ch-new-plugin-theme" name="theme-color" content="#686868">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gothic+A1&family=Gowun+Batang&family=Hahmlet&family=Song+Myung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<style type="text/css">
   body, body * {
       font-family: 'Gowun Batang';
   }
h1{
	 display:inline-block;"
}
</style>

</head>
<script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "708c4779-dafe-4260-abe0-c76183c1b24a"
  });
</script>
<script type="text/javascript">
//타이머 종료일을 지정합니다. 이 예제에서는 2023년 5월 1일 00:00:00입니다.
var time;
time = "2023-05-02T14:24:20";
const endDate = new Date(time);

// 1초마다 시간을 업데이트합니다.
 const timeinterval = setInterval(() => {
  // 현재 시간과 타이머 종료일과의 차이를 계산합니다.
  const timeDiff = endDate.getTime() - Date.now();
  if (timeDiff <= 0) {
      clearInterval(timeinterval);
      alert("끝났습니다");
      return;
    }
  // 남은 시간을 일, 시간, 분, 초 단위로 계산합니다.
  const days = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
  const hours = Math.floor((timeDiff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  const minutes = Math.floor((timeDiff % (1000 * 60 * 60)) / (1000 * 60));
  const seconds = Math.floor((timeDiff % (1000 * 60)) / 1000);

  // 각각의 시간 단위에 해당하는 <div> 요소를 가져옵니다.
  const daysEl = document.querySelector(".countdown-timer-days");
  const hoursEl = document.querySelector(".countdown-timer-hours");
  const minutesEl = document.querySelector(".countdown-timer-minutes");
  const secondsEl = document.querySelector(".countdown-timer-seconds");
 
  // 시간을 <div> 요소에 출력합니다.
  daysEl.textContent = days + "일";
  hoursEl.textContent = hours + "시간";
  minutesEl.textContent = minutes + "분";
  secondsEl.textContent = seconds + "초";
}, 1000);
  

</script>
<body>
<div class="countdown">
<h1 class="countdown-timer-days">00</h1>
<h1 class="countdown-timer-hours">00</h1>
<h1 class="countdown-timer-minutes">00</h1>
<h1 class="countdown-timer-seconds">00</h1>
  </div>
</body>
</html>