# frozen_string_literal: true

# DocumentsController
class DocumentsController < ApplicationController
  before_action :set_document, only: %i[show]

  # GET /documents or /documents.json
  def index
    @documents = current_user.documents.with_attached_file.order(:id)
  end

  # GET /documents/1 or /documents/1.json
  def show
    @transactions = @document.transactions.where(show_params).includes(:transaction_type).order(:id)
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # POST /documents or /documents.json
  def create
    @document = Document.new(document_params)

    if @document.save
      redirect_to document_url(@document), notice: 'Document was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_document
    @document = current_user.documents.find(params[:id])
  end

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
