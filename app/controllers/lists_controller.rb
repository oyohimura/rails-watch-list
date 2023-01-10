class ListsController < ApplicationController
  before_action :all_lists, only: [:index]
  before_action :find_list, only: [:show]

  def index; end

  def show; end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @list = List.new
  end

  private

  def all_lists
    @lists = List.all
  end

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :poster)
  end
end
