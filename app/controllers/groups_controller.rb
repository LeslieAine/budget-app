class GroupsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @groups = @user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    @group.user = current_user

    if @group.save
      flash[:success] = 'Category created successfully'
      redirect_to root_path
    else
      flash[:danger] = 'Category could not be created'
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
