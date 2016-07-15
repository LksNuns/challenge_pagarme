$( document ).ready(function() {

  var min_amount = parseFloat($('#min_amount').text());
  var amount = $('#amount');

  amount.change(function(){
    if(amount.val() < min_amount)
      $('.pagarme-checkout-btn').attr("disabled", true);
    else
      $('form script:first').attr('data-amount', parseInt(amount.val()*100));
      $('.pagarme-checkout-btn').removeAttr("disabled");
  });

});
