ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Commander.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Commander.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Commander.Repo)

