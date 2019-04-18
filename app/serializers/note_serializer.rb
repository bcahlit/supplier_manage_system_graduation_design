class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :context, :created_at
end
