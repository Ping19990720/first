%% �ˬd�C���O�_����
function signal = check ( data )
    gameover = gameover_signal ( data ) ;
    win = win_signal ( data ) ;
    
    if ( gameover )
        signal = "gameover" ;
    elseif ( win )
        signal = "win" ;
    else
        signal = "none" ;
    end
end
%% �ˬd gameover �禡
function signal = gameover_signal ( data )
    signal = false ;

    for i = 2 : data . row + 1
        for j = 2 : data . col + 1
            if ( data . number ( i , j ) == 99 && data . click ( i , j ) == 1 )
                signal = true ;
            end
        end
    end
end
%% �ˬd win �禡
function signal = win_signal ( data )
    signal = true ;
    
    for i = 2 : data . row + 1
        for j = 2 : data . col + 1
            if ( data . number ( i , j ) ~= 99 && data . click ( i , j ) ~= 1 )
                signal = false ;
            end
        end % end for
    end % end for
end