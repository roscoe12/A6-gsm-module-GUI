unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LazSerial, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, RackCtls,LazSerialSetup;

type

  { TForm1 }

  TForm1 = class(TForm)
    devSelected: TCheckBox;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LazSerial1: TLazSerial;
    LEDDisplay1: TLEDDisplay;
    Memo1: TMemo;
    Memo2: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
     procedure devSelectedChange(Sender: TObject);
     procedure Edit4Change(Sender: TObject);
     procedure FormCreate(Sender: TObject);
    procedure LazSerial1RxData(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);

  private

  public

  end;
const
  CZ = #$01a;
  CR = #$0d;
  LF = #$0a;
  CRLF = CR+LF;
var
  Form1: TForm1;


implementation

{$R *.lfm}

{ TForm1 }





procedure TForm1.FormCreate(Sender: TObject);
begin
  if FileExists('/dev/ttyUSB0')then
  Edit1.Text := '/dev/ttyUSB0';
  Edit2.Text := '115200';
end;

procedure TForm1.devSelectedChange(Sender: TObject);
begin

end;

procedure TForm1.Edit4Change(Sender: TObject);
begin

end;

procedure TForm1.LazSerial1RxData(Sender: TObject);
var
  readSize: Integer;
begin
  readSize :=  sizeof(LazSerial1.synser.WaitingData);
  LedDisplay1.Value := LedDisplay1.Value + readSize;
  Memo1.Lines.Add(LazSerial1.ReadData);
end;

procedure TForm1.SpeedButton10Click(Sender: TObject);
begin
   if devSelected.Checked then
  begin
    lazSerial1.WriteData('AT+CCID'+CR);
    Memo2.Lines.Clear;
    Memo2.Font.Color := clYellow;
    Memo2.Lines.Add('Sending--->AT+CCID->Sim check');
  end
  else
  begin
    Memo2.Lines.Clear;
    Memo2.Font.Color := clRed;
    Memo2.Lines.Add('Error--->Port not Open');
  end;
end;

procedure TForm1.SpeedButton11Click(Sender: TObject);
begin
  if devSelected.Checked then
  begin
    lazSerial1.WriteData('AT+CSQ'+CR);
    Memo2.Lines.Clear;
    Memo2.Font.Color := clYellow;
    Memo2.Lines.Add('Sending--->AT+CSQ->Signal Quality');
  end
  else
  begin
    Memo2.Lines.Clear;
    Memo2.Font.Color := clRed;
    Memo2.Lines.Add('Error--->Port not open');
  end;
end;

procedure TForm1.SpeedButton12Click(Sender: TObject);
begin
  if Edit5.Text = 'Text Message' then
  begin
    Memo2.Lines.Clear;
    Memo2.Font.Color := clRed;
    Memo2.Lines.Add('Error--->Enter text');
  end
  else
  with LazSerial1 do
  begin
    WriteData('AT+CMGS='+Edit4.Text+CR);
    Memo2.Lines.Clear;
    Memo2.Font.Color :=clRed;
    Memo2.Lines.Add('Sending--->AT+CMGS->Text Message');
  end;
end;

procedure TForm1.SpeedButton13Click(Sender: TObject);
begin
  with LazSerial1 do
  begin
    WriteData(Edit5.Text);
    WriteData(CZ);
    WriteData(CR);
  end;
end;

procedure TForm1.SpeedButton14Click(Sender: TObject);
begin
  if devSelected.Checked then
  begin
    LazSerial1.WriteData('AT+COPS=?'+CR);
    Memo2.Lines.Clear;
    Memo2.Font.Color := clYellow;
    Memo2.Lines.Add('Sending--->AT+COPS=?');
  end
  else
  with Memo2 do
  begin
    Lines.Clear;
    Font.Color := clRed;
    Lines.Add('Error--->Port not open');
  end;
end;

procedure TForm1.SpeedButton15Click(Sender: TObject);
begin
  if devSelected.Checked then
  begin
    LazSerial1.WriteData('AT+COPS?'+CR);
    Memo2.Lines.Clear;
    Memo2.Font.Color := clYellow;
    Memo2.Lines.Add('Sending--->AT+COPS?');
  end
  else
  with Memo2 do
  begin
    Lines.Clear;
    Font.Color := clRed;
    Lines.Add('Error--->Port not open.');
  end;
end;

procedure TForm1.SpeedButton17Click(Sender: TObject);
begin
  if devSelected.Checked then
  begin
    LazSerial1.WriteData('AT+CNMI=1,2,0,0,0'+CR);
    Memo2.Lines.Add('--->Sending->AT+CNMI');
    end
  else
  with memo2 do
  begin
    Lines.Clear;
    Font.Color :=clRed;
    Lines.Add('Error--->Port not open');
  end;
end;

procedure TForm1.SpeedButton19Click(Sender: TObject);
begin
  if devSelected.Checked then
  begin
    LazSerial1.WriteData('AT+COPN=?'+CR);
    Memo2.Lines.Clear;
    Memo2.Font.Color := clYellow;
    Memo2.Lines.Add('Sending--->AT+COPN=?');
   end
  else
  with Memo2 do
  begin
    Lines.Clear;
    Font.Color := clRed;
    Lines.Add('Error--->No port open');
  end;
end;


procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if devSelected.Checked then
  begin
    LazSerial1.Device := Edit1.Text;
    LazSerial1.BaudRate := StrToBaudRate(Edit2.Text);
    LazSerial1.Open;
    Memo2.Lines.Clear;
    Memo2.Font.Color := clYellow;;
    Memo2.Lines.Add('Port '+Edit1.Text+' Open');
  end
  else
  begin
    Memo2.Lines.Clear;
    Memo2.Font.Color := clRed;
    Memo2.Lines.Add('Error--->No device selected');
  end;
end;

procedure TForm1.SpeedButton20Click(Sender: TObject);
begin
   if devSelected.Checked then
  begin
    lazSerial1.WriteData('AT+COPN?'+CR);
    Memo2.Lines.Clear;
    Memo2.Font.Color := clYellow;
    Memo2.Lines.Add('Sending--->AT+COPN?');
   end
  else
  with Memo2 do
  begin
    Lines.Clear;
    Font.Color := clRed;
    Lines.Add('Error--->No port open');
  end;
end;

procedure TForm1.SpeedButton21Click(Sender: TObject);
begin
  if devSelected.Checked then
  begin
    lazSerial1.WriteData('AT+CREG=?'+CR);
    Memo2.Lines.Clear;
    Memo2.Font.Color := clYellow;
    Memo2.Lines.Add('Sending--->AT+CREG=?');
   end
  else
  with Memo2 do
  begin
    Lines.Clear;
    Font.Color := clRed;
    Lines.Add('Error--->No port open');
  end;
end;

procedure TForm1.SpeedButton22Click(Sender: TObject);
begin
  if devSelected.Checked then
  begin
    LazSerial1.WriteData('AT+CREG?'+CR);
    Memo2.Lines.Clear;
    Memo2.Font.Color := clYellow;
    Memo2.Lines.Add('Sending--->AT+CREG?');
   end
  else
  with Memo2 do
  begin
    Lines.Clear;
    Font.Color := clRed;
    Lines.Add('Error--->No port open');
  end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  if not devSelected.Checked then
  begin
    Memo2.Lines.Clear;
    Memo2.Font.Color := clRed;
    Memo2.Lines.Add('Error--->Port not open');

    end
  else
  begin
    devSelected.Checked := False;
    CheckBox2.Checked := False;
    Memo1.Lines.Clear;
    Memo2.Lines.Clear;
    Memo2.Font.Color := clYellow;
    Memo2.Lines.Add('Port---> '+Edit1.Text+ ' Closed');
    LazSerial1.Close;
  end;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  if Edit3.Text > '' then
  begin
    LazSerial1.WriteData(Edit3.Text+CR);;
    Memo2.Lines.Clear;
    Memo2.Font.Color := clYellow;
    Memo2.Lines.Add('sending--->' +Edit3.Text);
  end
  else
  begin
    Memo2.Lines.Clear;
    Memo2.Font.Color := clRed;
    Memo2.Lines.Add('Error--->No Command');
   end;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
 LazSerial1.Close;
 Form1.Close;

end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  if devSelected.Checked then
  begin
    LazSerial1.WriteData('AT'+CR);
    Memo2.Font.Color := clYellow;
    Memo2.Lines.Add('Sending--->AT');
  end
  else
  with Memo2 do
  begin
    Lines.Clear;
    Font.Color := clRed;
    Lines.Add('Error--->No device connected');
  end;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
  if devSelected.Checked then
  begin
    LazSerial1.WriteData('AT+CPOF'+CR);
    Memo2.Font.Color:=clYellow;
    Memo2.Lines.Add('Sending--->AT+CPOF->Power Off');
  end
  else
  with Memo2 do
  begin
    Lines.Clear;
    Font.Color := clRed;
    Lines.Add('Error--->No device selected.');
  end;

end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
var
  pNum: String;
begin
  pNum := '"'+Edit4.Text+'"';
  if devSelected.Checked then
  begin
    if Edit4.Text = 'Phone Number'then
      Memo2.Lines.Clear;
      Memo2.Font.Color := clRed;
      Memo2.Lines.Add('Error--->No Phone number');

    if Edit4.Text <> 'Phone Number'then
      LazSerial1.WriteData('ATD='+pNum+CR);
      Memo2.Font.Color := clYellow;
      Memo2.Lines.Add('Dialing--->'+pNum);
    end
    else
    with Memo2 do
    begin
      Lines.Clear;
      Font.Color := clRed;
      Lines.Add('Error--->Port not open');
  end;
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
  if devSelected.Checked then
  begin
    LazSerial1.WriteData('ATH'+CR);
    Memo2.Font.Color := clYellow;
    Memo2.Lines.Add('Sending--->ATH->Hang up');
  end
  else
  with Memo2 do
  begin
    Lines.Clear;
    Font.Color := clRed;
    Lines.Add('Error--->Port not open');
  end;
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
begin
  if devSelected.Checked then
  begin
    lazSerial1.WriteData('AT+CMGF=1'+CR);
    Memo2.Font.Color := clYellow;
    Memo2.Lines.Add('Sending--->AT+CMGF=1->Msg format');
  end
  else
   with Memo2 do
  begin
    Lines.Clear;
    Font.Color := clRed;
    Lines.Add('Error--->Port not open');
  end;
end;

end.

