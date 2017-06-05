port module MapboxGL.Ports exposing (..)

import MapboxGL.Options exposing (MapOptions, CameraOptions)


-- port for instantiating the map at a DOM node


port mapboxgl_createMap : ( String, MapOptions ) -> Cmd msg


port mapboxgl_flyToMap : ( String, CameraOptions ) -> Cmd msg
