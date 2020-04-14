-module(rebar3_gpb_grpc_plugin).

-export([init/1]).

-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    {ok, State1} = rebar3_gpb_grpc_plugin_clean:init(State),
    {ok, State2} = rebar3_gpb_grpc_plugin_compile:init(State1),
    {ok, State2}.
