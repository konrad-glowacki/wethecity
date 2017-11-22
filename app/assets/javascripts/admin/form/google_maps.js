var mapWrapper = $('#google-maps');

if (mapWrapper.length) {
  function initMap() {
    var markerPosition = {
      lat: mapWrapper.data('latitude'),
      lng: mapWrapper.data('longitude')
    };

    var map = new google.maps.Map(document.getElementById('google-maps'), {
      zoom: 12,
      center: markerPosition
    });

    var marker = new google.maps.Marker({
      position: markerPosition,
      map: map
    });
  }
}
