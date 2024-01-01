$(document).ready(function() {
  $('.brand-filter, .category-filter').click(function() {
    $('.brand-filter').removeClass('active-filter');
    $('.category-filter').removeClass('active-filter');
    $(this).addClass('active-filter');
    var brandId = $(this).attr("data-brand-id");
    var categoryId = $(this).attr("data-category-id");
    $.ajax({
    type: 'GET',
    url: '/products.js',
    data: { 
      brand_id: brandId,
      category_id: categoryId,
    },
    success: function(data) { }
    });
  });

  $('#sl2').on('slideStop', function() {
    var priceRange = $("#sl2").val().split(",");
    var minPrice = priceRange[0];
    var maxPrice = priceRange[1];
    $.ajax({
      type: 'GET',
      url: '/products.js',
      data: { 
        min_price: minPrice,
        max_price: maxPrice
      },
      success: function(data) {
      }
    });
  });
});
