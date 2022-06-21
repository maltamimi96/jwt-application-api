class QuestionsController < ApplicationController
    before_action :authenticate_user,except:[:index,:show]
    before_action :set_question,only:[:show, :update, :destroy]
    #before_action :check_ownership,only: [:update, :destroy]
  
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
        if @question
          render json: @question.transform_question
        else
          render json: {"error": "Question not found, wrong id"}, status: :not_found
        end
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
        @question.destroy
        render json: 204
    end


    private
    def question_params
        params.require(:question).permit(:user_id,:category_id,:title,:body)
    end
    def set_question
        @question = Question.find_by_id(params[:id])
    #its called before so render in method
    end

    def check_ownership
        if current_user.id !=@question.users.id
            render json:{error:"no permission"},status:401
        end 
    end


end
