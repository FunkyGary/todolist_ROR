class TodolistsController < ApplicationController
  before_action :set_todolist, :only => [:edit, :update, :destroy]
  def index
    @todolists = Todolist.all
  end

  def new
    @todolist = Todolist.new
  end

  def create
    @todolist = Todolist.new(todolist_params)
    # binding.pry
    if @todolist.save
      redirect_to todolists_url
    else
      render :action => :new
    end
  end


  def update
    if @todolist.update(todolist_params)
      # .update(description: 'qwer', title: 'wer32r', date: '132r12f')
      redirect_to todolists_url
    else
      # render action: :edit
      render :action => :edit
    end
  end



  def destroy
    # binding.pry
    @todolist.destroy

    redirect_to todolists_url
  end

  private

  def set_todolist
    @todolist = Todolist.find(params[:id])
  end

  def todolist_params
    # todolist_params = {
    #   todolist:
    # }
    # {
    #     title: '1234145',
    #     description: '1234',
    #     date: '2018-6-1'
    #   }
    # params[:title]
    #
    # {
    #   'title' => '12341234'
    # }
    #
    # params['title']

    params.require(:todolist).permit(:title, :description, :date)
  end

end
