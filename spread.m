%% ���}�A�y�ЬO�H�}�o�̪����D
function data = spread ( data )
    one_round_hange = true ;
    %% �ˬd�i�_���}
    while ( one_round_hange )
        one_round_hange = false ;
        for i = 2 : data . row + 1
            for j = 2 : data . col + 1
                [ data , change ] = zero_surround ( data , i , j ) ;

                if ( change )
                    one_round_hange = true ;
                end
            end % end for
        end % end for
    end % end while
end
%% �ˬd�P��O�_���Ʀr��0�A�B�w�ȶ}����l�A�y�ЬO�H�}�o�̪����D
function [ data , change ] = zero_surround ( data , current_row , current_col )
    change = false ;
    if ( data . click ( current_row , current_col ) == 0 && data . flag ( current_row , current_col ) == 0 )
        for i = current_row - 1 : current_row + 1
            for j = current_col - 1 : current_col + 1
                if ( data . number ( i , j ) == 0 && data . click ( i , j ) == 1 )
                    data . click ( current_row , current_col ) = 1 ;
                    change = true ;
                end
            end % end for
        end % end for
    end % end if
end