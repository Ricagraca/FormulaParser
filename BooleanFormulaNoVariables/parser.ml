type token =
  | BOOL of (bool)
  | AND
  | OR
  | IMPLIES
  | NEG
  | LPAREN
  | RPAREN
  | EOL

open Parsing;;
let _ = parse_error;;
let yytransl_const = [|
  258 (* AND *);
  259 (* OR *);
  260 (* IMPLIES *);
  261 (* NEG *);
  262 (* LPAREN *);
  263 (* RPAREN *);
  264 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* BOOL *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\000\000"

let yylen = "\002\000\
\002\000\001\000\003\000\003\000\003\000\003\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\000\000\000\000\008\000\000\000\007\000\
\000\000\000\000\000\000\000\000\001\000\003\000\005\000\004\000\
\006\000"

let yydgoto = "\002\000\
\006\000\007\000"

let yysindex = "\001\000\
\012\255\000\000\000\000\012\255\012\255\000\000\001\255\000\000\
\008\255\012\255\012\255\012\255\000\000\000\000\000\000\000\000\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\252\255"

let yytablesize = 18
let yytable = "\008\000\
\009\000\001\000\010\000\011\000\012\000\015\000\016\000\017\000\
\013\000\010\000\011\000\012\000\003\000\000\000\014\000\000\000\
\004\000\005\000"

let yycheck = "\004\000\
\005\000\001\000\002\001\003\001\004\001\010\000\011\000\012\000\
\008\001\002\001\003\001\004\001\001\001\255\255\007\001\255\255\
\005\001\006\001"

let yynames_const = "\
  AND\000\
  OR\000\
  IMPLIES\000\
  NEG\000\
  LPAREN\000\
  RPAREN\000\
  EOL\000\
  "

let yynames_block = "\
  BOOL\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 14 "parser.mly"
                            ( _1 )
# 87 "parser.ml"
               : bool))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 17 "parser.mly"
                            ( _1 )
# 94 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 18 "parser.mly"
                            ( _2 )
# 101 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 19 "parser.mly"
                            ( _1 || _3 )
# 109 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 20 "parser.mly"
                            ( _1 && _3 )
# 117 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 21 "parser.mly"
                            ( (not _1) || _3 )
# 125 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 22 "parser.mly"
                            ( not _2 )
# 132 "parser.ml"
               : 'expr))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : bool)
