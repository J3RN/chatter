# Chatter

A simple chat application build with React and Phoenix Channels.

## Getting Started

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Peculiarities of Chatter

Chatter is using CQRS, but not event sourcing (and therefore not the Commanded library). The ramification of this design is that "commands" (actions that update state) live in `lib/chatter/commands/` and "queries" (read actions; pretty much what it sounds like) live in `lib/chatter/queries`.

### Why CQRS?

The biggest reason is that I wanted to gain experience using it. However, the rationale in general is that CQRS prepares the application for a possible future where reads need to be performed against a different database server (i.e. a read replica) to reduce load on the primary database server, which handles writes.
