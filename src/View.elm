module View exposing (root)

import Html exposing (..)
import Types exposing (..)


root : Model -> Html msg
root model =
    div []
        [ case model.response of
            Nothing ->
                text "Not loaded"

            Just (Err err) ->
                i [] [ text (toString err) ]

            Just (Ok stations) ->
                stationsView stations
        ]


stationsView : List Station -> Html msg
stationsView stations =
    div []
        (List.map stationView stations)


stationView : Station -> Html msg
stationView station =
    div []
        [ h4 [] [ text station.title ]
        , p [] [ text (Maybe.withDefault "-" station.subtitle) ]
        , p []
            [ text
                (if station.subscription then
                    "Pay!"
                 else
                    "Free"
                )
            ]
        ]
