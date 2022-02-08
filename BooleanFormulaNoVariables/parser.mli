type token =
  | BOOL of (bool)
  | AND
  | OR
  | IMPLIES
  | NEG
  | LPAREN
  | RPAREN
  | EOL

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> bool
