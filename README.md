<h1 align="center">SERVIDOR NGINX</h1>

## Descrição

Este projeto contém scripts para instalação e verificações de status do servidor NGINX.

## Estrutura do Projeto

- **script-tempo.sh**: Script para verificar o tempo de resposta do servidor.
- **script-verificacao.sh**: Script para realizar verificações de status no servidor.
- **scripts-nginx.sh**: Script para configurar e gerenciar o servidor NGINX.

## Instruções de Uso

### instalação do linux ubuntu - usado para executar os scripts

O Linux Ubuntu é uma distribuição Linux baseada no Debian. Para instalar o Ubuntu, siga os passos abaixo:

1. Baixe a imagem ISO do Ubuntu no site oficial: [Ubuntu](https://ubuntu.com/download/desktop).
2. Grave a imagem ISO em um pendrive ou DVD.
3. Inicie o computador com o pendrive ou DVD.
4. Siga as instruções de instalação.

### instalação do servidor NGINX

Para instalar o servidor NGINX, execute o script `scripts-nginx.sh`:

```bash
# sudo apt install nginx -y // instalar o nginx
sudo apt install nginx -y

# sudo systemctl start nginx // iniciar o nginx
sudo systemctl start nginx 

# sudo systemctl status nginx // verificar o status do nginx
sudo systemctl status nginx 

```

### verificação do tempo de resposta do servidor

Para verificar o tempo de resposta do servidor, foi usado o crontab para rodar o script `script-tempo.sh` a cada 5 minutos.

link de referência: [crontab](https://docs.oracle.com/pt-br/learn/ol-crontab/)

```bash
crontab -e

#linha que define o tempo para o script rodar
*/5 * * * * /home/carlos-henrique/monitoramento_nginx.sh

```

### verificação de status do servidor

Para verificar o status do servidor, foi usado o crontab para rodar o script `script-verificacao.sh` a cada 5 minutos.

```bash 
SERVICE="nginx"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
if systemctl is-active --quiet $SERVICE; then
    echo "$TIMESTAMP - $SERVICE - ONLINE - Serviço está funcionando" >> ~/nginx_online.log
else
    echo "$TIMESTAMP - $SERVICE - OFFLINE - Serviço não está funcionando" >> ~/nginx_offline.log
fi
```

### resultados
- caso online 

```bash
 cat nginx_online.log
```

```bash
2024-10-19 11:50:14 - nginx - ONLINE - Serviço está funcionando
2024-10-19 11:50:37 - nginx - ONLINE - Serviço está funcionando
2024-10-19 11:52:21 - nginx - ONLINE - Serviço está funcionando
2024-10-22 15:10:01 - nginx - ONLINE - Serviço está funcionando
2024-10-22 15:11:01 - nginx - ONLINE - Serviço está funcionando
2024-10-22 15:12:01 - nginx - ONLINE - Serviço está funcionando
2024-10-22 15:13:01 - nginx - ONLINE - Serviço está funcionando
2024-10-22 15:14:01 - nginx - ONLINE - Serviço está funcionando
2024-10-22 15:15:01 - nginx - ONLINE - Serviço está funcionando
2024-10-22 15:16:01 - nginx - ONLINE - Serviço está funcionando
2024-10-22 15:17:01 - nginx - ONLINE - Serviço está funcionando
2024-10-22 15:18:01 - nginx - ONLINE - Serviço está funcionando
2024-10-22 15:19:01 - nginx - ONLINE - Serviço está funcionando
2024-10-22 15:20:01 - nginx - ONLINE - Serviço está funcionando
2024-10-22 15:21:01 - nginx - ONLINE - Serviço está funcionando

```

-caso offline

```bash
cat nginx_offline.log
```

```bash
2024-10-19 11:52:54 - nginx - OFFLINE - Serviço não está funcionando
2024-10-19 11:53:04 - nginx - OFFLINE - Serviço não está funcionando
2024-10-22 15:23:01 - nginx - OFFLINE - Serviço não está funcionando
2024-10-22 15:24:01 - nginx - OFFLINE - Serviço não está funcionando
2024-10-22 15:25:01 - nginx - OFFLINE - Serviço não está funcionando
2024-10-22 15:26:01 - nginx - OFFLINE - Serviço não está funcionando
2024-10-22 15:27:01 - nginx - OFFLINE - Serviço não está funcionando
2024-10-22 15:28:01 - nginx - OFFLINE - Serviço não está funcionando
2024-10-22 15:29:01 - nginx - OFFLINE - Serviço não está funcionando
2024-10-22 15:30:01 - nginx - OFFLINE - Serviço não está funcionando
2024-10-22 15:31:01 - nginx - OFFLINE - Serviço não está funcionando

```
### observações

- O diretorio pode ser criado em qualquer lugar, mas é importante que o caminho do arquivo seja alterado no script.
- Foi usado apenas 1 minuto para executar os testes, porem pode ser alterado para qualquer tempo desejado no crontab.

<h1 align=center>CARLOS HENRIQUE DE ALMEIDA MARTINS<h1>

