// This is the JS side of the Elm ports for the MapboxGL package
// It isn't clear at the moment how to get this included into the Elm bundle

mapboxgl.accessToken = 'pk.eyJ1IjoibW5tbHN0IiwiYSI6ImNqM2o2cWNrbDAwYXozM3F0ajNqMm9rN3MifQ.KHPi-iyarEjFPVWm0y9slA';

var ElmMapboxGL = {
    maps: {},
    createMap: function (id) {
        var maps = ElmMapboxGL.maps;
        var options = {
            container: id,
            style: 'mapbox://styles/mapbox/streets-v9', //stylesheet location
            center: [-74.50, 40], // starting position
            zoom: 9 // starting zoom
        };
        if (!maps[id]) {
            maps[id] = new mapboxgl.Map(options);
            console.log("new Mapbox GL at '" + id + "':", maps[id])
        }
        return [];
    },
    attach: function(app) {
        app.ports.mapboxgl_createMap.subscribe(function(id) {
            ElmMapboxGL.createMap(id);
        });
    }
}
