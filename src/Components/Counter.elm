module Components.Counter exposing (State, getValue, init, view)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


type State
    = State Int


type Msg
    = Dec
    | Inc


init : State
init =
    State 0


getValue : State -> Int
getValue (State value) =
    value


update : Msg -> Int -> Int
update msg value =
    case msg of
        Dec ->
            value - 1

        Inc ->
            value + 1


view : (State -> msg) -> State -> Html msg
view toMsg (State value) =
    div []
        [ button [ onClick (toMsg (State (update Dec value))) ] [ text "decrement" ]
        , button [ onClick (toMsg (State (update Inc value))) ] [ text "increment" ]
        ]
