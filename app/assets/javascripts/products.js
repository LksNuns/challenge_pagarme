$(document).ready(function() {

  var amount = $('#amount');
  var minimum_amount = parseFloat($('#min_amount').text());
  var value = $('form script:first').attr('data-amount', parseInt(amount.val()*100));

  amount.change(function(){
    if(amount.val() < minimum_amount){
      $('.pagarme-checkout-btn').attr("disabled", true);
    }else{
      $('form script:first').attr('data-amount', parseInt(amount.val()*100));
      $('.pagarme-checkout-btn').removeAttr("disabled");
    }
  });
});
