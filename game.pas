PROGRAM Main;
USES
 GRAPHABC, ABCOBJECTS;
  
VAR
  StartBtn: PictureABC;
  //Rules: PictureABC;
  isWating: boolean;
  CowBoy: PictureABC;
  Cowboy2: PictureABC;
  //Pulya: PictureABC;
  k: char;
  
//----------- ОПЕРЕЖАЮЩИЕ СОБЫТИЯ  --------------------
PROCEDURE GameWnd; FORWARD;


//-----------  стартовое окно --------------------
PROCEDURE StartClick(X, Y, MB: INTEGER);
BEGIN
  IF(MB = 1) AND (StartBtn.Ptinside(X,Y))
  THEN
    BEGIN
      StartBtn.Destroy;
      //Rules.Destroy;
      CLEARWINDOW;
      isWating := FALSE;
      GameWnd;
    END;
END;
PROCEDURE StartWnd; 
BEGIN
  SETWINDOWSIZE(800,900);
  CENTERWINDOW;
  //Rules := NEW PictureABC;
  Window.Load('IMAGES/phon.png');
  StartBtn := NEW PictureABC(290, 240, 'IMAGES\button.png');
  OnMouseDown := StartClick 
END;

//-----------  окно ждуна --------------------
PROCEDURE Wait;
BEGIN
  isWating := TRUE;
  WHILE isWating
  DO
END;


//-----------  игровое окно --------------------
PROCEDURE GamePress(Key: CHAR);
BEGIN
  CASE K OF
  'W': Window. := window. - 2;
  'S': window. := window. + 2
END;


PROCEDURE GameClick(X, Y, MB: INTEGER);
BEGIN
     
END;

PROCEDURE GameWnd;
BEGIN
  Window.Load('IMAGES/GamePhon.png');
  
  cowboy := NEW PictureABC(50,100, 'IMAGES/CowBoy.png');
  cowboy2 := NEW PictureABC(730,100, 'IMAGES/CowBoy2.png');
  //pulya := NEW PictureABC(X,Y, 'IMAGES/pulya');
  OnMouseDown := GameClick;     //обработчик события нажатия на кнопку мыши
  OnKeyDown := GamePress        //обработчик события нажатия на клавиатуру     
END;  
  
//-----------  механики --------------------  
PROCEDURE GameProcess;
BEGIN
  OnMouseDown := GameClick;     //обработчик события нажатия на кнопку мыши
  OnKeyDown := GamePress        //обработчик события нажатия на клавиатуру    
END;
  
//-----------  финальное окно --------------------
PROCEDURE FinalClick(X, Y, MB: INTEGER);
BEGIN
     
END;

PROCEDURE FinalWnd;
BEGIN
     //фон, итог игры
  OnMouseDown := FinalClick     //обработчик события нажатия на кнопку
END;
  
//---------------тело программы------------------------------   
BEGIN {Main}
  StartWnd;
  Wait;
  GameProcess
  
END. {Main}