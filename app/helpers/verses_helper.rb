module VersesHelper

  def bold_terms(text, terms)
    words = text.split(' ')
    words.map! do |w|
      terms.map! { |t| t.downcase }.include?(w.downcase) ? "<strong>#{w}</strong>" : w.to_s
    end
    words.join(' ')
  end
end
