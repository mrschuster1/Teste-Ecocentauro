unit helper.forms;

interface

uses
  Vcl.forms,
  System.SysUtils,
  scStyledForm,
  Vcl.Controls;

type
  TFormHelper = class
  public
    class function CreateModalForm<Form: TForm>: TModalResult;
    class procedure CreateMDIForm(MDIForm: TFormClass; MDIParent: TForm;
      PermiteVarios: Boolean);

  end;

implementation

{ TFormHelper }

uses
  view.main;

class function TFormHelper.CreateModalForm<Form>: TModalResult;
var
  LForm: Form;
begin
  Application.CreateForm(Form, LForm);

  try
    if LForm.FormStyle = fsMDIChild then
      LForm.FormStyle := fsNormal
    else
      LForm.ShowModal;
    result := LForm.ModalResult;
  finally
    LForm.Free;
  end;
end;

class procedure TFormHelper.CreateMDIForm(MDIForm: TFormClass; MDIParent: TForm;
  PermiteVarios: Boolean);
begin
  var
  FormCount := 0;
  if not PermiteVarios then
  begin
    for VAR i := 0 to MDIParent.MDIChildCount - 1 do
      if (MDIParent.MDIChildren[i] is MDIForm) then
      begin
        MDIParent.MDIChildren[i].BringToFront;
        Exit;
      end;
  end
  else
    for VAR i := 0 to MDIParent.MDIChildCount - 1 do
      if (MDIParent.MDIChildren[i] is MDIForm) then
        Inc(FormCount);

  var
  LForm := MDIForm.Create(Application);
  LForm.FormStyle := fsMDIChild;
  LForm.WindowState:=wsMaximized;

  if FormCount > 0 then
    LForm.Caption := Format(LForm.Caption + ' (%s)', [FormCount.tostring]);
end;

end.
