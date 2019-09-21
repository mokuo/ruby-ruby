# frozen_string_literal: true

require 'minruby'

def evaluate(tree, genv, lenv)
  case tree[0]
  when 'lit'
    tree[1]
  when '+'
    evaluate(tree[1], genv, lenv) + evaluate(tree[2], genv, lenv)
  when '-'
    evaluate(tree[1], genv, lenv) - evaluate(tree[2], genv, lenv)
  when '*'
    evaluate(tree[1], genv, lenv) * evaluate(tree[2], genv, lenv)
  when '/'
    evaluate(tree[1], genv, lenv) / evaluate(tree[2], genv, lenv)
  when '%'
    evaluate(tree[1], genv, lenv) % evaluate(tree[2], genv, lenv)
  when '**'
    evaluate(tree[1], genv, lenv)**evaluate(tree[2], genv, lenv)
  when '=='
    evaluate(tree[1], genv, lenv) == evaluate(tree[2], genv, lenv)
  when '<'
    evaluate(tree[1], genv, lenv) < evaluate(tree[2], genv, lenv)
  when '>'
    evaluate(tree[1], genv, lenv) > evaluate(tree[2], genv, lenv)
  when 'func_call' # 仮の実装
    p(evaluate(tree[2], genv, lenv))
  when 'stmts'
    i = 1
    last = nil
    while tree[i]
      last = evaluate(tree[i], genv, lenv)
      i += 1
    end
    last
  when 'var_assign'
    env[tree[1]] = evaluate(tree[2], genv, lenv)
  when 'var_ref'
    env[tree[1]]
  when 'if'
    if evaluate(tree[1], genv, lenv)
      evaluate(tree[2], genv, lenv)
    else
      evaluate(tree[3], genv, lenv)
    end
  when 'while'
    evaluate(tree[2], genv, lenv) while evaluate(tree[1], genv, lenv)
  when 'while2'
    evaluate(tree[2], genv, lenv)
    evaluate(tree[2], genv, lenv) while evaluate(tree[1], genv, lenv)
  end
end

str = minruby_load

tree = minruby_parse(str)

lenv = {}
evaluate(tree, genv, lenv)
