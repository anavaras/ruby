require "sinatra"

get "/monstas" do
    p params
    @name = params["name"];
    erb :monstas
end

get "/signup" do
    "Here you can sign up for the next beginners course."
end

get "/views/:title" do
    "hy, im from this page #{params["title"]}!!"
    params.inspect
end

get "/erb/:title" do
    
    # ERB.new("<h1>Hello <%= params[:title] %></h1>").result(binding)
    # erb "<h1>hya <%= title %>   <%= fyi%> </h1>",{ :locals =>params}
    @title = params["title"];
    @name = params["name"];
		@custom = "my text";
		store_name("output.txt",@name)
		@fileRes = read_names("output.txt");
    # File.open("output.txt","a+") do |file|
    #     file.puts(@name)
    # end
    erb :landing , {:locals => params , :layout => true}
end

get '/' do
    'Hello from sinatra'
end

post "/erb/:title" do
    
	# ERB.new("<h1>Hello <%= params[:title] %></h1>").result(binding)
	# erb "<h1>hya <%= title %>   <%= fyi%> </h1>",{ :locals =>params}
	@title = params["title"];
	@name = params["name"];
	@custom = "my text";
	store_name("output.txt",@name)
	# @fileRes = read_names("output.txt");
    # "ok!!	"
    redirect "/monstas"
	# File.open("output.txt","a+") do |file|
	#     file.puts(@name)
	# end
	# erb :landing , {:locals => params , :layout => true}
end

post "/signin" do
    # do something to sign in the user
    "Here you can sign up for the next beginners course."
end



# functions
def store_name(file,inputString)
    File.open(file,"a+") do |file|
        file.puts(inputString)
    end
end

def read_names(file)
	return [] unless File.exist?(file)
	File.read(file).split("\n");
end