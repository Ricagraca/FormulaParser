

/* File parser.mly */
%token <bool> BOOL
%token AND OR IMPLIES NEG
%token LPAREN RPAREN
%token EOL
%left AND OR IMPLIES        /* lowest precedence */
%nonassoc NEG        /* highest precedence */
%start main             /* the entry point */
%type <bool> main
%%
main:
    expr EOL                { $1 }
;
expr:
    BOOL                    { $1 }
    | LPAREN expr RPAREN    { $2 }
    | expr OR expr          { $1 || $3 }
    | expr AND expr         { $1 && $3 }
    | expr IMPLIES expr     { (not $1) || $3 }
    | NEG expr              { not $2 }
;