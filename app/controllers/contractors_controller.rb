class ContractorsController < ApplicationController
  def new
    @user = User.find_by(params[:id])
    @contractor = Contractor.new
  end

  def create
    @user = current_user
    @contractor = @user.build_contractor(contractor_params)
    if @contractor.save
      redirect_to @contractor, notice: 'Your contractor profile has been uploaded. The business should start pouring in any minute now. 👍'
    else
      render :new
    end
  end

  def index
    @contractors = Contractor.all
  end

  def show
    @contractor = Contractor.find(params[:id])
  end

  def edit
    @contractor = Contractor.find(params[:id])
  end

  def update
    @contractor = Contractor.find(params[:id])
    if @contractor.update(contractor_params)
      redirect_to @contractor, notice: 'Your contractor profile has been updated.'
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
  end

  private

  def contractor_params
    params.require(:contractor).permit(:business_name, :description, :city)
  end

end
