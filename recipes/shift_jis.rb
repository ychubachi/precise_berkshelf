execute "Install SHIFT_JIS locale" do
  command "sudo localedef -f SHIFT_JIS -i ja_JP ja_JP.SJIS"
  action :run
  not_if "locale -a | grep -q ja_JP.sjis"
end
