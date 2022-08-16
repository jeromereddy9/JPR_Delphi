unit Help;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, jpeg;

type
  THelp_form = class(TForm)
    Panel1: TPanel;
    output: TRichEdit;
    Panel2: TPanel;
    Image1: TImage;
    btngeneral: TButton;
    btnQA: TButton;
    BtnContact: TButton;
    procedure btngeneralClick(Sender: TObject);
    procedure btnQAClick(Sender: TObject);
    procedure BtnContactClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Help_form: THelp_form;

implementation

{$R *.dfm}

procedure THelp_form.BtnContactClick(Sender: TObject);
begin
  output.Lines.LoadFromFile('Contact.txt');
end;

procedure THelp_form.btngeneralClick(Sender: TObject);
begin
  output.Lines.LoadFromFile('General.txt');
end;

procedure THelp_form.btnQAClick(Sender: TObject);
begin
  output.Lines.LoadFromFile('Q&A.txt');
end;

end.
