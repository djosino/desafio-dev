class Api::DocumentsController < Api::ApiController
  def index
    @documents = current_user.documents.with_attached_file.order(:id)
  end

  def show
    @document = current_user.documents.find(params[:id])
    @transactions = @document.transactions.where(show_params).includes(:transaction_type).order(:id)
  end

  def create
    @document = Document.new(document_params)

    return if @document.save

    return render_error(@document.errors.full_messages, status: :unprocessable_entity)
  end

  private

  # Only allow a list of trusted parameters through.
  def document_params
    params.require(:document)
          .permit(:file)
          .merge(user: current_user)
  end

  def show_params
    return {} if params[:store].blank?

    params.permit(:store)
  end
end
