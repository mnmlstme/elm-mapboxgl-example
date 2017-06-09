module Main exposing (..)

import Html exposing (Html, section, h1, text, p, button, input)
import Html.Events exposing (onClick, onInput)
import MapboxGL.MapView as MapView exposing (MapView)
import MapboxGL.Options as MapOptions
import MapboxGL.Position exposing (Position)


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
    , cities : List ( String, Position )
    }


init : ( Model, Cmd Msg )
init =
    let
        mapview =
            MapView "my_map" MapOptions.default

        cities =
            [ ( "Tokyo", Position 35.68501691 139.7514074 )
            , ( "Mumbai", Position 19.01699038 72.8569893 )
            , ( "Mexico City", Position 19.44244244 -99.1309882 )
            , ( "Shanghai", Position 31.21645245 121.4365047 )
            , ( "Sao Paulo", Position -23.55867959 -46.62501998 )
            , ( "New York", Position 40.74997906 -73.98001693 )
            ]

        model =
            Model mapview cities

        initmsg =
            MapMessage MapView.CreateMap mapview
    in
        update initmsg model



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
    let
        pos =
            Position 37.787778 -122.407884

        jumpTo ( name, pos ) =
            button
                [ onClick <| MapMessage (MapView.FlyTo pos) model.map
                ]
                [ text name ]

        changePitch str =
            let
                pitch =
                    String.toInt str
            in
                case pitch of
                    Ok n ->
                        MapMessage (MapView.SetPitch n) model.map

                    Err _ ->
                        MapMessage (MapView.SetPitch 0) model.map
    in
        section []
            [ h1 [] [ text "My Map" ]
            , p []
                (List.map
                    jumpTo
                    model.cities
                )
            , input [ onInput changePitch ] []
            , MapView.view model.map
            ]
