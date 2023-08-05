class ReviewsController < ApplicationController
    before_action :set_product, only: [:index, :create]
    before_action :authenticate_user!
  
    def index
      @reviews = @product.reviews
      render json: @reviews
    end
  
    def create
      @review = @product.reviews.new(review_params)
      @review.user = current_user
      
      if @review.save
        render json: @review, status: :created
      else
        render json: @review.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def set_product
      @product = Product.find(params[:product_id])
    end
  
    def review_params
      params.require(:review).permit(:product_id, :user_id, :rating, :review_text, :user_name)
    end

    def update_product_rating
        total_rating = @product.reviews.sum(:rating)
        average_rating = total_rating.to_f / @product.reviews.count
        @product.update(average_rating: average_rating)
    end

  end
  