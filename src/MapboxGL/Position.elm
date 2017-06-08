module MapboxGL.Position
    exposing
        ( Position
        , LngLat
        , toLngLat
        , fromLngLat
        )


type alias Position =
    { lat : Float
    , lng : Float
    }


type alias LngLat =
    ( Float, Float )


toLngLat : Position -> LngLat
toLngLat pos =
    ( pos.lng, pos.lat )


fromLngLat : LngLat -> Position
fromLngLat ( lng, lat ) =
    { lat = lat, lng = lng }
