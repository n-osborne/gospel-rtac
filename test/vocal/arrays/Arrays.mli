(**************************************************************************)
(*                                                                        *)
(*  VOCaL -- A Verified OCaml Library                                     *)
(*                                                                        *)
(*  Copyright (c) 2020 The VOCaL Project                                  *)
(*                                                                        *)
(*  This software is free software, distributed under the MIT license     *)
(*  (as described in file LICENSE enclosed).                              *)
(**************************************************************************)

(** {2 Additional operations on arrays} *)

val binary_search: ('a -> 'a -> int) -> 'a array -> int -> int -> 'a -> int
(** search for value [v] in array [a], between indices [fromi] inclusive
    and [toi] exclusive, using comparison function [cmp]. Returns an index
    where [v] occurs, or raises [Not_found] if no such index exists. *)
(*@ r = binary_search cmp a fromi toi v
      requires 0 <= fromi <= toi <= length a *)

val binary_search_left: ('a -> 'a -> int) -> 'a array -> int -> int -> 'a -> int
(** search for value [v] in array [a], between indices [fromi] inclusive
    and [toi] exclusive, using comparison function [cmp]. If [v] occurs in
    [a], returns an index immediately to the left of the set of occurrences
    of [v]. Otherwise, returns an index where to insert [v]. *)
(*@ r = binary_search_left cmp a fromi toi v
      requires 0 <= fromi <= toi <= length a
      ensures  fromi <= r <= toi *)

val binary_search_right:
  ('a -> 'a -> int) -> 'a array -> int -> int -> 'a -> int
(** search for value [v] in array [a], between indices [fromi] inclusive
    and [toi] exclusive, using comparison function [cmp]. If [v] occurs in
    [a], returns an index immediately to the right of the set of occurrences
    of [v]. Otherwise, returns an index where to insert [v]. *)
(*@ r = binary_search_right cmp a fromi toi v
      checks   0 <= fromi <= toi <= length a
      ensures  fromi <= r <= toi *)

val binary_sort: ('a -> 'a -> int) -> 'a array -> int -> int -> unit
(** sort array [a] betweens indices [fromi] inclusive and [toi] exclusive
    using a binary insertion sort.
    Time complexity is quadratic, but number of comparisons is only
    linearithmic. *)
(*@ binary_sort cmp a fromi toi
      requires 0 <= fromi <= toi <= length a
      modifies a *)

val swap: 'a array -> int -> int -> unit
(*@ swap a i j
      requires 0 <= i < length a && 0 <= j < length a
      modifies a *)

val knuth_shuffle: 'a array -> unit
(*@ knuth_shuffle a
      modifies a *)
