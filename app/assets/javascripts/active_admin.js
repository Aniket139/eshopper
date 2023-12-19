//= require active_admin/base

$(document).ready(function () {
  $(".cover-checkbox").on("click", function (event) {
    console.log("hello");
    event.stopPropagation();
    var url = $(this).attr("data-url");
    console.log(url);
    var galary_image = $(this);
    $.ajax({
      url: url,
      type: "PUT",
      dataType: "json",
      success: function (result) {
        $(".cover-checkbox input").prop("checked", false);
        galary_image.find("input").prop("checked", true);
      },
    });
  });
});
