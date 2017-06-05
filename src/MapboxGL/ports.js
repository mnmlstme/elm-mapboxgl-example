// This is the JS side of the Elm ports for the MapboxGL package
// It isn't clear at the moment how to get this included into the Elm bundle

mapboxgl.accessToken = 'pk.eyJ1IjoibW5tbHN0IiwiYSI6ImNqM2o2cWNrbDAwYXozM3F0ajNqMm9rN3MifQ.KHPi-iyarEjFPVWm0y9slA';

var ElmMapboxGL = {
    maps: {},

    ports: {
        createMap: function (arg) {
            var maps = ElmMapboxGL.maps;
            var id = arg[0]
            var options = Object.assign({}, {container: id}, arg[1]);
            if (!maps[id]) {
                maps[id] = new mapboxgl.Map(options);
                console.log("new Mapbox GL at '" + id + "':", maps[id])
            }
            return [];
        },

        flyToMap: function (arg) {
            ElmMapboxGL.maps[arg[0]].flyTo(arg[1])
        }
    },

    connect: function(app) {
        Object.keys(ElmMapboxGL.ports)
            .map( function (name) {
                var portname = "mapboxgl_" + name;
                app.ports[portname]
                    .subscribe(ElmMapboxGL.ports[name]);
                });
    }
}
