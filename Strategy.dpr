program Strategy;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Common in '.\Common.pas',
  Strategy.Pattern in '.\Strategy.Pattern.pas',
  Strategy.Example in '.\Strategy.Example.pas';

begin
  try
    Example;
    Readln;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
