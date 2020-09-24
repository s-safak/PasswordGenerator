unit u_math;

interface

uses
  Windows;

  function GetRandom(const Range: Cardinal): integer;
  function GetRandomRange(const FromX, ToX: integer): integer;

implementation

var
  Counter: Extended = 0;

function GetRandom(const Range: Cardinal): integer;
begin
  Counter := Random(High(Integer)) + Random + Counter;
  Result := Trunc(GetTickCount + Counter) mod Range;
end;

function GetRandomRange(const FromX, ToX: integer): integer;
begin
  if FromX > ToX then
    Result := GetRandom(FromX - ToX) + ToX
  else
    Result := GetRandom(ToX - FromX) + FromX;
end;

end.
