/** initialize DOM */
jQuery.fn.location = function() {
    if (window.navigator.geolocation) {
        var failure, success;
        success = function(position) {
          result = position.coords
          $.ajax({
            type: "PUT",
            url: window.location.pathname,
            data: { user: {location_attributes: {longitude: result.longitude, latitude: result.latitude} }}
          });
        };
        failure = function(message) {
          alert('Cannot retrieve location!');
        };
        navigator.geolocation.getCurrentPosition(success, failure, {
          maximumAge: Infinity,
          timeout: 5000
        });
    };
  };

$(document).ready(function() {
  $("#update-location").click(function(e) {
    e.preventDefault();
    $.fn.location();
  })
});

