if ($('#google-map').length) {
  function initMap() {
    var uluru = {
      lat: 0,
      lng: 0
    };

    var map = new google.maps.Map(document.getElementById('google-map'), {
      zoom: 4,
      center: uluru
    });

    var marker = new google.maps.Marker({
      position: uluru,
      map: map
    });
  }
}