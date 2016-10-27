module Rest exposing (..)

import Http
import Json.Decode exposing (..)
import Task
import Types exposing (..)


decodeStations : Decoder (List Station)
decodeStations =
    succeed []


getStations : Cmd Msg
getStations =
    -- The real API is at http://tunein.com/search/?query=jazz, but
    -- for speed of development we'll use a static file.
    "/jazz.json"
        |> Http.get decodeStations
        |> Task.perform Err Ok
        |> Cmd.map QueryComplete
