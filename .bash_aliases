alias docker-remove-exited='docker rm $(docker ps -f status=exited -q)'
alias docker-run-ssh-agent='docker run --rm -ti -v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK'
alias docker-images-remove-dangling='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias docker-images-pull-all='for i in $(docker images --filter "dangling=false" --format "{{.Repository}}"); do echo $i && docker pull $i; done'
alias g='googler'
alias node-shell='touch $HOME/.bash_history.node-shell;docker run -ti --env http_proxy --env https_proxy --rm -v $HOME/.bash_history.node-shell:/root/.bash_history -v ~/src:/src -h nodejs -p 3000:3000 node bash'
alias fx-shell='touch $HOME/fx-shell.bash_history;docker run -ti --env http_proxy --env https_proxy --rm --link fxdatafeed:fxdatafeed --link smtp:smtp --link signal-scan-redis:signal-scan-redis -v $HOME/fx/cfg:/etc/fxtrader -v $HOME/fx-shell.bash_history:/root/.bash_history -v ~/src:/src -h fx-shell fxtrader/finance-hostedtrader bash'
alias fx-db='docker run -it --rm --link fxdatafeed:mysql mariadb sh -c '"'"'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -ufxdatafeed -pfxdatafeed fxdatafeed'"'"''
alias fx-db-root='docker run -it --rm --link fxdatafeed:mysql mariadb sh -c '"'"'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -proot fxdatafeed'"'"''
alias fx-signal-redis='docker run -it --link signal-scan-redis:redis --rm redis redis-cli -h redis -p 6379'
alias fx-snipers-db='docker run -ti --link snipers-db:snipers-db postgres psql -h snipers-db snipers sniper'
alias fx-snipers-shell='touch $HOME/fx-snipers-shell.bash_history;docker run -ti --env http_proxy --env https_proxy --rm --link snipers-db:snipers-db --link smtp:smtp --link signal-scan-redis:signal-scan-redis -v $HOME/fx-snipers-shell.bash_history:/root/.bash_history -v ~/src:/src -h fx-snipers-shell fxtrader/snipers-api bash'
