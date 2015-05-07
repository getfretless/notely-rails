class API::V1::NotesController < API::V1::APIController
  before_action :authorize_api_key

  def index
    @notes = current_api_user.notes
  end

  def show
    @note = current_api_user.notes.find params[:id]
  end

  def create
    @note = current_api_user.notes.new note_params
    if @note.save
      render :show
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :body_html, :body_text)
  end

end
