# frozen_string_literal: true

require 'minruby'

def evaluate(tree)
  case tree[0]
  when 'lit'
    tree[1]
  when '+'
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left + right
  when '-'
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left - right
  when '*'
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left * right
  when '/'
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left / right
  when '%'
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left % right
  when '**'
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left**right
  when '=='
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left == right
  when '<'
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left < right
  when '>'
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left > right
  else
    raise
  end
end

def max(tree)
  if tree[0] == 'lit'
    tree[1]
  else
    left = max(tree[1])
    right = max(tree[2])
    [left, right].max
  end
end

str = gets

tree = minruby_parse(str)

answer = max(tree)

p(answer)
