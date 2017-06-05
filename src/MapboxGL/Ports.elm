port module MapboxGL.Ports exposing (..)

import MapboxGL.MapOptions exposing (MapOptions)


-- port for instantiating the map at a DOM node


port mapboxgl_createMap : ( String, MapOptions ) -> Cmd msg
