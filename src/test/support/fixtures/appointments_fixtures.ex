defmodule Hg.AppointmentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Hg.Appointments` context.
  """

  @doc """
  Generate a appointment.
  """
  def appointment_fixture(attrs \\ %{}) do
    {:ok, appointment} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Hg.Appointments.create_appointment()

    appointment
  end

  @doc """
  Generate a appointment.
  """
  def appointment_fixture(attrs \\ %{}) do
    {:ok, appointment} =
      attrs
      |> Enum.into(%{
        description: "some description",
        end_time: ~N[2024-05-18 16:08:00],
        start_time: ~N[2024-05-18 16:08:00]
      })
      |> Hg.Appointments.create_appointment()

    appointment
  end

  @doc """
  Generate a topic.
  """
  def topic_fixture(attrs \\ %{}) do
    {:ok, topic} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Hg.Appointments.create_topic()

    topic
  end

  @doc """
  Generate a difficulty.
  """
  def difficulty_fixture(attrs \\ %{}) do
    {:ok, difficulty} =
      attrs
      |> Enum.into(%{
        level: "some level"
      })
      |> Hg.Appointments.create_difficulty()

    difficulty
  end

  @doc """
  Generate a status.
  """
  def status_fixture(attrs \\ %{}) do
    {:ok, status} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Hg.Appointments.create_status()

    status
  end

  @doc """
  Generate a appointment.
  """
  def appointment_fixture(attrs \\ %{}) do
    {:ok, appointment} =
      attrs
      |> Enum.into(%{
        description: "some description",
        end_time: ~N[2024-05-18 16:34:00],
        start_time: ~N[2024-05-18 16:34:00]
      })
      |> Hg.Appointments.create_appointment()

    appointment
  end
end
