function image_game = generate_image_game ( pic_length , data )
    image_grass = imread ( "grass.png" ) ;
    image_question = imread ( "question.png" ) ;
    image_flag = imread ( "flag.png" ) ;
    image_bomb = imread ( "bomb.png" ) ;
    image_zero = imread ( "zero.png" ) ;
    image_one = imread ( "one.png" ) ;
    image_two = imread ( "two.png" ) ;
    image_three = imread ( "three.png" ) ;
    image_four = imread ( "four.png" ) ;
    image_five = imread ( "five.png" ) ;
    image_six = imread ( "six.png" ) ;
    image_seven = imread ( "seven.png" ) ;
    image_eight = imread ( "eight.png" ) ;
    
    for i = 1 : data . row
        for j = 1 : data . col
            if ( data . flag ( i + 1 , j + 1 ) == 1 )
                image_game ( 1 + ( i - 1 ) * pic_length : pic_length + ( i - 1 ) * pic_length , 1 + ( j - 1 ) * pic_length : pic_length + ( j - 1 ) * pic_length , : ) ...
                = image_flag ;
            elseif ( data . number ( i + 1 , j + 1 ) == 99 && data .  click ( i + 1 , j + 1 ) == 1 )
                image_game ( 1 + ( i - 1 ) * pic_length : pic_length + ( i - 1 ) * pic_length , 1 + ( j - 1 ) * pic_length : pic_length + ( j - 1 ) * pic_length , : ) ...
                = image_bomb ;
            elseif ( data . number ( i + 1 , j + 1 ) == 0 && data .  click ( i + 1 , j + 1 ) == 1 )
                image_game ( 1 + ( i - 1 ) * pic_length : pic_length + ( i - 1 ) * pic_length , 1 + ( j - 1 ) * pic_length : pic_length + ( j - 1 ) * pic_length , : ) ...
                = image_zero ;
            elseif ( data . number ( i + 1 , j + 1 ) == 1 && data .  click ( i + 1 , j + 1 ) == 1 )
                image_game ( 1 + ( i - 1 ) * pic_length : pic_length + ( i - 1 ) * pic_length , 1 + ( j - 1 ) * pic_length : pic_length + ( j - 1 ) * pic_length , : ) ...
                = image_one ;
            elseif ( data . number ( i + 1 , j + 1 ) == 2 && data .  click ( i + 1 , j + 1 ) == 1 )
                image_game ( 1 + ( i - 1 ) * pic_length : pic_length + ( i - 1 ) * pic_length , 1 + ( j - 1 ) * pic_length : pic_length + ( j - 1 ) * pic_length , : ) ...
                = image_two ;
            elseif ( data . number ( i + 1 , j + 1 ) == 3 && data .  click ( i + 1 , j + 1 ) == 1 )
                image_game ( 1 + ( i - 1 ) * pic_length : pic_length + ( i - 1 ) * pic_length , 1 + ( j - 1 ) * pic_length : pic_length + ( j - 1 ) * pic_length , : ) ...
                = image_three ;
            elseif ( data . number ( i + 1 , j + 1 ) == 4 && data .  click ( i + 1 , j + 1 ) == 1 )
                image_game ( 1 + ( i - 1 ) * pic_length : pic_length + ( i - 1 ) * pic_length , 1 + ( j - 1 ) * pic_length : pic_length + ( j - 1 ) * pic_length , : ) ...
                = image_four ;
            elseif ( data . number ( i + 1 , j + 1 ) == 5 && data .  click ( i + 1 , j + 1 ) == 1 )
                image_game ( 1 + ( i - 1 ) * pic_length : pic_length + ( i - 1 ) * pic_length , 1 + ( j - 1 ) * pic_length : pic_length + ( j - 1 ) * pic_length , : ) ...
                = image_five ;
            elseif ( data . number ( i + 1 , j + 1 ) == 6 && data .  click ( i + 1 , j + 1 ) == 1 )
                image_game ( 1 + ( i - 1 ) * pic_length : pic_length + ( i - 1 ) * pic_length , 1 + ( j - 1 ) * pic_length : pic_length + ( j - 1 ) * pic_length , : ) ...
                = image_six ;
            elseif ( data . number ( i + 1 , j + 1 ) == 7 && data .  click ( i + 1 , j + 1 ) == 1 )
                image_game ( 1 + ( i - 1 ) * pic_length : pic_length + ( i - 1 ) * pic_length , 1 + ( j - 1 ) * pic_length : pic_length + ( j - 1 ) * pic_length , : ) ...
                = image_seven ;
            elseif ( data . number ( i + 1 , j + 1 ) == 8 && data .  click ( i + 1 , j + 1 ) == 1 )
                image_game ( 1 + ( i - 1 ) * pic_length : pic_length + ( i - 1 ) * pic_length , 1 + ( j - 1 ) * pic_length : pic_length + ( j - 1 ) * pic_length , : ) ...
                = image_eight ;
            else
                image_game ( 1 + ( i - 1 ) * pic_length : pic_length + ( i - 1 ) * pic_length , 1 + ( j - 1 ) * pic_length : pic_length + ( j - 1 ) * pic_length , : ) ...
                = image_question ;
            end
        end
    end
end