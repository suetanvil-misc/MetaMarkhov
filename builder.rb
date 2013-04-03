
# Builder class skeleton

class Builder
  def addWord(theWord)
    puts "Adding word '#{theWord}'"
  end

  def extrude(filename)
    filename += '.rb' unless filename.end_with?('.rb')
    puts "Extruding to '#{filename}'"
  end
end
