task :default => "setup"

file "db.txt" do
  sh "wget https://raw.githubusercontent.com/nna774/OpenYo/master/db.txt"
end

task "strage" do
  sh "cd mysql; docker build -t openyo/storage ."
  sh "docker run --name=openyo-strage openyo/storage"
end

task "mysql" => ["strage"] do
  sh "docker run --name=openyo-mysql -e MYSQL_ROOT_PASSWORD=root --volumes-from openyo-strage -d mysql"
end

task "scheme" => ["mysql", "db.txt"] do
  sh "sleep 10"
  sh "cat db.txt | mysql -uroot -h $(docker inspect openyo-mysql | grep IPAddres | awk -F'\"' '{print $4}') -proot"
end

task "server" => ["mysql", "scheme"] do
  sh "docker build -t openyo/server ."
  sh "docker run -d --name openyo --link openyo-mysql:mysql -p 9293:9292 -t openyo/server"
end

task "setup" => ["server"] do
end

task "test" do
  token = `curl -d "api_ver=0.1&username=test&password=test" http://localhost:9293/config/create_user/ | awk  -F'"' '{print $6}'`
  sh "curl -d \"api_ver=0.1&username=test&password=test&kayac_id=nona7\" http://localhost:9293/config/add_imkayac/"
  sh "curl -d \"api_ver=0.1&username=test&api_token=#{token.chomp}\" http://localhost:9293/yo/"
end

task "kill" do
  sh "docker kill openyo-mysql"
  sh "docker rm openyo-mysql openyo-strage openyo"
end
