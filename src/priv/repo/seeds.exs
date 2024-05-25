# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Hg.Repo.insert!(%Hg.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Hg.Repo
alias Hg.Appointments.Status

statuses = [
  %Status{name: "Iniciado"},
  %Status{name: "Em andamento"},
  %Status{name: "Finalizado"}
]

Enum.each(statuses, fn status ->
  Repo.insert!(status)
end)

IO.puts("Inserted statuses: Iniciado, Em andamento, Finalizado")
