$(document).ready(function () {
  $("#customer_country_id").on("change", function () {
    var countryId = $(this).val();

    $.ajax({
      type: "GET",
      url: "/autocomplete/states",
      data: { country_id: countryId },
      dataType: "json",

      success: function (data) {
        var options = '<option value="">Select State</option>';
        $.each(data, function (index, state) {
          options +=
            '<option value="' + state.id + '">' + state.name + "</option>";
        });
        $("#customer_state_id").html(options);
      },
    });
  });
  $("#customer_state_id").on("change", function () {
    var stateId = $(this).val();
    $.ajax({
      type: "GET",
      url: "/autocomplete/cities",
      data: { state_id: stateId },
      dataType: "json",

      success: function (data) {
        var options = '<option value="">Select State</option>';
        $.each(data, function (index, city) {
          options +=
            '<option value="' + city.id + '">' + city.name + "</option>";
        });
        $("#customer_city_id").html(options);
      },
    });
  });
});
