# return an array containing the colors of fruits and sizes of vegetables
# colors should be capitalized, and sizes should be uppercase

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}


hsh.map do |_, details|
  if details[:type] == 'fruit'
    details[:colors].map do |color|
      color.capitalize
    end
  else
    details[:size].upcase
  end
end
