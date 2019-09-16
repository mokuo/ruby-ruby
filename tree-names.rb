def preorder(tree)
  if tree[0].start_with?("節")
    preorder(tree[1])
    preorder(tree[2])
  elsif tree[0].start_with?("葉")
    p(tree[0])
  end
end

node1 = [
  "節1",
  [
    "節2",
    ["葉A"],
    ["節3" ,["葉B"], ["葉C"]]
  ],
  ["葉D"]
]

preorder(node1)