module MapboxGL.Options
    exposing
        ( MapOptions
        , default
        , CameraOptions
        , cameraOptionsOf
        )

import MapboxGL.Position exposing (LngLat)


type alias MapOptions =
    { -- stylesheet location
      style : String
    , -- starting position
      center : LngLat
    , -- starting zoom
      zoom : Int
    }


type alias CameraOptions =
    { -- starting position
      center : LngLat
    , -- starting zoom
      zoom : Int
    }


cameraOptionsOf : MapOptions -> CameraOptions
cameraOptionsOf pos =
    { center = pos.center
    , zoom = pos.zoom
    }


default : MapOptions
default =
    { style =
        "mapbox://styles/mapbox/light-v9"
    , center =
        ( -74.5, 40 )
    , zoom =
        9
    }
