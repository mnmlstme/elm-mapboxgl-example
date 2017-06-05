module MapboxGL.MapView
    exposing
        ( MapView
        , view
        , update
        , Msg(..)
        )

import Html exposing (Html, div)
import Html.Attributes exposing (id, style)
import MapboxGL.MapOptions exposing (MapOptions)
import MapboxGL.Ports exposing (mapboxgl_createMap)


type alias MapView =
    { id : String
    , options : MapOptions
    }


type Msg
    = CreateMap


update : Msg -> MapView -> ( MapView, Cmd msg )
update msg model =
    case msg of
        CreateMap ->
            ( model, mapboxgl_createMap ( model.id, model.options ) )


view : MapView -> Html msg
view model =
    div
        [ id model.id
        , style
            [ ( "height", "300px" )
            , ( "width", "400px" )
            ]
        ]
        []
