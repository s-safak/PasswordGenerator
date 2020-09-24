unit MainFormUnit;

interface

uses
  Windows, SysUtils, Classes, Forms, Spin, IniFiles, StdCtrls, Controls,
  u_password, ExtCtrls;
  
type
  TMainForm = class(TForm)
    ButUret: TButton;
    ButKopyala: TButton;
    MemSifre: TMemo;
    CheBRakam: TCheckBox;
    CheBBuyuk: TCheckBox;
    CheBKucuk: TCheckBox;
    LabSifreUzunlugu: TLabel;
    SpiELen: TSpinEdit;
    LabOzel: TLabel;
    EdiOzel: TEdit;
    CheBOzel: TCheckBox;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButUretClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ButKopyalaClick(Sender: TObject);
  private
    function GetIniFileName: string;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

function TMainForm.GetIniFileName: string;
begin
  Result := ExtractFilePath(Application.ExeName) + 'suretici.ini';
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(GetIniFileName);
  try
    CheBRakam.Checked := IniFile.ReadBool('Main', 'Rakam', CheBRakam.Checked);
    CheBBuyuk.Checked := IniFile.ReadBool('Main', 'Buyuk', CheBBuyuk.Checked);
    CheBKucuk.Checked := IniFile.ReadBool('Main', 'Kucuk', CheBKucuk.Checked);
    CheBOzel.Checked := IniFile.ReadBool('Main', 'Ozel', CheBOzel.Checked);
    EdiOzel.Text := IniFile.ReadString('Main', 'OzelKarakterler', EdiOzel.Text);
    SpiELen.Value := IniFile.ReadInteger('Main', 'Uzunluk', SpiELen.Value);
  finally
    IniFile.Free;
  end;
  Randomize;
  ButUret.Click;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(GetIniFileName);
  try
    IniFile.WriteBool('Main', 'Rakam', CheBRakam.Checked);
    IniFile.WriteBool('Main', 'Buyuk', CheBBuyuk.Checked);
    IniFile.WriteBool('Main', 'Kucuk', CheBKucuk.Checked);
    IniFile.WriteBool('Main', 'Ozel', CheBOzel.Checked);
    IniFile.WriteString('Main', 'OzelKarakterler', EdiOzel.Text);
    IniFile.WriteInteger('Main', 'Uzunluk', SpiELen.Value);
  finally
    IniFile.Free;
  end;
end;

procedure TMainForm.ButUretClick(Sender: TObject);
var
  Checked: Boolean;
begin
timer1.Enabled:=true;
  Checked := CheBRakam.Checked or CheBBuyuk.Checked or CheBKucuk.Checked or CheBOzel.Checked;
  if not(Checked) then
  begin
    MessageBox(Handle, 'Rakam, büyük veya küçük harf kullan seçeneklerinden' +
                       #13#10'en az birisini seçmelisiniz', 'Hata',
                       MB_OK + MB_ICONERROR);
    Exit;
  end;
  CheBOzel.Checked := CheBOzel.Checked and (EdiOzel.Text > '');
  MemSifre.Lines.Text := GetPassword(CheBRakam.Checked, CheBBuyuk.Checked,
                                     CheBKucuk.Checked, CheBOzel.Checked,
                                     EdiOzel.Text, SpiELen.Value);
end;

procedure TMainForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    ButUret.Click;
    Key := #0;
  end;
end;

procedure TMainForm.ButKopyalaClick(Sender: TObject);
begin
  MemSifre.SelectAll;
  MemSifre.CopyToClipboard;
end;

end.
