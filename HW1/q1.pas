program PascalTriangle;

type LineArray = array[1..15] of integer;

procedure CreateNextLine(var line: LineArray; var prevLine: LineArray; level: integer);
    var i: integer;
    begin
        i := 2;
        if level <> 1 then
        begin    
            repeat
                line[i] := prevLine[i-1] + prevLine[i];
                i := i + 1;
            until (i > level);
        end;
    end;

var n, i, j: integer;
var line, prevLine: LineArray;

begin
for i := 1 to 15 do
    begin
        line[i] := 1;
        prevLine[i] := 1
    end;
ReadLn(n);
for i := 1 to n do
    begin
        for j := 1 to i-1 do
        begin
            write(line[j], ' ');
        end;
        writeLn(line[i]);
        
        if i <> 15 then
        begin
            for j := 1 to 15 do
            begin
                prevLine[j] := line[j]
            end;
            
            CreateNextLine(line, prevLine, i)

        end;
    end;
end.
