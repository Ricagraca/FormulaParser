(* File lexer.mll *)
{
open Parser        (* The type token is defined in parser.mli *)
exception Eof
}
rule token = parse
    [' ' '\t']     { token lexbuf }     (* skip blanks *)
    | ['\n' ]        { EOL }
    | "false" as lxm { BOOL(bool_of_string lxm) }
    | "true" as lxm { BOOL(bool_of_string lxm) }
    | "\\/"            { OR }
    | "/\\"            { AND }
    | '-'            { NEG }
    | '('            { LPAREN }
    | ')'            { RPAREN }
    | eof            { raise Eof }