# frozen_string_literal: true

def postorder(tree)
  if tree[0].start_with?('節')
    postorder(tree[1])
    postorder(tree[2])
  end
  p(tree[0])
end

node1 = [
  '節1',
  ['節2', ['葉A'], ['葉B']],
  ['節3', ['葉C'], ['葉D']]
]

postorder(node1)
