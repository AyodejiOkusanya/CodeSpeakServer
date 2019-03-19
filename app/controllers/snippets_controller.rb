class SnippetsController < ApplicationController

    def create 
        @user = get_current_user 
        @snippet = Snippet.create(user_id:@user.id, codesnippet:params[:snippet])
        render json: @snippet
    end
end
