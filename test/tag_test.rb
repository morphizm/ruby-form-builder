# frozen_string_literal: true

require 'test_helper'

class TagTest < Minitest::Test
  def test_build_single_tags
    assert_equal HexletCode::Tag.build('br'), '<br>'
    assert_equal HexletCode::Tag.build('img', src: 'path/to/image'), '<img src="path/to/image">'
    assert_equal HexletCode::Tag.build('input', type: 'submit', value: 'Save'), '<input type="submit" value="Save">'
  end

  def test_build_double_tags
    result1 = HexletCode::Tag.build('label') { 'Email' }
    assert_equal result1, '<label>Email</label>'

    result2 = HexletCode::Tag.build('label', for: 'email') { 'Email' }
    assert_equal result2, '<label for="email">Email</label>'

    result3 = HexletCode::Tag.build('div')
    assert_equal result3, '<div></div>'
  end
end
