# frozen_string_literal: true

i = 0
while i < 10
  p(i)
  i = i + 1 # rubocop:disable Style/SelfAssignment
end
