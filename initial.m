%% 初始化遊戲， row 為遊戲的列數， col 為遊戲的行數， total_number_of_bomb 為總炸彈數
function data = initial ( row , col , total_number_of_bomb )
    %% 檢查遊戲的炸彈是否過多
    if ( total_number_of_bomb >= row * col )
        error ( "輸入的炸彈數量過多" )
    end
    %%  建立遊戲所需的基本資料
    %% number 記錄該方格周圍的炸彈數，若某方格的數值為99，則為炸彈
    %% flag 記錄方格是否插旗子， 1 為已經插旗， 0 為未插旗
    %% click 記錄方格是否掀開， 1 為掀開， 0 為未掀開
    %% row 為列的總數， col 為行的總數， total_number_of_bomb 為總炸彈數
    data = struct ( "number" , zeros ( row + 2 , col + 2 ) , "flag" , zeros ( row + 2 , col + 2 ) , ...
                    "click" , zeros ( row + 2 , col + 2 ) , "row" , row , "col" , col , ...
                    "total_number_of_bomb" , total_number_of_bomb ) ;
    %% 設定邊界 ( 邊界的 number 、 flag 和 click 數值皆為 777 )            
    data = set_boundary ( data ) ;
    %% 填入炸彈位置
    data = set_bomb ( data ) ;
    %% 填入周圍炸彈的數量
    data = set_number ( data ) ;
end 
%% 設定邊界 ( 邊界的 number 、 flag 和 click 數值皆為 777 )  
function data = set_boundary ( data )
    boundry_number = 777 ;
    data . number ( [ 1 data . row + 2 ] , : ) = boundry_number ;
    data . number ( : , [ 1 data . col + 2 ] ) = boundry_number ;
    data . flag ( [ 1 data . row + 2 ] , : ) = boundry_number ;
    data . flag ( : , [ 1 data . col + 2 ] ) = boundry_number ;
    data . click ( [ 1 data . row + 2 ] , : ) = boundry_number ;
    data . click ( : , [ 1 data . col + 2 ] ) = boundry_number ;
end
%% 填入炸彈位置
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
%% 填入周圍炸彈的數量
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
%% 計算周圍炸彈數量
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