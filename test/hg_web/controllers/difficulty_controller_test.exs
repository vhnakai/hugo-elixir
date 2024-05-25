defmodule HgWeb.DifficultyControllerTest do
  use HgWeb.ConnCase

  import Hg.AppointmentsFixtures

  @create_attrs %{level: "some level"}
  @update_attrs %{level: "some updated level"}
  @invalid_attrs %{level: nil}

  describe "index" do
    test "lists all difficulties", %{conn: conn} do
      conn = get(conn, ~p"/difficulties")
      assert html_response(conn, 200) =~ "Listing Difficulties"
    end
  end

  describe "new difficulty" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/difficulties/new")
      assert html_response(conn, 200) =~ "New Difficulty"
    end
  end

  describe "create difficulty" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/difficulties", difficulty: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/difficulties/#{id}"

      conn = get(conn, ~p"/difficulties/#{id}")
      assert html_response(conn, 200) =~ "Difficulty #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/difficulties", difficulty: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Difficulty"
    end
  end

  describe "edit difficulty" do
    setup [:create_difficulty]

    test "renders form for editing chosen difficulty", %{conn: conn, difficulty: difficulty} do
      conn = get(conn, ~p"/difficulties/#{difficulty}/edit")
      assert html_response(conn, 200) =~ "Edit Difficulty"
    end
  end

  describe "update difficulty" do
    setup [:create_difficulty]

    test "redirects when data is valid", %{conn: conn, difficulty: difficulty} do
      conn = put(conn, ~p"/difficulties/#{difficulty}", difficulty: @update_attrs)
      assert redirected_to(conn) == ~p"/difficulties/#{difficulty}"

      conn = get(conn, ~p"/difficulties/#{difficulty}")
      assert html_response(conn, 200) =~ "some updated level"
    end

    test "renders errors when data is invalid", %{conn: conn, difficulty: difficulty} do
      conn = put(conn, ~p"/difficulties/#{difficulty}", difficulty: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Difficulty"
    end
  end

  describe "delete difficulty" do
    setup [:create_difficulty]

    test "deletes chosen difficulty", %{conn: conn, difficulty: difficulty} do
      conn = delete(conn, ~p"/difficulties/#{difficulty}")
      assert redirected_to(conn) == ~p"/difficulties"

      assert_error_sent 404, fn ->
        get(conn, ~p"/difficulties/#{difficulty}")
      end
    end
  end

  defp create_difficulty(_) do
    difficulty = difficulty_fixture()
    %{difficulty: difficulty}
  end
end
