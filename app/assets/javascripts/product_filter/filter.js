$(document).ready(function () {
  $("#filter_form select, .brand-filter, .category-filter, #sl2").change(
    function () {
      $("#filter_form").submit();
      // var categorySlug = '#{category.slug}';
      // var url = '/products?category=' + categorySlug;
      // window.location.href = url;
    }
  );
});

// $(document).ready(function() {
//   $("#filter_form select, .brand-filter, #category-label, #sl2").click(function() {
//     $("#filter_form").submit();
//     // event.preventDefault();  
//     // var brandId = $(this).attr("data-brand-id");
//     // var categoryId = $(this).attr("data-category-id");
//     // var priceRange = $("#sl2").val().split(",");
//     // var minPrice = priceRange[0];
//     // var maxPrice = priceRange[1];
//     // baseUrl = window.location.href;
//     // var name = "";
//     // var new_url = baseUrl + "?name=" + name
//     //   + "&category_id=" + categoryId
//     //   + "&brand_id=" + brandId
//     //   + "&min_price=" + minPrice
//     //   + "&max_price=" + maxPrice;
//     var categorySlug = '#{category.slug}';
//     var url = '/products?category=' + categorySlug;
//     window.location.href = url;
//     // $.ajax({
//     //   type: 'GET',
//     //   url: new_url,
//     //   data: {
//     //     category_id: categoryId,
//     //     brand_id: brandId,
//     //     min_price: minPrice,
//     //     max_price: maxPrice
//     //   },
//     //   success: function(data) {
//     //   }
//     // });
//   });
