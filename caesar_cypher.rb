require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  string = params['string_input'].to_s
  number = params['integer_input'].to_i
  ui_response = caesar_cipher(string, number)
  erb :index, locals: { ui_response: ui_response }
end

def caesar_cipher(string, number)
  r_string = ''
  string.split('').each do |e|
    character_code = e.ord
    r_string << if character_code.between?(65, 90)
                  (65 + (((character_code - 65) + number) % 26)).chr
                elsif character_code.between?(97, 122)
                  (97 + (((character_code - 97) + number) % 26)).chr
                else
                  e
                end
  end
  r_string
end