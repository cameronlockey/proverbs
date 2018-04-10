module VersesHelper

  def bold_terms(text, terms)
    if terms
      terms.each do |t|
        text = text.gsub(/#{t}/,"<strong>#{t}</strong>")
      end
    end
    text
  end
end
