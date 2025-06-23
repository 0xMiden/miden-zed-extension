(moduledoc) @comment.doc

(doc_comment) @comment.doc

(comment)+ @comment

[
  "use"
  "export"
  "proc"
  "const"
  "begin"
  "end"
  "if.true"
  "else"
  "while.true"
  "repeat"
  "adv.insert_hdword"
  "adv.insert_hdword_d"
  "adv.insert_hperm"
  "adv.insert_mem"
  "adv.push_ext2intt"
  "adv.push_mapval"
  "adv.push_mapvaln"
  "adv.push_mtnode"
  "adv.push_smtpeek"
  "adv.push_u64div"
  "adv.push_falcon_div"
  "adv_pipe"
  "adv_loadw"
  "and"
  "arithmetic_circuit_eval"
  "caller"
  "cdrop"
  "cdropw"
  "clk"
  "cswap"
  "cswapw"
  "drop"
  "dropw"
  "dyncall"
  "dynexec"
  "eqw"
  "ext2add"
  "ext2div"
  "ext2inv"
  "ext2mul"
  "ext2neg"
  "ext2sub"
  "fri_ext2fold4"
  "hash"
  "hperm"
  "hmerge"
  "ilog2"
  "inv"
  "is_odd"
  "mem_stream"
  "mtree_get"
  "mtree_merge"
  "mtree_set"
  "neg"
  "not"
  "nop"
  "or"
  "padw"
  "pow2"
  "horner_eval_base"
  "horner_eval_ext"
  "sdepth"
  "swapdw"
  "u32cast"
  "u32overflowing_add3"
  "u32overflowing_madd"
  "u32popcnt"
  "u32clz"
  "u32ctz"
  "u32clo"
  "u32cto"
  "u32split"
  "u32test"
  "u32testw"
  "u32wrapping_add3"
  "u32wrapping_madd"
  "xor"
  "add"
  "sub"
  "mul"
  "div"
  "eq"
  "exp.u"
  "exp"
  "gte"
  "gt"
  "lte"
  "lt"
  "neq"
  "u32and"
  "u32div"
  "u32divmod"
  "u32gt"
  "u32gte"
  "u32lt"
  "u32lte"
  "u32max"
  "u32min"
  "u32mod"
  "u32or"
  "u32overflowing_add"
  "u32overflowing_sub"
  "u32overflowing_mul"
  "u32xor"
  "u32not"
  "u32shl"
  "u32shr"
  "u32rotl"
  "u32rotr"
  "u32wrapping_add"
  "u32wrapping_mul"
  "u32wrapping_sub"
  "adv_push"
  "dupw"
  "dup"
  "movdnw"
  "movdn"
  "movupw"
  "movup"
  "swapw"
  "swap"
  "locaddr"
  "loc_load"
  "loc_loadw"
  "loc_store"
  "loc_storew"
  "mem_load"
  "mem_loadw"
  "mem_store"
  "mem_storew"
  "assert_eqw"
  "assert_eq"
  "assertz"
  "assert"
  "u32assert2"
  "u32assertw"
  "u32assert"
  "mtree_verify"
  "breakpoint"
  "debug"
  "emit"
  "trace"
  "push"
  "exec"
  "call"
  "syscall"
  "procref"
  "nop"
] @keyword

(import
  path: (path [
    (relative_path ([(identifier) (string)] "::")* [(identifier) (string)] @module)
    (absolute_path ([(identifier) (string)] "::")* [(identifier) (string)] @module)
  ])
  !alias)

(import_alias name: (identifier) @module)

(const_ident) @constant

(procedure name: (identifier) @function)

(entrypoint) @function

(annotation
  "@" @attribute
  name: (identifier) @attribute)

(meta_key_value name: [(identifier) (string)] @property)

(identifier) @function.method

((identifier) @string.special.symbol
  (#match? @string.special.symbol "[$](exec|kernel|sys|anon)"))

(invoke
  path: (path [
    (relative_path ([(identifier) (string)] "::")* [(identifier) (string)] @function)
    (absolute_path ([(identifier) (string)] "::")* [(identifier) (string)] @function)
  ]))

(assert
  err: ("err" @keyword))

(debug "." ["stack" "mem" "local" "adv_stack"] @keyword)

[
  (number)
  (integer)
  (decimal)
  (hex)
] @number

(string) @string

[
  "+"
  "-"
  "*"
  "/"
  "//"
  "="
  "->"
] @operator

[
  "."
  "::"
] @punctuation.delimiter

[
  "["
  "]"
] @punctuation.list_marker

[
  "["
  "]"
  "("
  ")"
] @punctuation.bracket
