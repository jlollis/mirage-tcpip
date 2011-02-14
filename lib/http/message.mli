open Nettypes

type contents = [
 | `Buffer of Buffer.t
 | `String of string
 | `Inchan of OS.Istring.View.t Lwt_sequence.t Lwt.t
]

type message
val body : message -> contents list
val body_size : contents list -> int64
val set_body : message -> contents -> unit
val add_body : message -> contents -> unit
val add_header : message -> name:string -> value:string -> unit
val add_headers : message -> (string * string) list -> unit
val replace_header : message -> name:string -> value:string -> unit
val replace_headers : message -> (string * string) list -> unit
val remove_header : message -> name:string -> unit
val has_header : message -> name:string -> bool
val header : message -> name:string -> string list
val headers : message -> (string * string) list
val version : message -> Types.version
val init :
  body:contents list ->
  headers:(string * string) list ->
  version:Types.version -> message
val serialize_to_stream :
  message -> fstLineToString:string -> string Lwt_stream.t
