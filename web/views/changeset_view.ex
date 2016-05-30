defmodule Peepchat.ChangesetView do
  use Peepchat.Web, :view

  @doc """
  Traverses and translates changeset errors.
  """
  def translate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end

  def render("error.json", %{changeset: changeset}) do
    # When encoded, the changeset returns its errors
    # as a JSON object. So we just pass it forward.
    JaSerializer.EctoErrorSerializer.format(changeset)
  end
end
