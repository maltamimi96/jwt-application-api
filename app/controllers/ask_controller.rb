class AskController < ApplicationController
  before_action :set_question,only:[:show,:update,:destroy]

  
    def index
        @question =Question.all
        render json: @question
    end


    def create 
        @question=Question.create(question_params)
        if @question.errors.any?
            render json:@question.errors,status: :unprocessable_entity
        else
            render json:@question, status: 201

        end
    end


    def show
        render json: @question
    end

    def update
        @question.update(question_params)
        if @question.errors.any?
            render json:@question.errors,status: :unprocessable_entity
        else
            render json:@question, status: 201
        end
    end


    def destroy
        @question.delete
        render json:@question,status: 204
    end



    private
    def question_params
        params.require(:ask).permit(:category_id,:title,:body)
        #params.permit(:category_id,:title,:body)
    end

    def set_question
        begin
            @question = Question.find(params[:id])
        rescue 
            render json: {error:"Not Found"},status: 404
            
        end
    #its called before so render in method
    end




end
