with Ada.Strings.Unbounded;     use Ada.Strings.Unbounded;
with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;  use Ada.Text_IO.Unbounded_IO;
with Ada.Long_Integer_Text_IO;  use Ada.Long_Integer_Text_IO; 

procedure Two is
    function Count_Trees (X_Skip, Y_Skip: Natural) return Long_Integer is
        Input: File_Type;
        Line:  Unbounded_String;
        X:     Natural := 0;
        Y:     Natural := 0;
        Trees: Long_Integer := 0;
    begin
        Open (File => Input,
              Mode => In_File,
              Name => "input");

        while not End_Of_File (Input) loop
            Line := Get_Line (Input);

            if Y mod Y_Skip = 0 then
                if Element (Line, X+1) = '#' then
                    Trees := Trees + 1;
                end if;

                X := (X + X_Skip) mod Length (Line);
            end if;

            Y := Y + 1;
        end loop;

        Close (Input);
        return Trees;
    end Count_Trees;

    Trees: Long_Integer := 1;
begin
    Trees := Trees * Count_Trees(1, 1);
    Trees := Trees * Count_Trees(3, 1);
    Trees := Trees * Count_Trees(5, 1);
    Trees := Trees * Count_Trees(7, 1);
    Trees := Trees * Count_Trees(1, 2);

    Put (Trees); New_Line;
end Two;
