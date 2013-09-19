require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe 'bacula::storage::device' do

  let(:title) { 'bacula::device' }
  let(:node) { 'rspec.example42.com' }
  let(:facts) do
    {
      :ipaddress       => '10.42.42.42',
      :operatingsystem => 'Debian',
    }
  end

  describe 'Test device.conf is created with no options' do
    let(:params) do
      {
        :name => 'sample1',
      }
    end
    let(:expected) do
"Device {
Name = sample1
Device {
Media Type = ""
Archive Device = ""
Label Media = yes
Random Access = yes
Automatic Mount = yes
Removable Media = no
Always Open = false
"
    end
#    it { should contain_file('device-sample1.conf').with_path('/etc/bacula/storage.d/device-sample1.conf').with_content(expected) }
    it { should contain_file('device-sample1.conf').with_path('/device-sample1.conf').with_content(expected) }
  end

  describe 'Test device.conf is created with all main options' do
    let(:params) do
      {
        :name => 'sample2',
        :media_type => 'File01',
        :archive_device => '/backups/bacula_storage',
        :label_media => 'yes',
        :random_access => 'yes',
        :automatic_mount => 'yes',
        :removable_media => 'no' ,
        :always_open => false,
      }
    end
    let(:expected) do
"Device {
Name = sample2
Media Type = File01
Archive Device = /backups/bacula_storage
Label Media = yes
Random Access = yes
Automatic Mount = yes
Removable Media = no
Always Open = false
}
"
    end
    it { should contain_file('device-sample2.conf').with_path('/etc/bacula/storage.d/device-sample2.conf').with_content(expected) }
  end

end