port module MapboxGL.MapView
    exposing
        ( MapView
        , view
        , update
        , Msg(..)
        )

import Html exposing (Html, div)
import Html.Attributes exposing (id, style)


-- port for instantiating the map at a DOM node


port mapboxgl_createMap : String -> Cmd msg


type alias MapView =
    { id : String
    }


type Msg
    = CreateMap


update : Msg -> MapView -> ( MapView, Cmd msg )
update msg model =
    case msg of
        CreateMap ->
            ( model, mapboxgl_createMap model.id )


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
