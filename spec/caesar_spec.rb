require './lib/caesar_cipher.rb'

describe CaesarCipher do

  describe '.encrypt' do
    it 'shifts lowercase letters correctly using class method' do
      expect(CaesarCipher.encrypt('hello', 3)).to eq('khoor')
    end

    it 'shifts uppercase letters correctly using class method' do
      expect(CaesarCipher.encrypt('HELLO', 3)).to eq('KHOOR')
    end

    it 'handles negative shifts correctly' do
      expect(CaesarCipher.encrypt('hello', -3)).to eq('ebiil')
    end

    it 'handles large shift values' do
      expect(CaesarCipher.encrypt('hello', 29)).to eq('khoor')
    end

    it 'handles mixed case letters with shift' do
      expect(CaesarCipher.encrypt('Hello, World!', 3)).to eq('Khoor, Zruog!')
    end

    it 'wraps around the alphaber when shift exceeds 26' do
      expect(CaesarCipher.encrypt('xyz', 3)).to eq('abc')
      expect(CaesarCipher.encrypt('XYZ', 3)).to eq('ABC')
    end
  end
end
