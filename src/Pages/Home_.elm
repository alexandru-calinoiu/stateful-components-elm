module Pages.Home_ exposing (Model, Msg, page)

import Components.Counter as Counter
import Html exposing (Html, div, text)
import Page
import Request exposing (Request)
import Shared
import View exposing (View)


type alias Model =
    { counter : Counter.State
    , value : Maybe Int
    }


type Msg
    = CounterChanged Counter.State


page : Shared.Model -> Request -> Page.With Model Msg
page _ _ =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }


init : Model
init =
    { counter = Counter.init, value = Nothing }


update : Msg -> Model -> Model
update msg model =
    case msg of
        CounterChanged state ->
            { model | counter = state, value = Just (Counter.getValue state) }


view : Model -> View Msg
view model =
    { title = "Homepage"
    , body = [ body model ]
    }


body : Model -> Html Msg
body model =
    div
        []
        [ Counter.view CounterChanged model.counter
        , text (String.fromInt (model.value |> Maybe.withDefault 0))
        ]
