with Ada.Strings.Unbounded;     use Ada.Strings.Unbounded;
with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;  use Ada.Text_IO.Unbounded_IO;
with Ada.Long_Integer_Text_IO;  use Ada.Long_Integer_Text_IO; 

procedure One is
    Input : File_Type;
    Line  : Unbounded_String;
    X     : Natural := 0;
    Trees : Long_Integer := 0;
begin
    Open (File => Input,
          Mode => In_File,
          Name => "input");

    while not End_Of_File (Input) loop
        Line := Get_Line (Input);

        if Element (Line, X+1) = '#' then
            Trees := Trees + 1;
        end if;

        X := (X + 3) mod Length (Line);
    end loop;

    Close (Input);

    Put (Trees); New_Line;
end One;
