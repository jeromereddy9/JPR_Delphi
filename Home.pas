unit Home;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Back_End, Administrator_DashBoard, StdCtrls, ComCtrls, Menus,
  ExtCtrls, ButtonGroup, ActnList, shellapi, jpeg, MPlayer;

type
  THome_pg = class(TForm)
    btnHelp: TButton;
    btnLogin: TButton;
    Panel2: TPanel;
    Heading1: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Panel3: TPanel;
    outputMedia: TRichEdit;
    MediaPlayer1: TMediaPlayer;
    Panel4: TPanel;
    Panel5: TPanel;
    btnExit: TButton;
    Button1: TButton;
    outputInfo1: TRichEdit;
    procedure FormActivate(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Home_pg: THome_pg;
  icount: integer;

implementation

uses Login_RegistrationPg, Help;
{$R *.dfm}

procedure THome_pg.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure THome_pg.btnHelpClick(Sender: TObject);
begin
  Help_form.Show;
end;

procedure THome_pg.btnLoginClick(Sender: TObject);
begin
  Home_pg.Hide;
  Login.Show;
end;

procedure THome_pg.Button1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'F:\Reddy_Jerome_12B\WortHogsWebsite\index.html', nil,
    nil, SW_SHOWNORMAL);
end;

procedure THome_pg.FormActivate(Sender: TObject);
begin
  //
  outputInfo1.Lines.LoadFromFile('Info1.txt');
end;

procedure THome_pg.Image1Click(Sender: TObject);
begin
  //
end;

procedure THome_pg.Panel1Click(Sender: TObject);
begin
  Panel1.Color := $000032;
end;

end.
