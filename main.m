%% clean everything
clc ;
clear all ;
close all ;
%% main
signal = "none" ;
data = initial ( 5 , 5 , 3 ) ;
while ( signal == "none" )
    clc ;
    image_game = generate_image_game ( 300 , data ) ;
    imshow ( image_game ) ;
    mode = input ( "1：點格子、2：插旗/取消插旗------" ) ;
    
    if ( mode == 1 )
        row = input ( "輸入列:" ) ;
        col = input ( "輸入行:" ) ;
        data = use_click ( data , row , col ) ;
        data = spread ( data ) ;
        signal = check ( data ) ;
    elseif ( mode == 2 )
        row = input ( "輸入列:" ) ;
        col = input ( "輸入行:" ) ;
        data = use_flag ( data , row , col ) ;
        signal = check ( data ) ;
    end
end

if ( signal == "win" )
    disp ( "win!win!win!" ) ;
    image_game = generate_image_game ( 300 , data ) ;
    imshow ( image_game ) ;
elseif ( signal == "gameover" )
    disp ( "lose!lose!lose!" ) ;
    image_game = generate_image_game ( 300 , data ) ;
    imshow ( image_game ) ;
end

%% Let user click block
function data = use_click ( data , click_row , click_col )
    if ( click_row < 1 || click_row > data . row || click_col < 1 || click_col > data . col )
        disp ( "輸入的位置超出方格範圍" ) ;
    elseif ( floor ( click_row ) ~= click_row || floor ( click_col ) ~= click_col )
        disp ( "輸入的位置不為整數" ) ;
    elseif ( data . click ( click_row + 1 , click_col + 1 ) == 1 )
        disp ( "此格已經掀開" ) ;
    elseif ( data . flag ( click_row + 1 , click_col + 1 ) == 1 )
        disp ( "此格已經插上旗子" ) ;
    else
        data . click ( click_row + 1 , click_col + 1 ) = 1 ;
    end
end
%% Let user put flag
function data = use_flag ( data , flag_row , flag_col )
    if ( flag_row < 1 || flag_row > data . row || flag_col < 1 || flag_col > data . col )
        disp ( "輸入的位置超出方格範圍" ) ;
    elseif ( floor ( flag_row ) ~= flag_row || floor ( flag_col ) ~= flag_col )
        disp ( "輸入的位置不為整數" ) ;
    elseif ( data . click ( flag_row + 1 , flag_col + 1 ) == 1 )
        disp ( "此格已經掀開" ) ;
    elseif ( data . flag ( flag_row + 1 , flag_col + 1 ) == 1 )
        data . flag ( flag_row + 1 , flag_col + 1 ) = 0 ;
    else
        data . flag ( flag_row + 1 , flag_col + 1 ) = 1 ;
    end
end