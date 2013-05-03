=begin

- take a text document
-- somehow contextualize the document
-- build a long string of text, divided or tagged according 
-- 


-- no whitespace
-- split on the basis of punctuation in general

the class:
- arg parser
- output file name from the argument list
- takes an input file

- types of punctuation and text parsing

options:
-- capitalized vs. non-capitalized
-- numbers vs. characters
-- line breaks 
-- spacing
-- "--" start 
-- "quotes" ie. filter for "", create the next word with quotes around it
-- A.D. --> must be followed by a number
-- brackets
-- indentation
-- 5 space character
-- multiple punctuations in a row

disgard the garbage

argument types to pass -->
"filter on:" options:
  - punctutation
  - numbers
  - CHAPTER


for each word inputted, detect its "context", store it and "tag" it in sequence
  return the resultant string
  ie.  
    It will be seen that this mere painstaking burrower and grub-worm of a
    poor devil of a Sub-Sub appears to have gone through the long Vaticans
    and street-stalls of the earth, picking up whatever random allusions to
    whales he could anyways find in any book whatsoever, sacred or
    profane. Therefore you must not, in every case at least, take the
    higgledy-piggledy whale statements, however authentic, in these
    extracts, for veritable gospel cetology. Far from it. As touching the
    ancient authors generally, as well as the poets here appearing, these
    extracts are solely valuable or entertaining, as affording a glancing
    bird's eye view of what has been promiscuously said, thought, fancied,
    and sung of Leviathan, by many nations and generations, including our
    own.

class TextParse
  methods required:
    - read the file/words/text
      - if the input is text
      - if the input is words
      - if the input is a file
    
  - split types
    - split on punctuation
  
  - filter 
  
=end

#require "pry"
    
class TextSplitter
  
  def initialize
    @text_file = "./moby_dick.txt"
  end
  
  def load_and_split_text_file
    text_file = @text_file
    @text_file_input = open(text_file, "r")
  end
  
  def create_contents
    text_file_input = @text_file_input
    @contents = []
    lines = text_file_input.readlines
    lines.each do |line|
      @contents << if line.split(/\W/)
      end
    return @contents[0..10]
    end
  end
  
  def run
    load_and_split_text_file
    create_contents
  end
  
end
