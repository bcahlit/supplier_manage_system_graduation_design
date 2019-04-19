class NotesController < ApplicationController
  load_and_authorize_resource
  before_action :set_note, only: [:show, :update, :destroy]

  # GET /notes
  def index
    @notes = current_user.notes.page(params[:page] || 1)
    render json: {notes: @notes, currentPage: @notes.current_page, pageSize: @notes.count, total:  current_user.notes.count}
  end

  # GET /notes/1
  def show
    render json: @note
  end

  # POST /notes
  def create
    @note = current_user.notes.build(note_params)

    if @note.save
      render json: @note, status: :created, location: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def note_params
      params.permit(:title, :context)
    end
end
