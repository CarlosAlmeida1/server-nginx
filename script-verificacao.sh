SERVICE="nginx"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
if systemctl is-active --quiet $SERVICE; then
    echo "$TIMESTAMP - $SERVICE - ONLINE - Serviço está funcionando" >> ~/nginx_online.log
else
    echo "$TIMESTAMP - $SERVICE - OFFLINE - Serviço não está funcionando" >> ~/nginx_offline.log
fi

# resultados com nginx rodando
#~/nginx_online.log
2024-10-19 11:50:14 - nginx - ONLINE - Serviço está funcionando
2024-10-19 11:50:37 - nginx - ONLINE - Serviço está funcionando
2024-10-19 11:52:21 - nginx - ONLINE - Serviço está funcionando

#resultados com nginx parado
2024-10-19 11:52:54 - nginx - OFFLINE - Serviço não está funcionando
2024-10-19 11:53:04 - nginx - OFFLINE - Serviço não está funcionando