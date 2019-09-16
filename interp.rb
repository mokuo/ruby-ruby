# frozen_string_literal: true

require 'minruby'

def evaluate(tree)
  case tree[0]
  when 'lit'
    tree[1]
  when '+'
    evaluate(tree[1]) + evaluate(tree[2])
  when '-'
    evaluate(tree[1]) - evaluate(tree[2])
  when '*'
    evaluate(tree[1]) * evaluate(tree[2])
  when '/'
    evaluate(tree[1]) / evaluate(tree[2])
  when 'func_call' # 仮の実装
    p(evaluate(tree[2]))
  when 'stmts'
    i = 1
    last = nil
    until tree[i].nil?
      last = evaluate(tree[i])
      i += 1
    end
    last
  end
end

str = minruby_load

tree = minruby_parse(str)

evaluate(tree)
