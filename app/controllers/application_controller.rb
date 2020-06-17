class ApplicationController < ActionController::API
    # maybe write your auth methods like JWT stuff in here
    # such as encode, decode, current user, logged_in?


    def encode_token(userId)
        JWT.encode("#{userId}", 'sarah mclachlan')
    end

    def decode_token
        if auth_header
            token = auth_header.split(' ')[1]
            # puts "the token at this point: #{token}"
            begin
                JWT.decode(token, 'sarah mclachlan')[0]
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decode_token
            # puts "here is the decoded token: #{decoded_token}"
            user_id = decode_token.to_i
            @user = User.find_by(id: user_id)
        end
    end
        
    def auth_header
        # { Authorization: 'Bearer <token>' }
        request.headers['Authorization']
    end
end


# tempArry = list_of_directors(source)
# total = 0

# tempArry.each{|name| total += gross_for_director(name)}