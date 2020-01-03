class ApplicationController < ActionController::API
    # maybe write your auth methods like JWT stuff in here
    # such as encode, decode, current user, logged_in?


    def encode_token(userId)
        JWT.encode("#{userId}", 'sarah mclachlan')
    end

    def decode_token(token)
        begin
            JWT.decode(token, 'sara mclachlan')[0]
        rescue JWT::DecodeError
            nil
        end
    end
        
    def auth_header
        # { Authorization: 'Bearer <token>' }
        request.headers['Authorization']
    end
end
