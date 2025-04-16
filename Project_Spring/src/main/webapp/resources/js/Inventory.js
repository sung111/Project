window.addEventListener('load', init );

function init(){

  document.querySelector('#warehouse').addEventListener('click', (e)=>{
    console.log(e.target.value);
    if( e.target.value=='입고일' || e.target.value=='유효기간'){
      document.querySelector('#search').classList.add('hide');
      document.querySelector('#search').disabled = true
      document.querySelector('.go').classList.remove('hide');
      document.querySelector('#receiptDate').disabled = false;
      document.querySelector('#expDate').disabled = false;
    }else {
      document.querySelector('#search').classList.remove('hide');
      document.querySelector('#search').disabled = false;
      document.querySelector('.go').classList.add('hide');
      document.querySelector('#receiptDate').disabled = true;
      document.querySelector('#expDate').disabled = true;
    }
  })








}