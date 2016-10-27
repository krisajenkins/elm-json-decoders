module Types exposing (..)

import Http


type alias Station =
    { title : String }


type alias Answer =
    List (List Station)


type Msg
    = QueryComplete (Result Http.Error Answer)


type alias Model =
    { response : Maybe (Result Http.Error Answer) }
