open Arith__Lib_rtac
open Common

let forall () =
  check_success "bounds in the right order" (fun () ->
      test_forall (-2) (-3) |> ignore);
  check_success "empty interval" (fun () -> test_forall (-2) (-2) |> ignore);
  check_raises_gospel "formula not satisfied" (fun () ->
      test_forall (-2) (-1) |> ignore);
  check_success "formula satisfied" (fun () -> test_forall 2 3 |> ignore)

let suite = ("Arithmetics", [ ("forall", `Quick, forall) ])
