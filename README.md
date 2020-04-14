rebar3_gpb_grpc_plugin
=====

A rebar plugin

Build
-----

    $ rebar3 compile

Use
---

Add the plugin to your rebar config:

    {plugins, [
        {rebar3_gpb_grpc_plugin, {git, "https://host/user/rebar3_gpb_grpc_plugin.git", {tag, "0.1.0"}}}
    ]}.
    
    {erl_opts, [
        {i, "./_build/default/plugins/gpb/include"}
    ]}.
    {gpb_grpc_opts, [
        {i, "proto"},                % path/to/proto_dir
        {module_name_suffix, "_pb"}, % Naming convention, unless you have a good reason just go with it.
        {o, "src/pb"},               % both .erl and .hrl are generated here, we will define the directories below instead.
        {o_erl, "src/pb"},           % Where the generated source is placed
        {o_hrl, "include"},          % Where the generated include files are placed
        {strings_as_binaries, true},
        {recursive, true},
        {maps, true},
        type_specs
    ]}.
    {provider_hooks, [
        {pre, [
            {compile, {gpb_grpc, compile}},
            {clean, {gpb_grpc, clean}}
        ]}
    ]}.

Then just call your plugin directly in an existing application:

    $ rebar3 gpb_grpc 
    ===> Fetching rebar3_gpb_grpc_plugin
    ===> Compiling rebar3_gpb_grpc_plugin
    <Plugin Output>
