module MapboxGL.MapOptions
    exposing
        ( MapOptions
        , default
        )

--     container: id,
-- };


type alias MapOptions =
    { -- stylesheet location
      style : String
    , -- starting position
      center : ( Float, Float )
    , -- starting zoom
      zoom : Int
    }


default : MapOptions
default =
    { style =
        "mapbox://styles/mapbox/streets-v9"
    , center =
        ( -74.5, 40 )
    , zoom =
        9
    }
