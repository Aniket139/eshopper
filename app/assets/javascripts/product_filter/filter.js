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
