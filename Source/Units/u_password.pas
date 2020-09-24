unit u_password;

interface

uses
  u_math;

type
  TCharType = (ctNum, ctUpper, ctLower, ctSpecial);

  function GetPassword(const UseNumberC, UseUpperC, UseLowerC, UseSpecialC: Boolean;
    const SpecialChars: string; const Len: Cardinal): string;
  function GetRandomChar(const CharType: TCharType): Char;

implementation

var
  FSpecialChars: string;

function GetPassword(const UseNumberC, UseUpperC, UseLowerC, UseSpecialC: Boolean;
  const SpecialChars: string; const Len: Cardinal): string;
var
  CharTypes: array of TCharType;
  CharTypesLen: Byte;
  i: Cardinal;
  procedure AddCharType(const CharType: TCharType);
  begin
    SetLength(CharTypes, Length(CharTypes) + 1);
    CharTypes[High(CharTypes)] := CharType;
  end;
begin
  FSpecialChars := SpecialChars;
  if UseNumberC then AddCharType(ctNum);
  if UseUpperC then AddCharType(ctUpper);
  if UseLowerC then AddCharType(ctLower);
  if UseSpecialC then AddCharType(ctSpecial);
  CharTypesLen := Length(CharTypes);
  for i := 1 to Len do
    Result := Result + GetRandomChar(CharTypes[GetRandom(CharTypesLen)]);
end;

function GetRandomChar(const CharType: TCharType): Char;
begin
  case CharType of
    ctNum: Result := Chr(GetRandomRange(Byte('0'), Byte('9') + 1));
    ctUpper: Result := Chr(GetRandomRange(Byte('A'), Byte('Z') + 1));
    ctLower: Result := Chr(GetRandomRange(Byte('a'), Byte('z') + 1));
    ctSpecial: Result := FSpecialChars[GetRandomRange(1, Length(FSpecialChars) + 1)];
      else Result := #0;
  end;
end;

end.
