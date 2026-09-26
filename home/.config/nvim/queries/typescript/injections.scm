(call_expression
  function: (member_expression
    property: (property_identifier) @method_name
  )
  (template_string) @injection.content
  (#match? @method_name "^(exec|queryRow|queryAll)$")
  (#set! injection.language "sql")
  (#set! injection.include-children)
)
; (call_expression
;   function: (member_expression
;     property: (property_identifier) @name (#eq? @name "exec")
;   )
;   (template_string) @injection.content
;   (#set! injection.language "sql")
;   (#set! injection.include-children))
