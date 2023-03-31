program PasswordManager;
// type alphab= ('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z');
type histArray = array['a'..'z'] of integer;
var hist1, hist2: histArray;
var oldPass, newPass: string;
var i, len: integer;
var j: char;
var flag: boolean;

begin
    flag := true;
    
    for j := 'a' to 'z' do
        hist1[j] := 0;
    
    for j := 'a' to 'z' do
        hist2[j] := 0; 
    
    ReadLn(oldPass);
    ReadLn(newPass);
    len := length(oldPass);
    for i := 1 to len do
        hist1[oldPass[i]] := hist1[oldPass[i]] + 1;
    
    len := length(newPass);
    for i := 1 to len do
        hist2[newPass[i]] := hist2[newPass[i]] + 1;
    
    for j := 'a' to 'z' do
    begin
        if hist1[j] > 0 then
        begin
            if hist2[j] > 0 then
            begin
                if flag then
                begin
                    flag := false;
                    writeLn('FALSE');
                end;
            end;
        end;
    end;

    if flag then
        writeLn('TRUE');
    for j := 'a' to 'z' do
    begin
        if hist1[j] + hist2[j] > 0 then
            writeLn(j, ' ', hist1[j]+hist2[j]);
    end;
end.