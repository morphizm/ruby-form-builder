# frozen_string_literal: true

module HexletCode
  class FormFor
    def initialize(instance)
      @instance = instance
      @result = []
    end

    def input(instance_attribute, attributes = {})
      tag_name = attributes.fetch(:as, 'input')
      value = @instance.public_send(instance_attribute)
      html = if tag_name == :text
               HexletCode::Tag.build('textarea', cols: 20, rows: 40, name: instance_attribute) { value }
             else
               HexletCode::Tag.build(tag_name, name: instance_attribute, type: 'text', value: value)
             end
      label(instance_attribute)
      @result << html
    end

    def label(attribute)
      html = HexletCode::Tag.build('label', for: attribute) { attribute.capitalize }
      @result << html
    end

    def submit(value = 'Save')
      html = HexletCode::Tag.build('input', name: 'commit', type: 'submit', value: value)
      @result << html
    end
  end
end
