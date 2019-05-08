require 'rack'

app = Proc.new do |env|
    req = Rack::Request.new(env)
    res = Rack::Response.new
    
    res.set_header("Content-Type", "text/html")
    res.write("Hello world!")

    res.finish
end
#########

app2 = Proc.new do |env|
    req = Rack::Request.new(env)
    res = Rack::Response.new

    res.set_header("Content-Type", "text/html")
    res.write(req.path)

    res.finish
end

Rack::Server.start(
    app: app2,
    Port: 3000
)



