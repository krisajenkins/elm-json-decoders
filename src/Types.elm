module Types exposing (..)

import Http


type alias Station =
    String


type alias Answer =
    List Station


type Msg
    = QueryComplete (Result Http.Error Answer)


type alias Model =
    { response : Maybe (Result Http.Error Answer) }
