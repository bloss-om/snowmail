defmodule SnowmailWeb.EmailLiveTest do
  use SnowmailWeb.ConnCase

  import Phoenix.LiveViewTest
  import Snowmail.MailboxFixtures

  @create_attrs %{email: "some email"}
  @update_attrs %{email: "some updated email"}
  @invalid_attrs %{email: nil}

  defp create_email(_) do
    email = email_fixture()
    %{email: email}
  end

  describe "Index" do
    setup [:create_email]

    test "lists all emails", %{conn: conn, email: email} do
      {:ok, _index_live, html} = live(conn, Routes.email_index_path(conn, :index))

      assert html =~ "Listing Emails"
      assert html =~ email.email
    end

    test "saves new email", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.email_index_path(conn, :index))

      assert index_live |> element("a", "New Email") |> render_click() =~
               "New Email"

      assert_patch(index_live, Routes.email_index_path(conn, :new))

      assert index_live
             |> form("#email-form", email: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#email-form", email: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.email_index_path(conn, :index))

      assert html =~ "Email created successfully"
      assert html =~ "some email"
    end

    test "updates email in listing", %{conn: conn, email: email} do
      {:ok, index_live, _html} = live(conn, Routes.email_index_path(conn, :index))

      assert index_live |> element("#email-#{email.id} a", "Edit") |> render_click() =~
               "Edit Email"

      assert_patch(index_live, Routes.email_index_path(conn, :edit, email))

      assert index_live
             |> form("#email-form", email: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#email-form", email: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.email_index_path(conn, :index))

      assert html =~ "Email updated successfully"
      assert html =~ "some updated email"
    end

    test "deletes email in listing", %{conn: conn, email: email} do
      {:ok, index_live, _html} = live(conn, Routes.email_index_path(conn, :index))

      assert index_live |> element("#email-#{email.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#email-#{email.id}")
    end
  end

  describe "Show" do
    setup [:create_email]

    test "displays email", %{conn: conn, email: email} do
      {:ok, _show_live, html} = live(conn, Routes.email_show_path(conn, :show, email))

      assert html =~ "Show Email"
      assert html =~ email.email
    end

    test "updates email within modal", %{conn: conn, email: email} do
      {:ok, show_live, _html} = live(conn, Routes.email_show_path(conn, :show, email))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Email"

      assert_patch(show_live, Routes.email_show_path(conn, :edit, email))

      assert show_live
             |> form("#email-form", email: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#email-form", email: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.email_show_path(conn, :show, email))

      assert html =~ "Email updated successfully"
      assert html =~ "some updated email"
    end
  end
end
