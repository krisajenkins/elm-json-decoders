module View exposing (root)

import Html exposing (..)
import Types exposing (..)


root : Model -> Html Msg
root model =
    div []
        [ pre []
            [ code []
                [ text <| toString model.response ]
            ]
        ]
