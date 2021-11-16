# frozen_string_literal: true

module HexletCode
  class Error < StandardError; end

  autoload :FormBuilder, 'hexlet_code/form_builder'
  autoload :FormTemplate, 'hexlet_code/form_template'
  autoload :Tag, 'hexlet_code/tag'
  autoload :Version, 'hexlet_code/version'
  autoload :Inputs, 'hexlet_code/inputs'

  def self.form_for(instance, attributes = {})
    form_builder = HexletCode::FormBuilder.new(instance, attributes)
    yield form_builder
    HexletCode::FormTemplate.render(form_builder.result)
  end
end
