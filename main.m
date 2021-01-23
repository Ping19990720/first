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
    mode = input ( "1�G�I��l�B2�G���X/�������X------" ) ;
    
    if ( mode == 1 )
        row = input ( "��J�C:" ) ;
        col = input ( "��J��:" ) ;
        data = use_click ( data , row , col ) ;
        data = spread ( data ) ;
        signal = check ( data ) ;
    elseif ( mode == 2 )
        row = input ( "��J�C:" ) ;
        col = input ( "��J��:" ) ;
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
        disp ( "��J����m�W�X���d��" ) ;
    elseif ( floor ( click_row ) ~= click_row || floor ( click_col ) ~= click_col )
        disp ( "��J����m�������" ) ;
    elseif ( data . click ( click_row + 1 , click_col + 1 ) == 1 )
        disp ( "����w�g�ȶ}" ) ;
    elseif ( data . flag ( click_row + 1 , click_col + 1 ) == 1 )
        disp ( "����w�g���W�X�l" ) ;
    else
        data . click ( click_row + 1 , click_col + 1 ) = 1 ;
    end
end
%% Let user put flag
function data = use_flag ( data , flag_row , flag_col )
    if ( flag_row < 1 || flag_row > data . row || flag_col < 1 || flag_col > data . col )
        disp ( "��J����m�W�X���d��" ) ;
    elseif ( floor ( flag_row ) ~= flag_row || floor ( flag_col ) ~= flag_col )
        disp ( "��J����m�������" ) ;
    elseif ( data . click ( flag_row + 1 , flag_col + 1 ) == 1 )
        disp ( "����w�g�ȶ}" ) ;
    elseif ( data . flag ( flag_row + 1 , flag_col + 1 ) == 1 )
        data . flag ( flag_row + 1 , flag_col + 1 ) = 0 ;
    else
        data . flag ( flag_row + 1 , flag_col + 1 ) = 1 ;
    end
end