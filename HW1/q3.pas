program TaskManager;
type Task = record 
    case letter: char of
        'P': (a,b,c : integer);
        'C': (ch : char; d : integer);
        'G': (average, exam: integer);
    end;

var tasks: array [1..5] of Task;
var i, j, finalGrade: integer;
var charInput: char;


begin
    for i := 1 to 5 do
    begin
        ReadLn(charInput);
        tasks[i].letter := charInput;
    end;

    for i := 1 to 5 do
    begin
        if tasks[i].letter = 'P' then
        begin
            ReadLn(tasks[i].a);
            ReadLn(tasks[i].b);
            ReadLn(tasks[i].c);
        end;
        if tasks[i].letter = 'C' then
        begin
            ReadLn(tasks[i].ch);
            ReadLn(tasks[i].d);
        end;
        if tasks[i].letter = 'G' then
        begin
            ReadLn(tasks[i].average);
            ReadLn(tasks[i].exam);
        end;
    end;

    for i := 5 downto 1 do
    begin
        if tasks[i].letter = 'P' then
        begin
            if tasks[i].a*tasks[i].a + tasks[i].b*tasks[i].b = tasks[i].c*tasks[i].c then
            begin
                writeLn('TRUE');
            end
            else
            begin
                writeLn('FALSE');
            end;
        end;
        if tasks[i].letter = 'C' then
        begin
            for j:=1 to tasks[i].d do
            begin
                tasks[i].ch := succ(tasks[i].ch);
            end;
            writeLn(tasks[i].ch);
        end;
        if tasks[i].letter = 'G' then
        begin
            if tasks[i].exam <= 54 then
            begin
                writeLn(tasks[i].exam);
            end
            else
            begin
                finalGrade := Round(tasks[i].exam*0.8 + tasks[i].average*0.2);
                writeLn(finalGrade);
            end;
        end;
    end;
end.