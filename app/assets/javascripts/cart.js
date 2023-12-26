$(document).ready(function () {
  $(".cart_quantity_input").on("change", function () {
    console.log("hello");
    var quantity = $(this).val();
    var price = parseFloat($(this).closest('.cart_quantity_button').siblings('.cart_price').find('p').text().replace(/[^\d.]/g, ''));
    var total = quantity * price;
    $(this).closest('.cart_quantity_button').siblings('.cart_total').find('.cart_total_price').text('$' + total.toFixed(2));
  });
});