# coding utf-8
require 'spec_helper'

describe 'Database.instance' do
  
  describe 'read' do
    before do 
      File.delete('data') if File.exist?('data')
    end
    context 'In the case of database is empty' do
      it 'get empty string' do
        expect(Database.instance.read).to eq ''
      end
    end
    after do 
      File.delete('data') if File.exist?('data')
    end
  end

  describe 'write' do
    before do
      File.delete('data') if File.exist?('data')
    end
    it 'get hoge string' do
      expect(Database.instance.write('hoge')).to eq "hoge\n"
      expect(Database.instance.read).to eq "hoge\n"
    end
    context 'many POST' do
      it 'Write word next line' do
        expect(Database.instance.write('hoge')).to eq "hoge\n"
        expect(Database.instance.read).to eq "hoge/n"
        expect(Database.instance.wirte('test')).to eq "hoge/ntest\n"
        expect(Database.instance.read).to eq "hoge/ntest\n"
      end
    end
  end

  describe 'update' do
    it 'rewrite' do
      File.delete('data') if File.exist?('data')
      expect(Database.instance.rewrite('hoge')).to eq "hoge\n"
      expect(Database.instance.read).to eq "hoge\n"

      Database.instance.write('hoge')

      expect(Database.instance.rewrite('hoge')).to eq "hoge\n"
      expect(Database.instance.read).to eq "hoge\n"
    end
  end

  describe 'dekete' do
    it 'all delete' do
      File.delete('data') if File.exist?('data')
      expect(Database.instance.delete).to eq ''
      expect(Database.instance.delete).to eq ''

      Database.instance.write('test')
      Database.instance.write('hoge')

      expect(Database.instance.delete).to eq ''
      expect(Database.instance.read).to eq ''
    end
    end
end

