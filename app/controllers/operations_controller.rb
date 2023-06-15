class OperationsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @operations = @group.operations
  end

  def new
    @group = Group.find(params[:group_id])
    @operation = Operation.new
  end

  def create
    @group = Group.find(params[:group_id])
    @operation = Operation.new(operation_params)
    @operation.author_id = current_user.id
    @operation.groups << @group

    if @operation.save
      flash[:success] = 'Transaction created successfully'
      redirect_to group_operations_path
    else
      flash[:danger] = 'Transaction could not be created'
    end
  end

  def destroy
    @operation = Operation.find(params[:id])
    @operation.destroy

    flash[:notice] = 'Transaction has been successfully deleted'
    redirect_to group_operations_path
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount, group_ids: [])
  end
end
