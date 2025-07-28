# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Mcrm.Repo.insert!(%Mcrm.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Mcrm.Repo.insert!(%Mcrm.ContactInfo{city: "Paris", first_name: "Jean", last_name: "Dujardin"})
