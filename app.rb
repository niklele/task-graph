require 'sinatra'
require 'graphviz'

get '/testgraph' do
    # Create a new graph
    g = GraphViz.new( :G, :type => :digraph )

    # Create two nodes
    hello = g.add_nodes( "Hello" )
    world = g.add_nodes( "World" )

    # Create an edge between the two nodes
    g.add_edges( hello, world )

    # Generate output image
    # g.output( :png => "hello_world.png" )
    return g.output( :none => String)

end

get '/' do
    send_file File.join(settings.public_folder, 'index.html')
end