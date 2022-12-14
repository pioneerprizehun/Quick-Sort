unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure QuickSort(var A: array of Integer; iLow, iHigh: Integer) ;
 var
   Low, High, Pivot, Temp: Integer;
 begin
   Low := iLow;
   High := iHigh;
   Pivot := A[(Low + High) div 2]; //제일낮은값 + 제일높은값 / 2
   repeat
     while A[Low] < Pivot do Inc(Low) ;  //제일낮은값보다 피벗값이 높을경우 왼쪽으로
     while A[High] > Pivot do Dec(High) ;//제일높은값보다 피벗값이 낮을경우 오른쪽으로
     if Low <= High then //제일낲은값이 제일높은값보다 같거나 낮을경우
     begin
       Temp := A[Low];
       A[Low] := A[High];
       A[High] := Temp;
       Inc(Low) ;
       Dec(High) ;
     end;
   until Low > High;
   if High > iLow then QuickSort(A, iLow, High) ;
   if Low < iHigh then QuickSort(A, Low, iHigh) ;
 end;

procedure TForm1.Button1Click(Sender: TObject);
var
intArray : array of integer;
I: Integer;
begin
   SetLength(intArray,1001) ;


   randomize;
   for I := 0 to 1000 do
    IntArray[i] := random(1000); //랜덤함수추출 1~10은 똑같은값이 여러개나와서 100개로변경


   QuickSort(intArray, Low(intArray), High(intArray)) ;

//    Memo1.Text := IntToStr(intArray[1]) + ',' + IntToStr(IntArray[2]) + ','+ IntToStr(IntArray[3]) + ','
//    + IntToStr(IntArray[4]) + ','+ IntToStr(IntArray[5]) + ','+ IntToStr(IntArray[6]) + ','+ IntToStr(IntArray[7]) + ','
//    + IntToStr(IntArray[8]) + ','+ IntToStr(IntArray[9]) + ','+ IntToStr(IntArray[10]);


    for i := Low(intArray) to High(intArray) do

    begin
      Memo1.Text :=  Memo1.Text + IntToStr(intArray[i]) + ' ';
    end;



end;

procedure TForm1.Button2Click(Sender: TObject);

begin
Memo1.Clear;
end;

end.
