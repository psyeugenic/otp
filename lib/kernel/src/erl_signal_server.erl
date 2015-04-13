%%
%% %CopyrightBegin%
%%
%% Copyright Ericsson AB 1996-2013. All Rights Reserved.
%%
%% The contents of this file are subject to the Erlang Public License,
%% Version 1.1, (the "License"); you may not use this file except in
%% compliance with the License. You should have received a copy of the
%% Erlang Public License along with this software. If not, it can be
%% retrieved online at http://www.erlang.org/.
%%
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and limitations
%% under the License.
%%
%% %CopyrightEnd%
%%

-module(erl_signal_server).
-behaviour(gen_server).

-record(state, {
          subscribers=[]
         }).

%% Internal exports
-export([init/1,handle_call/3,handle_cast/2,handle_info/2,terminate/2]).
-export([start_link/0,stop/0,code_change/3]).

start_link() ->
    case gen_server:start_link({local, erl_signal_server}, erl_signal_server, [], []) of
	{ok, _Pid}=Ok -> Ok;
	Error -> Error
    end.

stop() ->
    gen_server:call(erl_signal_server, stop, infinity).

init([]) ->
    {ok,#state{}}.

handle_call(stop,_,S) ->
    {stop, normal, ok, S};
handle_call(_,_,S) ->
    {reply,ok,S}.

handle_cast(_, S) ->
    {noreply,S}.


handle_info(sighup,S) ->
    io:format("got sighup!~n"),
    {noreply,S}.

terminate(_Reason,_S) ->
    ok.

code_change(_Vsn,S,_Extra) ->
    {ok,S}.
