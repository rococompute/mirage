open Mirage

(* kykeon's layout: the image linked at 3 GB, user memory at fixed addresses
   below it for the fixed-address programs it runs, and more placed by the
   tender above it. *)
let () =
  register ~src:`None
    ~user_memory:
      [
        user_memory ~address:0x200000 ~size:0xbfd00000 "guest";
        user_memory ~size:0x1000000 "scratch";
      ]
    ~text_start:0xc0000000 "user_memory" [ noop ]
