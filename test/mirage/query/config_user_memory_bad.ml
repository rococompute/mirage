open Mirage

let () =
  register ~src:`None
    ~user_memory:[ user_memory ~size:4096 "guest" ]
    "user_memory_bad" [ noop ]
