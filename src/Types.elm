module Types exposing (..)

import Http


type alias Station =
    { title : String
    , subtitle : Maybe String
    , subscription : Bool
    }


type alias Answer =
    List Station


type Msg
    = QueryComplete (Result Http.Error Answer)


type alias Model =
    { response : Maybe (Result Http.Error Answer) }
