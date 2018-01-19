def string_weight(s1, s2)
	hash = {}
	("a".."z").to_a.each_with_index do |letter, index|
		hash[letter] = index + 1
	end
	s1_sum = s2_sum = 0
	s1.split("").each do |str|
		s1_sum += hash[str]
	end
	s2.split("").each do |str|
		s2_sum += hash[str]
	end
	if s1_sum == s2_sum
		return equal
	elsif s1_sum > s2_sum
		return 1
	elsif s1_sum < s2_sum
		return 2
	end
end
result = string_weight("batman", "superman")
puts "#{result}"