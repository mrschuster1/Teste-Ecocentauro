unit helper.validador;

interface

uses
  SysUtils,
  Math;

type
  TValidador = class
  public
    class function ValidarCPF(CPF: string): boolean;

  end;

implementation

{ TValidador }

class function TValidador.ValidarCPF(CPF: string): boolean;
var
  Digitos: array [1 .. 11] of Integer;
begin
  if CPF = '' then
  begin
    Result := False;
    Exit;
  end;

  for var i := 1 to Length(CPF) do
  begin
   if CharInSet(CPF[i], ['0'..'9']) then
      Digitos[i] := StrToInt(CPF[i])
    else
      Exit(False);
  end;

  var
  Soma := 0;
  for var i := 1 to 9 do
    Soma := Soma + Digitos[i] * (11 - i);
  var
  Restante := (Soma * 10) mod 11;
  var
  Digit1 := IfThen(Restante = 10, 0, Restante);
  if Digit1 <> Digitos[10] then
    Exit(False);

  Soma := 0;
  for var i := 1 to 10 do
    Soma := Soma + Digitos[i] * (12 - i);
  Restante := (Soma * 10) mod 11;
  var
  Digit2 := IfThen(Restante = 10, 0, Restante);
  if Digit2 <> Digitos[11] then
    Exit(False);

  Result := True;
end;

end.
