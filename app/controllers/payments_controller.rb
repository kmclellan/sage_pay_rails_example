class PaymentsController < InheritedResources::Base

  def release
    if resource.release
      flash[:notice] = "Deferred payment successfully released."
    else
      flash[:error] = "Deferred payment failed to release: #{resource.response.status} - #{resource.response.status_detail}"
    end
    redirect_to resource
  end
end
