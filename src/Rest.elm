module Rest exposing (..)

import Http
import Json.Decode exposing (..)
import Task
import Types exposing (..)


decodeStation : Decoder Station
decodeStation =
    object1 Station
        (at [ "Title" ] string)


decodeGuideItem : Decoder (List Station)
decodeGuideItem =
    list decodeStation


decodeStations : Decoder (List (List Station))
decodeStations =
    at [ "payload", "ContainerGuideItems", "containers" ]
        (list (at [ "GuideItems" ] decodeGuideItem))


getStations : Cmd Msg
getStations =
    -- The real API is at http://tunein.com/search/?query=jazz, but
    -- for speed of development we'll use a static file.
    "/jazz.json"
        |> Http.get decodeStations
        |> Task.perform Err Ok
        |> Cmd.map QueryComplete
