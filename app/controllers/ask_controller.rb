class AskController < ApplicationController
    before_action :authenticate_user,except:[:index,:show]
    before_action :set_question,only:[:show]
    before_action :check_ownership,only: [:update,:destroy]
  
    def index
        @question =Question.all
        render json: @question
    end


    def create 
        @question=current_user.questions.create(question_params)
        if @question.errors.any?
            render json:@question.errors,status: :unprocessable_entity
        else
            render json:@question, status: 201

        end
    end


    def show
        render json: @question.transform_question
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
    render json: 204
    end

    def my_questions
    end



    private
    def question_params
        params.require(:ask).permit(:user_id,:category_id,:title,:body)
    end
    def set_question
        @question = Question.find(params[:id])
    #its called before so render in method
    end


    
    def check_ownership
        if current_user.id !=@question.user.id
            render json:{error:"no permission"},status:401
        end 
    end


end
