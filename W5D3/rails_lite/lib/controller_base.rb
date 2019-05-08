require 'active_support'
require 'active_support/core_ext'
require 'erb'
require 'active_support/inflector'
require_relative './session'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res, params)
    @req = req
    @res = res
    @params = params
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  # Set the response status code and header
  def redirect_to(url)
    raise "Already Built Response" if already_built_response?
    @res.status = 302
    @res.set_header("Location", url)
    session.store_session(@res)
    @already_built_response = true
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise "Already Built Response" if already_built_response?
    @res.set_header("Content-Type", content_type)
    @res.write(content)
    session.store_session(@res)
    @already_built_response = true
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    view_folder = "#{self.class}".underscore
    view_file_path = File.join(File.dirname(__FILE__), "..","views", view_folder, "#{template_name}.html.erb")
    content = File.read(view_file_path)
    erb_content = ERB.new(content).result(binding)
    render_content(erb_content, "text/html")
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
    Router.send(name)
    render name unless already_built_response?
  end
end

