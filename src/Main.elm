module Main exposing (..)

import Html exposing (Html, section, h1, text)
import MapboxGL.MapView as MapView exposing (MapView)
import MapboxGL.MapOptions as MapOptions


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = (\model -> Sub.none)
        }



-- MODEL


type alias Model =
    { map : MapView
    }


init : ( Model, Cmd Msg )
init =
    let
        mapview =
            MapView "my_map" MapOptions.default

        msg =
            MapMessage MapView.CreateMap mapview
    in
        update msg (Model mapview)



-- UPDATE


type Msg
    = MapMessage MapView.Msg MapView


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MapMessage msg mapview ->
            let
                ( map, cmd ) =
                    MapView.update msg mapview
            in
                ( { model | map = map }, cmd )



-- VIEW


view : Model -> Html Msg
view model =
    section []
        [ h1 [] [ text "My Map" ]
        , MapView.view model.map
        ]
