unit helper.ini;

interface

uses
  inifiles,
  ioutils;

type
  TIniHelper = class
  private
    class var Ini: TIniFile;

    class procedure Create;

    class procedure Free;

  public
    class procedure SetValue(Section, Field, Value: string); overload;

    class procedure SetValue(Section, Field: string; Value: integer); overload;

    class procedure SetValue(Section, Field: string; Value: boolean); overload;

    class function GetValue(Section, Field, DefaultValue: string)
      : string; overload;

    class function GetValue(Section, Field: string; DefaultValue: integer)
      : integer; overload;

    class function GetValue(Section, Field: string; DefaultValue: boolean)
      : boolean; overload;

    class procedure RemoveValue(Section, Field: string);

  end;

implementation

{ TIniHelper }

class procedure TIniHelper.Create;
begin
  Ini := TIniFile.Create(TPath.ChangeExtension(paramstr(0), 'ini'));
end;

class procedure TIniHelper.Free;
begin
  Ini.Free
end;

class function TIniHelper.GetValue(Section, Field: string;
  DefaultValue: boolean): boolean;
begin
  Result := Ini.ReadBool(Section, Field, DefaultValue)
end;

class procedure TIniHelper.RemoveValue(Section, Field: string);
begin
  Ini.DeleteKey(Section, Field)
end;

class procedure TIniHelper.SetValue(Section, Field: string; Value: boolean);
begin
  Ini.WriteBool(Section, Field, Value)
end;

class function TIniHelper.GetValue(Section, Field: string;
  DefaultValue: integer): integer;
begin
  if Ini.ReadInteger(Section, Field, 0) = 0 then
    SetValue(Section, Field, DefaultValue);
  Result := Ini.ReadInteger(Section, Field, DefaultValue)
end;

class procedure TIniHelper.SetValue(Section, Field: string; Value: integer);
begin
  Ini.WriteInteger(Section, Field, Value)
end;

class function TIniHelper.GetValue(Section, Field, DefaultValue
  : string): string;
begin
  if Ini.ReadString(Section, Field, '') = '' then
    SetValue(Section, Field, DefaultValue);
  Result := Ini.ReadString(Section, Field, DefaultValue);
end;

class procedure TIniHelper.SetValue(Section, Field, Value: string);
begin
  Ini.WriteString(Section, Field, Value);
end;

initialization

TIniHelper.Create;

finalization

TIniHelper.Free;

end.

