$(document).ready(function(){
  console.log($("#pendingrequest > tbody > tr").length);
  $("#notification").val($("#pendingrequest > tbody > tr").length);
});

