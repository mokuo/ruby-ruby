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
  when 'stmts'
    i = 1
    last = nil
    while tree[i]
      last = evaluate(tree[i], genv, lenv)
      i = i + 1
    end
    last
  when 'var_assign'
    lenv[tree[1]] = evaluate(tree[2], genv, lenv)
  when 'var_ref'
    lenv[tree[1]]
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
  when 'func_call'
    args = []
    i = 0
    while tree[i + 2]
      args[i] = evaluate(tree [i + 2], genv, lenv)
      i = i + 1
    end
    mtd = genv[tree[1]]
    if mtd[0] == 'builtin'
      minruby_call(mtd[1], args)
    else
      params = mtd[1]
      i = 0
      while params[i]
        lenv[params[i]] = args[i]
        i = i + 1
      end
      evaluate(mtd[2], genv, lenv)
    end
  when 'func_def'
    genv[tree[1]] = ['user_defined', tree[2], tree[3]]
  end
end

str = minruby_load

tree = minruby_parse(str)

genv = { "p" => ["builtin", "p"] } # rubocop:disable all
lenv = {}
evaluate(tree, genv, lenv)
