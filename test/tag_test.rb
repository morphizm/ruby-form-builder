# frozen_string_literal: true

require 'test_helper'

class TagTest < Minitest::Test
  def test_build_single_tags
    [
      ['<br>', HexletCode::Tag.build('br')],
      ['<img src="path/to/image">', HexletCode::Tag.build('img', src: 'path/to/image')],
      ['<input type="submit" value="Save">', HexletCode::Tag.build('input', type: 'submit', value: 'Save')]
    ].each do |data|
      expected, actual = data
      assert_equal expected, actual
    end
  end

  def test_build_double_tags
    [
      ['<label>Email</label>', HexletCode::Tag.build('label') { 'Email' }],
      ['<label for="email">Email</label>', HexletCode::Tag.build('label', for: 'email') { 'Email' }],
      ['<div></div>', HexletCode::Tag.build('div')]
    ].each do |data|
      expected, actual = data
      assert_equal expected, actual
    end
  end
end
