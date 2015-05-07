json.array!(@notes) do |note|
  json.id note.id
  json.title note.title
  json.body_text note.body_text
  json.body_html note.body_html
  json.created_at note.created_at
  json.updated_at note.updated_at
  json.url api_v1_note_url(note)
end
