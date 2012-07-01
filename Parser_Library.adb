
with Ada.Finalization;             use Ada.Finalization;
with Ada.Strings.Unbounded;        use Ada.Strings.Unbounded;

procedure Parser_Library is

   type String_Slice is record
      Master_String : access Unbounded_String;
      Start, Finish : Natural;
   end record;

   function To_Slice (A : access Unbounded_String) return String_Slice is
   begin
      return Maybe_String_Slice'(Master_String => A, Start => 1, Finish => Length (A.all) + 1);
   end To_Slice;

   
   X : aliased Unbounded_String;
   Y : String_Slice;
begin
   X := To_Unbounded_String ("x := 5 + 7;");
   Y := To_Slice (X'Access);
end Parser_Library;
