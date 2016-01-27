# encoding: UTF-8
require "sinatra"

class HelloWorldApp < Sinatra::Base
  get "/" do
    "Hello, world!"
  end

  get "/process" do
    # Required Parameters
    #   input_path
    #   duration
    #   resolution
    #   padding_x
    #   padding_y
    #   start_point
    #   output_path
    system("ffmpeg -i #{params["input_path"]} -r 25 -sameq -t #{params["duration"]} -s #{params["resolution"]} -vf pad=580:326:#{params["padding_x"]}:#{params["padding_y"]} -ss #{params["start_point"]} #{params["output_path"}")
  end
end
