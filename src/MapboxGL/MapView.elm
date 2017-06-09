module MapboxGL.MapView
    exposing
        ( MapView
        , view
        , update
        , Msg(..)
        )

import Html exposing (Html, div)
import Html.Attributes exposing (id, style)
import MapboxGL.Options exposing (MapOptions, cameraOptionsOf)
import MapboxGL.Position exposing (Position, toLngLat)
import MapboxGL.Ports
    exposing
        ( mapboxgl_createMap
        , mapboxgl_flyToMap
        , mapboxgl_setPitch
        )


type alias MapView =
    { id : String
    , options : MapOptions
    }


type Msg
    = CreateMap
    | FlyTo Position
    | SetPitch Int


update : Msg -> MapView -> ( MapView, Cmd msg )
update msg model =
    case msg of
        CreateMap ->
            ( model, mapboxgl_createMap ( model.id, model.options ) )

        FlyTo pos ->
            let
                options =
                    model.options

                newModel =
                    { model | options = { options | center = toLngLat pos } }
            in
                ( newModel
                , mapboxgl_flyToMap ( model.id, cameraOptionsOf newModel.options )
                )

        SetPitch pitch ->
            ( model, mapboxgl_setPitch ( model.id, pitch ) )


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
