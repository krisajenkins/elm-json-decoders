module State exposing (..)

import Rest
import Types exposing (..)


init : ( Model, Cmd Msg )
init =
    ( { response = Nothing }
    , Rest.getStations
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        QueryComplete response ->
            ( { model | response = Just response }
            , Cmd.none
            )
