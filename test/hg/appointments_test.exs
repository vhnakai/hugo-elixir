defmodule Hg.AppointmentsTest do
  use Hg.DataCase

  alias Hg.Appointments

  describe "topic" do
    alias Hg.Appointments.Appointment

    import Hg.AppointmentsFixtures

    @invalid_attrs %{name: nil}

    test "list_topic/0 returns all topic" do
      appointment = appointment_fixture()
      assert Appointments.list_topic() == [appointment]
    end

    test "get_appointment!/1 returns the appointment with given id" do
      appointment = appointment_fixture()
      assert Appointments.get_appointment!(appointment.id) == appointment
    end

    test "create_appointment/1 with valid data creates a appointment" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Appointment{} = appointment} = Appointments.create_appointment(valid_attrs)
      assert appointment.name == "some name"
    end

    test "create_appointment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Appointments.create_appointment(@invalid_attrs)
    end

    test "update_appointment/2 with valid data updates the appointment" do
      appointment = appointment_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Appointment{} = appointment} = Appointments.update_appointment(appointment, update_attrs)
      assert appointment.name == "some updated name"
    end

    test "update_appointment/2 with invalid data returns error changeset" do
      appointment = appointment_fixture()
      assert {:error, %Ecto.Changeset{}} = Appointments.update_appointment(appointment, @invalid_attrs)
      assert appointment == Appointments.get_appointment!(appointment.id)
    end

    test "delete_appointment/1 deletes the appointment" do
      appointment = appointment_fixture()
      assert {:ok, %Appointment{}} = Appointments.delete_appointment(appointment)
      assert_raise Ecto.NoResultsError, fn -> Appointments.get_appointment!(appointment.id) end
    end

    test "change_appointment/1 returns a appointment changeset" do
      appointment = appointment_fixture()
      assert %Ecto.Changeset{} = Appointments.change_appointment(appointment)
    end
  end

  describe "appointments" do
    alias Hg.Appointments.Appointment

    import Hg.AppointmentsFixtures

    @invalid_attrs %{description: nil, start_time: nil, end_time: nil}

    test "list_appointments/0 returns all appointments" do
      appointment = appointment_fixture()
      assert Appointments.list_appointments() == [appointment]
    end

    test "get_appointment!/1 returns the appointment with given id" do
      appointment = appointment_fixture()
      assert Appointments.get_appointment!(appointment.id) == appointment
    end

    test "create_appointment/1 with valid data creates a appointment" do
      valid_attrs = %{description: "some description", start_time: ~N[2024-05-18 16:08:00], end_time: ~N[2024-05-18 16:08:00]}

      assert {:ok, %Appointment{} = appointment} = Appointments.create_appointment(valid_attrs)
      assert appointment.description == "some description"
      assert appointment.start_time == ~N[2024-05-18 16:08:00]
      assert appointment.end_time == ~N[2024-05-18 16:08:00]
    end

    test "create_appointment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Appointments.create_appointment(@invalid_attrs)
    end

    test "update_appointment/2 with valid data updates the appointment" do
      appointment = appointment_fixture()
      update_attrs = %{description: "some updated description", start_time: ~N[2024-05-19 16:08:00], end_time: ~N[2024-05-19 16:08:00]}

      assert {:ok, %Appointment{} = appointment} = Appointments.update_appointment(appointment, update_attrs)
      assert appointment.description == "some updated description"
      assert appointment.start_time == ~N[2024-05-19 16:08:00]
      assert appointment.end_time == ~N[2024-05-19 16:08:00]
    end

    test "update_appointment/2 with invalid data returns error changeset" do
      appointment = appointment_fixture()
      assert {:error, %Ecto.Changeset{}} = Appointments.update_appointment(appointment, @invalid_attrs)
      assert appointment == Appointments.get_appointment!(appointment.id)
    end

    test "delete_appointment/1 deletes the appointment" do
      appointment = appointment_fixture()
      assert {:ok, %Appointment{}} = Appointments.delete_appointment(appointment)
      assert_raise Ecto.NoResultsError, fn -> Appointments.get_appointment!(appointment.id) end
    end

    test "change_appointment/1 returns a appointment changeset" do
      appointment = appointment_fixture()
      assert %Ecto.Changeset{} = Appointments.change_appointment(appointment)
    end
  end

  describe "topics" do
    alias Hg.Appointments.Topic

    import Hg.AppointmentsFixtures

    @invalid_attrs %{name: nil}

    test "list_topics/0 returns all topics" do
      topic = topic_fixture()
      assert Appointments.list_topics() == [topic]
    end

    test "get_topic!/1 returns the topic with given id" do
      topic = topic_fixture()
      assert Appointments.get_topic!(topic.id) == topic
    end

    test "create_topic/1 with valid data creates a topic" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Topic{} = topic} = Appointments.create_topic(valid_attrs)
      assert topic.name == "some name"
    end

    test "create_topic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Appointments.create_topic(@invalid_attrs)
    end

    test "update_topic/2 with valid data updates the topic" do
      topic = topic_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Topic{} = topic} = Appointments.update_topic(topic, update_attrs)
      assert topic.name == "some updated name"
    end

    test "update_topic/2 with invalid data returns error changeset" do
      topic = topic_fixture()
      assert {:error, %Ecto.Changeset{}} = Appointments.update_topic(topic, @invalid_attrs)
      assert topic == Appointments.get_topic!(topic.id)
    end

    test "delete_topic/1 deletes the topic" do
      topic = topic_fixture()
      assert {:ok, %Topic{}} = Appointments.delete_topic(topic)
      assert_raise Ecto.NoResultsError, fn -> Appointments.get_topic!(topic.id) end
    end

    test "change_topic/1 returns a topic changeset" do
      topic = topic_fixture()
      assert %Ecto.Changeset{} = Appointments.change_topic(topic)
    end
  end

  describe "difficulties" do
    alias Hg.Appointments.Difficulty

    import Hg.AppointmentsFixtures

    @invalid_attrs %{level: nil}

    test "list_difficulties/0 returns all difficulties" do
      difficulty = difficulty_fixture()
      assert Appointments.list_difficulties() == [difficulty]
    end

    test "get_difficulty!/1 returns the difficulty with given id" do
      difficulty = difficulty_fixture()
      assert Appointments.get_difficulty!(difficulty.id) == difficulty
    end

    test "create_difficulty/1 with valid data creates a difficulty" do
      valid_attrs = %{level: "some level"}

      assert {:ok, %Difficulty{} = difficulty} = Appointments.create_difficulty(valid_attrs)
      assert difficulty.level == "some level"
    end

    test "create_difficulty/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Appointments.create_difficulty(@invalid_attrs)
    end

    test "update_difficulty/2 with valid data updates the difficulty" do
      difficulty = difficulty_fixture()
      update_attrs = %{level: "some updated level"}

      assert {:ok, %Difficulty{} = difficulty} = Appointments.update_difficulty(difficulty, update_attrs)
      assert difficulty.level == "some updated level"
    end

    test "update_difficulty/2 with invalid data returns error changeset" do
      difficulty = difficulty_fixture()
      assert {:error, %Ecto.Changeset{}} = Appointments.update_difficulty(difficulty, @invalid_attrs)
      assert difficulty == Appointments.get_difficulty!(difficulty.id)
    end

    test "delete_difficulty/1 deletes the difficulty" do
      difficulty = difficulty_fixture()
      assert {:ok, %Difficulty{}} = Appointments.delete_difficulty(difficulty)
      assert_raise Ecto.NoResultsError, fn -> Appointments.get_difficulty!(difficulty.id) end
    end

    test "change_difficulty/1 returns a difficulty changeset" do
      difficulty = difficulty_fixture()
      assert %Ecto.Changeset{} = Appointments.change_difficulty(difficulty)
    end
  end

  describe "statuses" do
    alias Hg.Appointments.Status

    import Hg.AppointmentsFixtures

    @invalid_attrs %{name: nil}

    test "list_statuses/0 returns all statuses" do
      status = status_fixture()
      assert Appointments.list_statuses() == [status]
    end

    test "get_status!/1 returns the status with given id" do
      status = status_fixture()
      assert Appointments.get_status!(status.id) == status
    end

    test "create_status/1 with valid data creates a status" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Status{} = status} = Appointments.create_status(valid_attrs)
      assert status.name == "some name"
    end

    test "create_status/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Appointments.create_status(@invalid_attrs)
    end

    test "update_status/2 with valid data updates the status" do
      status = status_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Status{} = status} = Appointments.update_status(status, update_attrs)
      assert status.name == "some updated name"
    end

    test "update_status/2 with invalid data returns error changeset" do
      status = status_fixture()
      assert {:error, %Ecto.Changeset{}} = Appointments.update_status(status, @invalid_attrs)
      assert status == Appointments.get_status!(status.id)
    end

    test "delete_status/1 deletes the status" do
      status = status_fixture()
      assert {:ok, %Status{}} = Appointments.delete_status(status)
      assert_raise Ecto.NoResultsError, fn -> Appointments.get_status!(status.id) end
    end

    test "change_status/1 returns a status changeset" do
      status = status_fixture()
      assert %Ecto.Changeset{} = Appointments.change_status(status)
    end
  end

  describe "appointments" do
    alias Hg.Appointments.Appointment

    import Hg.AppointmentsFixtures

    @invalid_attrs %{description: nil, start_time: nil, end_time: nil}

    test "list_appointments/0 returns all appointments" do
      appointment = appointment_fixture()
      assert Appointments.list_appointments() == [appointment]
    end

    test "get_appointment!/1 returns the appointment with given id" do
      appointment = appointment_fixture()
      assert Appointments.get_appointment!(appointment.id) == appointment
    end

    test "create_appointment/1 with valid data creates a appointment" do
      valid_attrs = %{description: "some description", start_time: ~N[2024-05-18 16:34:00], end_time: ~N[2024-05-18 16:34:00]}

      assert {:ok, %Appointment{} = appointment} = Appointments.create_appointment(valid_attrs)
      assert appointment.description == "some description"
      assert appointment.start_time == ~N[2024-05-18 16:34:00]
      assert appointment.end_time == ~N[2024-05-18 16:34:00]
    end

    test "create_appointment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Appointments.create_appointment(@invalid_attrs)
    end

    test "update_appointment/2 with valid data updates the appointment" do
      appointment = appointment_fixture()
      update_attrs = %{description: "some updated description", start_time: ~N[2024-05-19 16:34:00], end_time: ~N[2024-05-19 16:34:00]}

      assert {:ok, %Appointment{} = appointment} = Appointments.update_appointment(appointment, update_attrs)
      assert appointment.description == "some updated description"
      assert appointment.start_time == ~N[2024-05-19 16:34:00]
      assert appointment.end_time == ~N[2024-05-19 16:34:00]
    end

    test "update_appointment/2 with invalid data returns error changeset" do
      appointment = appointment_fixture()
      assert {:error, %Ecto.Changeset{}} = Appointments.update_appointment(appointment, @invalid_attrs)
      assert appointment == Appointments.get_appointment!(appointment.id)
    end

    test "delete_appointment/1 deletes the appointment" do
      appointment = appointment_fixture()
      assert {:ok, %Appointment{}} = Appointments.delete_appointment(appointment)
      assert_raise Ecto.NoResultsError, fn -> Appointments.get_appointment!(appointment.id) end
    end

    test "change_appointment/1 returns a appointment changeset" do
      appointment = appointment_fixture()
      assert %Ecto.Changeset{} = Appointments.change_appointment(appointment)
    end
  end

  describe "appointments" do
    alias Hg.Appointments.Appointment

    import Hg.AppointmentsFixtures

    @invalid_attrs %{description: nil, start_time: nil, end_time: nil}

    test "list_appointments/0 returns all appointments" do
      appointment = appointment_fixture()
      assert Appointments.list_appointments() == [appointment]
    end

    test "get_appointment!/1 returns the appointment with given id" do
      appointment = appointment_fixture()
      assert Appointments.get_appointment!(appointment.id) == appointment
    end

    test "create_appointment/1 with valid data creates a appointment" do
      valid_attrs = %{description: "some description", start_time: ~N[2024-05-20 16:33:00], end_time: ~N[2024-05-20 16:33:00]}

      assert {:ok, %Appointment{} = appointment} = Appointments.create_appointment(valid_attrs)
      assert appointment.description == "some description"
      assert appointment.start_time == ~N[2024-05-20 16:33:00]
      assert appointment.end_time == ~N[2024-05-20 16:33:00]
    end

    test "create_appointment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Appointments.create_appointment(@invalid_attrs)
    end

    test "update_appointment/2 with valid data updates the appointment" do
      appointment = appointment_fixture()
      update_attrs = %{description: "some updated description", start_time: ~N[2024-05-21 16:33:00], end_time: ~N[2024-05-21 16:33:00]}

      assert {:ok, %Appointment{} = appointment} = Appointments.update_appointment(appointment, update_attrs)
      assert appointment.description == "some updated description"
      assert appointment.start_time == ~N[2024-05-21 16:33:00]
      assert appointment.end_time == ~N[2024-05-21 16:33:00]
    end

    test "update_appointment/2 with invalid data returns error changeset" do
      appointment = appointment_fixture()
      assert {:error, %Ecto.Changeset{}} = Appointments.update_appointment(appointment, @invalid_attrs)
      assert appointment == Appointments.get_appointment!(appointment.id)
    end

    test "delete_appointment/1 deletes the appointment" do
      appointment = appointment_fixture()
      assert {:ok, %Appointment{}} = Appointments.delete_appointment(appointment)
      assert_raise Ecto.NoResultsError, fn -> Appointments.get_appointment!(appointment.id) end
    end

    test "change_appointment/1 returns a appointment changeset" do
      appointment = appointment_fixture()
      assert %Ecto.Changeset{} = Appointments.change_appointment(appointment)
    end
  end
end
