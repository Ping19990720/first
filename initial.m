%% ��l�ƹC���A row ���C�����C�ơA col ���C������ơA total_number_of_bomb ���`���u��
function data = initial ( row , col , total_number_of_bomb )
    %% �ˬd�C�������u�O�_�L�h
    if ( total_number_of_bomb >= row * col )
        error ( "��J�����u�ƶq�L�h" )
    end
    %%  �إ߹C���һݪ��򥻸��
    %% number �O���Ӥ��P�򪺬��u�ơA�Y�Y��檺�ƭȬ�99�A�h�����u
    %% flag �O�����O�_���X�l�A 1 ���w�g���X�A 0 �������X
    %% click �O�����O�_�ȶ}�A 1 ���ȶ}�A 0 �����ȶ}
    %% row ���C���`�ơA col ���檺�`�ơA total_number_of_bomb ���`���u��
    data = struct ( "number" , zeros ( row + 2 , col + 2 ) , "flag" , zeros ( row + 2 , col + 2 ) , ...
                    "click" , zeros ( row + 2 , col + 2 ) , "row" , row , "col" , col , ...
                    "total_number_of_bomb" , total_number_of_bomb ) ;
    %% �]�w��� ( ��ɪ� number �B flag �M click �ƭȬҬ� 777 )            
    data = set_boundary ( data ) ;
    %% ��J���u��m
    data = set_bomb ( data ) ;
    %% ��J�P�򬵼u���ƶq
    data = set_number ( data ) ;
end 
%% �]�w��� ( ��ɪ� number �B flag �M click �ƭȬҬ� 777 )  
function data = set_boundary ( data )
    boundry_number = 777 ;
    data . number ( [ 1 data . row + 2 ] , : ) = boundry_number ;
    data . number ( : , [ 1 data . col + 2 ] ) = boundry_number ;
    data . flag ( [ 1 data . row + 2 ] , : ) = boundry_number ;
    data . flag ( : , [ 1 data . col + 2 ] ) = boundry_number ;
    data . click ( [ 1 data . row + 2 ] , : ) = boundry_number ;
    data . click ( : , [ 1 data . col + 2 ] ) = boundry_number ;
end
%% ��J���u��m
function data = set_bomb ( data )
    number_of_bomb = 0 ;
    
    while ( number_of_bomb < data . total_number_of_bomb )
        random_row = randi ( [ 2 , data . row + 1 ] ) ;
        random_col = randi ( [ 2 , data . col + 1 ] ) ;

        if ( data . number ( random_row , random_col ) ~= 99 )
            data . number ( random_row , random_col ) = 99 ;
            number_of_bomb = number_of_bomb + 1 ;
        end
    end
end
%% ��J�P�򬵼u���ƶq
function data = set_number ( data )
    for i = 2 : data . row + 1
        for j = 2 : data . col + 1
            if ( data . number ( i , j ) == 99 )
                continue ;
            else
                data . number ( i , j ) = calculate_bomb ( data , i , j ) ;
            end
        end % end for
    end % end for
end
%% �p��P�򬵼u�ƶq
function number_of_surrounded_bomb = calculate_bomb ( data , current_row , current_col )
    number_of_surrounded_bomb = 0 ;
    
    for i = current_row - 1 : current_row + 1
        for j = current_col - 1 : current_col + 1
            if ( ( i == current_row && j == current_col ) || data . number ( i , j ) ~= 99 )
                continue ;
            else
                number_of_surrounded_bomb = number_of_surrounded_bomb + 1 ;
            end
        end % end for
    end % end for
end