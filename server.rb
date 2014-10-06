require 'sinatra'

get '*' do
    output = paramwrite(params)
    filewrite(output)
    return output
end

def filewrite(output)
    File.open("output.log", 'a'){ |outfile| outfile.write(output) }
end

def paramwrite(parameters, output="")
    output += Time.new.to_s + " GET: #{params[:splat]} \n"
    parameters.each do | key, value |
        unless key.to_s == "splat" || key.to_s == "captures"
            output += "  #{key}: #{value}\n"
        end
    end
    return output
end