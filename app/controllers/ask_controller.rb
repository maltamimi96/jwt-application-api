class AskController < ApplicationController
  before_action :set_question,only:[:show]
  
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





    private
    def question_params
        params.require(:question).permit(:category_id,:title,:body)
    end
    def set_question
        @question = Question.find(params[:id])
    #its called before so render in method
    end




end
