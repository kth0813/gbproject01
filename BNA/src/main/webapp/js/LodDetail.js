function count(type)  {
  // 결과를 표시할 element
  const result1Element = document.getElementById('result1');
  const result2Element = document.getElementById('result2');

  // 현재 화면에 표시된 값
  let number1 = result1Element.innerText;
  let number2 = result2Element.innerText;
  // 더하기/빼기
	if(type === 'plus1') {
		if( number1 <4 && number1>=1 && parseInt(number1)+parseInt(number2)<4){
    	number1 = parseInt(number1) + 1;}
	}else if(type === 'minus1')  {
		if( number1 <=4 && number1>1){
		number1 = parseInt(number1) - 1;
		}
	}
	if(type === 'plus2') {
		if( number2 <4 && number2>=0 && parseInt(number1)+parseInt(number2)<4){
    	number2 = parseInt(number2) + 1;}
	}else if(type === 'minus2')  {
		if( number2 <=4 && number2>0){
		number2 = parseInt(number2) - 1;
		}
	}
  // 결과 출력
  result1Element.innerText = number1;
  result2Element.innerText = number2;
}
	
window.onload = function() {
	today = new Date();
	tomorrow = new Date(today.getTime()+(1000*60*60*24));
	today = today.toISOString().slice(0, 10);
	tomorrow = tomorrow.toISOString().slice(0, 10);
	chkin = document.getElementById("today");
	chkout = document.getElementById("tomorrow");
	chkin.value = today;
	chkout.value = tomorrow;
}



 