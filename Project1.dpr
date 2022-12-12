unit Work2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Samples.Spin, Vcl.ToolWin, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    SX0: TShape;
    SY0: TShape;
    SPoint: TShape;
    SECoordY: TSpinEdit;
    SECoordX: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    LResult: TLabel;
    Shape10: TShape;
    procedure SECoordXChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.SECoordXChange(Sender: TObject);
var
	X, Y : byte;
begin    LResult.Font.Color:=clRed;
    X := SECoordX.Value;
    Y := SECoordY.Value;
         // первый круг (Shape 1)
    if ((X >= 5)and(X <= 10)and(Y >= 5)and(Y <= 10)and
         (Sqr(X - 10) + Sqr(Y-10) <= 25))or
    // второй круг (Shape 2)
         ((X >= 15)and(X <= 20)and(Y >= 5)and(Y <= 10)and
          (Sqr(X - 15) + Sqr(Y-10) <= 25))or
    // третий круг (Shape 3)
         ((X >= 15)and(X <= 20)and(Y >= 15)and(Y <= 20)and
          (Sqr(X - 15) + Sqr(Y-15) <= 25))or
    // четвертый круг (Shape 4)
     ((X >= 5)and(X <= 10)and(Y >= 15)and(Y <= 20)and
          (Sqr(X - 10) + Sqr(Y-15) <= 25))or
    // первый квадрат (Shape 5)
     ((X >= 5)and(X <= 10)and(Y >= 10)and(Y <= 15))or
    // второй квадрат (Shape 6)
     ((X >= 10)and(X <= 15)and(Y >= 5)and(Y <= 10))or
    // третий квадрат (Shape 7)
     ((X >= 15)and(X <= 20)and(Y >= 10)and(Y <= 15))or
  // четвертый квадрат (Shape 8)
     ((X >= 10)and(X <= 15)and(Y >= 15)and(Y <= 20))
    then
    begin
    // попадание в фигуру (отображаем зеленым цветом)
       LResult.Font.Color := clGreen;
       LResult.Caption := 'Попала';
    end
    else
    begin
    // не попадание в фигуру (отображаем красным цветом)
       LResult.Font.Color := clRed;
       LResult.Caption := 'Не попала';
    end;
  // передвигаем «точку» в выбранные координаты
  // начало координат определяется свойствами Left и Top элементов
  // осей координат SX0 и SY0 соответственно. Шаг попиксельно
  // рассчитываем, зная ширину и высоту квадратика Shape6,
  // умноженную на введенные значения X и Y
  // учитываем направление изменения координат X – слева-направо
  // Y – сверху-вниз
    SPoint.Left := SX0.Left + X * Shape6.Width div 5 - (SPoint.Width div 2);
                SPoint.Top := SY0.Top - Y * Shape6.Height div 5 - (SPoint.Height div 2);
           end;

end.
